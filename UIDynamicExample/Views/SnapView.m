#import "SnapView.h"
#import "BallView.h"

@implementation SnapView {
    float radius;
    float circleCenterX;
    float circleCenterY;
    UIDynamicAnimator *theAnimator;
    int count;
    int ballNumber;
    UIButton *dropBallButton;
}

- (id)init {
    self = [super init];
    if (self) {
        radius = 40;
        circleCenterX = 120;
        circleCenterY = 200;
        theAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
        [self addCircle];
        [self addButton];
    }

    return self;
}

- (void)addCircle {
    UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(120, 200, 2 * radius, 2 * radius)];
    circle.backgroundColor = [UIColor blackColor];
    circle.layer.cornerRadius = 40;
    [self addSubview:circle];
}

- (void)addButton {
    dropBallButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [dropBallButton setFrame:CGRectMake(110, 400, 100, 20)];
    [dropBallButton setTitle:@"Drop ball" forState:UIControlStateNormal];
    [dropBallButton addTarget:self action:@selector(dropBall) forControlEvents:UIControlEventTouchDown];
    [self addSubview:dropBallButton];
}

- (void)dropBall {
    [self resetStatus];
    UIView *ballView = [self addBallView];
    [self addDynamicBehaviour:ballView];
    ballNumber++;
}

- (void)addDynamicBehaviour:(UIView *)ballView {
    UIGravityBehavior *gravityBehaviour = [[UIGravityBehavior alloc] initWithItems:@[ballView]];
    [gravityBehaviour setAction:^{
        count++;
        if (count == 50) {
            UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:ballView
                                                                    snapToPoint:CGPointMake([self getPositionXFor:ballNumber * M_PI / 3], [self getPositionYFor:ballNumber * M_PI / 3])];
            [theAnimator addBehavior:snapBehavior];
            [dropBallButton setEnabled:ballNumber != 6];
        }
    }];
    [theAnimator addBehavior:gravityBehaviour];
}

- (void)resetStatus {
    count = 0;
    [theAnimator removeAllBehaviors];
    [dropBallButton setEnabled:NO];
}

- (double)getPositionYFor:(double)radian {
    return circleCenterY + radius + radius * sin(radian);
}

- (double)getPositionXFor:(double)radian {
    return circleCenterX + radius + radius * cos(radian);
}

- (UIView *)addBallView {
    UIView *ballView = [[BallView alloc] init];
    ballView.center = CGPointMake(50, 100);
    [self addSubview:ballView];
    return ballView;
}

@end