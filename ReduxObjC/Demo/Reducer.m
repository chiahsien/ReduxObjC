//
//  Reducer.m
//  ReduxObjC
//
//  Created by Nelson on 2017/8/3.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "Reducer.h"
#import "Action.h"
#import "State.h"

@implementation Reducer

+ (RDXReduceBlock)increaseReducer {
    RDXReduceBlock reducer = ^(State *state, Action *action) {
        if ([action.identifier isEqualToString:ActionIdentifierIncreaseCount]) {
            state.count++;
        }
    };
    return reducer;
}

+ (RDXReduceBlock)decreaseReducer {
    RDXReduceBlock reducer = ^(State *state, Action *action) {
        if ([action.identifier isEqualToString:ActionIdentifierDecreaseCount]) {
            state.count--;
        }
    };
    return reducer;
}

+ (NSArray <RDXReduceBlock> *)reducers {
    return @[
        [self increaseReducer],
        [self decreaseReducer]
    ];
}

@end
