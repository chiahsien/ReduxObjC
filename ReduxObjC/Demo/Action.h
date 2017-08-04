//
//  Action.h
//  ReduxObjC
//
//  Created by Nelson on 2017/8/3.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "RDXAction.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString * const ActionIdentifierIncreaseCount;
extern NSString * const ActionIdentifierDecreaseCount;

@interface Action : NSObject <RDXAction>

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/**
 * Creates an action object with specific type and optional payload.
 *
 * @param identifier The action identifier.
 * @param payload    The extra information attached to this action.
 * @return Newly created action object.
 */
+ (instancetype)actionWithIdentifier:(NSString *)identifier payload:(nullable id)payload;

/**
 * Creates an action object with specific type and optional payload.
 *
 * @param identifier The action identifier.
 * @param payload    The extra information attached to this action.
 * @return Newly created action object.
 */
- (instancetype)initWithActionIdentifier:(NSString *)identifier payload:(nullable id)payload NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
