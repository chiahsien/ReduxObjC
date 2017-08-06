//
//  ViewController.m
//  ReduxObjC
//
//  Created by Nelson on 2017/8/3.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "ViewController.h"

#import "Store.h"
#import "Action.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation ViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateCount:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCount:) name:RDXStateDidChangeNotification object:nil];
}

- (IBAction)decreaseCount:(id)sender {
    Action *action = [[Action alloc] initWithActionIdentifier:ActionIdentifierDecreaseCount payload:nil];
    [[Store sharedStore] dispatchAction:action];
}

- (IBAction)increaseCount:(id)sender {
    Action *action = [[Action alloc] initWithActionIdentifier:ActionIdentifierIncreaseCount payload:nil];
    [[Store sharedStore] dispatchAction:action];
}

- (void)updateCount:(NSNotification *)note {
    State *state = (State *)[[Store sharedStore] currentState];
    self.label.text = [NSString stringWithFormat:@"%ld", state.count];
}

@end
