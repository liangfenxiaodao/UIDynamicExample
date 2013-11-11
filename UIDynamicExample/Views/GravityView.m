#import "GravityView.h"
#import "BallView.h"

@implementation GravityView {
    UIView *ballView;
    UIDynamicAnimator *theAnimator;
}

- (id)init {
    self = [super init];
    if (self) {
        [self buildGravityItem];
        [self addGravity];
        [self addRestartButton];
    }
    return self;
}


- (void)buildGravityItem {
    ballView = [[BallView alloc] init];
    ballView.center = CGPointMake(100, 40);
    [self addSubview:ballView];
}

- (void)addGravity {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    UIGravityBehavior *gravityBehaviour = [[UIGravityBehavior alloc] initWithItems:@[ballView]];
    [animator addBehavior:gravityBehaviour];
    theAnimator = animator;
}

- (void)addRestartButton {
    UIButton *restartButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [restartButton setTitle:@"Restart" forState:UIControlStateNormal];
    [restartButton setFrame:CGRectMake(20, 20, 100, 40)];
    [restartButton addTarget:self action:@selector(restart) forControlEvents:UIControlEventTouchDown];
    [self addSubview:restartButton];
}

- (void)restart {
    [self buildGravityItem];
    [self addGravity];
}
@end