#import "BasicCollisionView.h"

@implementation BasicCollisionView {
    BOOL collisionEnded;
}

- (id)init {
    self = [super init];
    if (self) {
        [self addDynamicBehaviour];
    }
    return self;
}

- (void)addDynamicBehaviour {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[ballView]];
    [animator addBehavior:gravityBehavior];

    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[ballView]];
    [collisionBehavior setTranslatesReferenceBoundsIntoBoundary:YES];
    [animator addBehavior:collisionBehavior];
    [collisionBehavior setCollisionDelegate:self];
    theAnimator = animator;
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(id <NSCopying>)identifier {
    if (collisionEnded) {
        return;
    }
    collisionEnded = true;

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:ballView.layer.position];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake([UIScreen mainScreen].bounds.size.width - ballView.frame.size.width / 2, [UIScreen mainScreen].bounds.size.height - ballView.frame.size.height / 2)];
    animation.duration = 1;
    [animation setRemovedOnCompletion:NO];
    animation.fillMode = kCAFillModeForwards;
    [ballView.layer addAnimation:animation forKey:nil];
}


@end