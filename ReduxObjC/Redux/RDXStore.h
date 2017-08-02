//
//  RDXStore.h
//  ReduxObjC
//
//  Created by Nelson on 2017/8/3.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "RDXReducer.h"
#import "RDXConstant.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * The RDXStore object retains all reducers and the state (the single source of truth).
 * You dispatch an `RDXAction` object to it, and it passes current state and the action object to all reduce blocks.
 * After all reduce blocks are invoked, notification named `RDXStateDidChangeNotification` is sent, the sender is the store object and the userInfo is `nil`.
 */
@interface RDXStore : NSObject
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/**
 * Creates a store object with an array of `RDXReduceBlock`s and an initial state.
 *
 * @param reducers An array of reduce blocks.
 * @param initialState Initial state.
 * @return A store object.
 */
- (instancetype)initWithReducers:(NSArray <RDXReduceBlock> *)reducers state:(id <RDXState> )initialState NS_DESIGNATED_INITIALIZER;

/**
 * Asks the receiver to dispatch an action and returns immediately.
 * The receiver passes current state and the action object to all reduce blocks.
 * After all reduce blocks are invoked, notification named `RDXStateDidChangeNotification` is sent, the sender is the store object and the userInfo is `nil`.
 *
 * @param action The action object to be dispatched.
 */
- (void)dispatchAction:(__kindof RDXAction *)action;

/**
 * Asks the receiver for current state.
 *
 * @return A deep copy instance of current state.
 */
- (id <RDXState> )currentState;

@end

NS_ASSUME_NONNULL_END
