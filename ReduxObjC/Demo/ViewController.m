//
//  ViewController.m
//  ReduxObjC
//
//  Created by Nelson on 2017/8/3.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "ViewController.h"
#import "RDXStore.h"

#import "State.h"
#import "Reducer.h"
#import "Action.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, strong) RDXStore *store;
@end

@implementation ViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    State *state = [[State alloc] init];
    NSArray *reducers = [Reducer reducers];
    self.store = [[RDXStore alloc] initWithReducers:reducers state:state];
    [self updateCount:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCount:) name:RDXStateDidChangeNotification object:nil];
}

- (IBAction)decreaseCount:(id)sender {
    Action *action = [[Action alloc] initWithActionIdentifier:ActionIdentifierDecreaseCount payload:nil];
    [self.store dispatchAction:action];
}

- (IBAction)increaseCount:(id)sender {
    Action *action = [[Action alloc] initWithActionIdentifier:ActionIdentifierIncreaseCount payload:nil];
    [self.store dispatchAction:action];
}

- (void)updateCount:(NSNotification *)note {
    State *state = (State *)[self.store currentState];
    self.label.text = [NSString stringWithFormat:@"%ld", state.count];
}

@end
