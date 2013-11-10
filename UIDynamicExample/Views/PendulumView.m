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
;
}

- (void)addPendulumBehaviour {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
}

@end
