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
    theAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    UIGravityBehavior *gravityBehaviour = [[UIGravityBehavior alloc] initWithItems:@[ballView]];
    [theAnimator addBehavior:gravityBehaviour];
}
@end