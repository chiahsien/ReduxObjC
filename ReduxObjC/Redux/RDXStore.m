//
//  RDXStore.m
//  ReduxObjC
//
//  Created by Nelson on 2017/8/3.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "RDXStore.h"

NSNotificationName const RDXStateDidChangeNotification = @"RDXStateDidChangeNotification";

@interface RDXStore ()
@property (nonatomic, strong) id <RDXState> state;
@property (nonatomic, copy) NSArray <RDXReduceBlock> *reducers;
@property (nonatomic, strong) NSNotificationQueue *notificationQueue;
@property (nonatomic, strong) dispatch_queue_t operationQueue;
@end

@implementation RDXStore

#pragma mark - Public methods

- (instancetype)initWithReducers:(NSArray <RDXReduceBlock> *)reducers state:(id <RDXState> )initialState {
    if (self = [super init]) {
        _reducers = [reducers copy];
        _state = initialState;

        _notificationQueue = [[NSNotificationQueue alloc] initWithNotificationCenter:[NSNotificationCenter defaultCenter]];
        _operationQueue = dispatch_queue_create("RDXStore Operation Queue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)dispatchAction:(id <RDXAction> )action {
    dispatch_async(self.operationQueue, ^{
        for (RDXReduceBlock block in self.reducers) {
            block(self.state, action);
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            NSNotification *note = [NSNotification notificationWithName:RDXStateDidChangeNotification object:self];
            [self.notificationQueue enqueueNotification:note
                                           postingStyle:NSPostASAP
                                           coalesceMask:(NSNotificationCoalescingOnName | NSNotificationCoalescingOnSender)
                                               forModes:nil];
        });
    });
}

- (id <RDXState> )currentState {
    __block id <RDXState> copiedState;
    dispatch_sync(self.operationQueue, ^{
        copiedState = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:self.state]];
    });
    return copiedState;
}

@end
