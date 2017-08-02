//
//  RDXAction.m
//  ReduxObjC
//
//  Created by Nelson on 2017/8/2.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "RDXAction.h"

@interface RDXAction ()
@property (nonatomic, copy, readwrite) NSString *type;
@property (nonatomic, strong, readwrite, nullable) id payload;
@end

@implementation RDXAction

+ (instancetype)actionWithType:(NSString *)type payload:(nullable id)payload {
    return [[self alloc] initWithActionType:type payload:payload];
}

- (instancetype)initWithActionType:(NSString *)type payload:(id)payload {
    if (self = [super init]) {
        _type = [type copy];
        _payload = payload;
    }
    return self;
}

@end
