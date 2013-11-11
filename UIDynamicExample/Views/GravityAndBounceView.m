#import "GravityAndBounceView.h"
#import "BallView.h"

@implementation GravityAndBounceView {
    UIView *ballView;
}

- (id)init {
    self = [super init];
    if (self) {
        [self buildGravityItem];
        [self addDynamicBehaviour];
    }

    return self;
}

- (void)buildGravityItem {
    ballView = [[BallView alloc] init];
    ballView.center = CGPointMake(100, 40);
    [self addSubview:ballView];
}

- (void)addDynamicBehaviour {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[ballView]];
}
@end