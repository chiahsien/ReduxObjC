//
//  RDXAction.h
//  ReduxObjC
//
//  Created by Nelson on 2017/8/2.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RDXAction

/**
 * The action identifier. Each action should has unique identifier.
 */
@property (nonatomic, copy, readonly) NSString *identifier;

/**
 * Extra information attached to this action.
 */
@property (nonatomic, strong, readonly, nullable) id payload;

@end

NS_ASSUME_NONNULL_END
