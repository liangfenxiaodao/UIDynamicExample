#import "CollisionView.h"
#import "BallView.h"

@implementation CollisionView {
    UIView *ballView;
    UIDynamicAnimator *_animator;
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
    [animator addBehavior:gravityBehavior];

    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[ballView]];
    [collisionBehavior setTranslatesReferenceBoundsIntoBoundary:YES];
    [animator addBehavior:collisionBehavior];
    _animator = animator;
}

@end