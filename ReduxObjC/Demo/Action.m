//
//  Action.m
//  ReduxObjC
//
//  Created by Nelson on 2017/8/3.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "Action.h"

NSString * const ActionIdentifierIncreaseCount = @"ActionIdentifierIncreaseCount";
NSString * const ActionIdentifierDecreaseCount = @"ActionIdentifierDecreaseCount";

@interface Action ()
@property (nonatomic, copy, readwrite) NSString *identifier;
@property (nonatomic, strong, readwrite, nullable) id payload;
@end

@implementation Action

+ (instancetype)actionWithIdentifier:(NSString *)identifier payload:(nullable id)payload {
    return [[self alloc] initWithActionIdentifier:identifier payload:payload];
}

- (instancetype)initWithActionIdentifier:(NSString *)identifier payload:(id)payload {
    if (self = [super init]) {
        _identifier = [identifier copy];
        _payload = payload;
    }
    return self;
}

@end
