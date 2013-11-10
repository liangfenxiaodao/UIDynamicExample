#import "GravityViewController.h"
#import "GravityView.h"

@implementation GravityView{
    UIView *ballBearing;
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
    ballBearing = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    ballBearing.backgroundColor = [UIColor lightGrayColor];
    ballBearing.layer.cornerRadius = 10;
    ballBearing.layer.borderColor = [UIColor grayColor].CGColor;
    ballBearing.layer.borderWidth = 2;
    ballBearing.center = CGPointMake(100, 40);
    [self addSubview:ballBearing];
}

- (void) addGravity {
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    UIGravityBehavior *gravityBehaviour = [[UIGravityBehavior alloc] initWithItems:@[ballBearing]];
    [animator addBehavior:gravityBehaviour];
    self.animator = animator;
}
@end