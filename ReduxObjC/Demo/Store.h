//
//  Store.h
//  ReduxObjC
//
//  Created by Nelson on 2017/8/6.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "RDXStore.h"
#import "State.h"

@interface Store : RDXStore

+ (instancetype)sharedStore;

@end
