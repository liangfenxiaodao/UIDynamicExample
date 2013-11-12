#import "AdvancedCollisionView.h"
#import "BallView.h"

@implementation AdvancedCollisionView {
    UIView *ballView;
    UIDynamicAnimator *_animator;
}

- (id)init {
    self = [super init];
    if (self) {
        [self buildGravityItem];
    }

    return self;
}

- (void)buildGravityItem {
    ballView = [[BallView alloc] init];
    ballView.center = CGPointMake(100, 40);
    [self addSubview:ballView];
}

@end