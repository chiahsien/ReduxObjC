//
//  Store.m
//  ReduxObjC
//
//  Created by Nelson on 2017/8/6.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "Store.h"
#import "Reducer.h"

@implementation Store

+ (instancetype)sharedStore {
    static id _sharedStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedStore = [[self alloc] init];
    });

    return _sharedStore;
}

- (instancetype)init {
    NSArray *reducers = [Reducer reducers];
    State *initialState = [[State alloc] init];

    self = [super initWithReducers:reducers state:initialState];
    return self;
}

@end
