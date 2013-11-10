//
//  PendulumView.m
//  UIDynamicExample
//
//  Created by jli on 11/8/13.
//
//

#import "PendulumView.h"

@implementation PendulumView

- (id)init
{
    self = [super init];
    if (self) {
        [self buildPendulum];
    }
    return self;
}

- (void)buildPendulum {
    UIView *ballBearing = [[UIView alloc] initWithFrame:CGRectMake(0,0,40,40)];
    ballBearing.backgroundColor = [UIColor lightGrayColor];
    ballBearing.layer.cornerRadius = 10;
    ballBearing.layer.borderColor = [UIColor grayColor].CGColor;
    ballBearing.layer.borderWidth = 2;
    ballBearing.center = CGPointMake(200, 300);
    [self addSubview:ballBearing];
}

- (void)addPendulumBehaviour {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
}

@end
