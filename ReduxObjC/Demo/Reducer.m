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
    RDXReduceBlock reducer = ^(State *state, RDXAction *action) {
        if ([action.type isEqualToString:ActionTypeIncreaseCount]) {
            state.count++;
        }
    };
    return reducer;
}

+ (RDXReduceBlock)decreaseReducer {
    RDXReduceBlock reducer = ^(State *state, RDXAction *action) {
        if ([action.type isEqualToString:ActionTypeDecreaseCount]) {
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
