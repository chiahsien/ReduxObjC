//
//  RDXState.h
//  ReduxObjC
//
//  Created by Nelson on 2017/8/3.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * In order to deep copy the state via
 * `[NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:state]]`,
 * the `RDXState` protocol needs to conform to `<NSCoding> protocol.
 */
@protocol RDXState <NSCoding>
@end
