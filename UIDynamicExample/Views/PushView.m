#import "PushView.h"

@implementation PushView {
    UIView *barView;
    UIDynamicAnimator *theAnimator;
}
- (id)init {
    self = [super init];
    if (self) {
        [self addBar];
        theAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    }

    return self;
}

- (void)addBar {
    barView = [[UIView alloc] initWithFrame:CGRectMake(140, 200, 10, 100)];
    [barView setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:barView];

    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [self addGestureRecognizer:recognizer];
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if ([self gestureHitsBarView:gestureRecognizer]) {
            UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[barView] mode:UIPushBehaviorModeInstantaneous];
            [pushBehavior setPushDirection:CGVectorMake([gestureRecognizer velocityInView:self].x /5000.f, 0)];
            [theAnimator addBehavior:pushBehavior];
        }
    }
}

- (BOOL)gestureHitsBarView:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint locationInView = [gestureRecognizer locationInView:self];
    return barView.left <= locationInView.x && locationInView.y <= barView.top + barView.height;
}

@end