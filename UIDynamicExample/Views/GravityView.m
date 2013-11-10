#import "GravityViewController.h"
#import "GravityView.h"
#import "BallView.h"

@implementation GravityView{
    UIView *ballView;
}

- (id)init {
    self = [super init];
    if (self) {
        [self buildGravityItem];
        [self addGravity];
    }

    return self;
}


- (void)buildGravityItem {
    ballView = [[BallView alloc] init];
    ballView.center = CGPointMake(100, 40);
    [self addSubview:ballView];
}

- (void) addGravity {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    UIGravityBehavior *gravityBehaviour = [[UIGravityBehavior alloc] initWithItems:@[ballView]];
    [animator addBehavior:gravityBehaviour];
    self.animator = animator;
}
@end