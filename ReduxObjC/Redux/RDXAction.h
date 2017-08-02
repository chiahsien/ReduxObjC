//
//  RDXAction.h
//  ReduxObjC
//
//  Created by Nelson on 2017/8/2.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * The Redux Action object represents an action type and its payload.
 */
@interface RDXAction : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/**
 * The action type. Each action should has unique type.
 */
@property (nonatomic, copy, readonly) NSString *type;

/**
 * Extra information attached to this action.
 */
@property (nonatomic, strong, readonly, nullable) id payload;

/**
 * Creates an action object with specific type and optional payload.
 *
 * @param type The action type.
 * @param payload The extra information attached to this action.
 * @return Newly created action object.
 */
+ (instancetype)actionWithType:(NSString *)type payload:(nullable id)payload;

/**
 * Creates an action object with specific type and optional payload.
 *
 * @param type The action type.
 * @param payload The extra information attached to this action.
 * @return Newly created action object.
 */
- (instancetype)initWithActionType:(NSString *)type payload:(nullable id)payload NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
