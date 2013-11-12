#import "GravityView.h"

@implementation GravityView {
}

- (id)init {
    self = [super init];
    if (self) {
        [self addGravity];
    }
    return self;
}

- (void)addGravity {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    UIGravityBehavior *gravityBehaviour = [[UIGravityBehavior alloc] initWithItems:@[ballView]];
    [animator addBehavior:gravityBehaviour];
    theAnimator = animator;
}
@end