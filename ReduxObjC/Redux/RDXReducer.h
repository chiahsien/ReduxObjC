//
//  RDXReducer.h
//  ReduxObjC
//
//  Created by Nelson on 2017/8/3.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "RDXState.h"
#import "RDXAction.h"

/**
 * Defines a reduce block that takes state and action as parameters.
 * The state will be modified in the block if the block responses to the action.
 * Something to notice:
 * - The block is executed synchronously, no asynchronous operation in this block.
 * - The block should have no side-effect except to modify the `state`.
 * - Execution order of each block is not guaranteed, don't expect a block will be executed before/after certain block.
 *
 * @param state Current state.
 * @param action An action object.
 */
typedef void (^RDXReduceBlock)(id <RDXState> state, id <RDXAction> action);

@protocol RDXReducer

/**
 * Returns an array of reducer blocks.
 *
 * @return An array of `RDXReduceBlock`s.
 */
+ (NSArray <RDXReduceBlock> *)reducers;

@end
