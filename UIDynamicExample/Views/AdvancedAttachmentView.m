#import "AdvancedAttachmentView.h"
#import "BallView.h"

@implementation AdvancedAttachmentView {
    UIDynamicAnimator *animator;
    UIAttachmentBehavior *dragBehaviour;
    NSMutableArray *ballViews;
    UIPanGestureRecognizer *panGestureRecognizer;
}
- (id)init {
    self = [super init];
    if (self) {
        [self buildBall];
        [self setupAnimatorAndGestureRecognizer];
        [self addBehaviour];
    }

    return self;
}

- (void)setupAnimatorAndGestureRecognizer {
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleAttachmentGesture:)];
}

- (void)buildBall {
    ballViews = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < 4; i++) {
        UIView *view = [[BallView alloc] init];
        view.center = CGPointMake(80 + i * 50, 400);
        [self addSubview:view];
        ballViews[i] = view;
    }
}

- (void)addBehaviour {
    for (NSUInteger i = 0; i < [ballViews count] - 1; i++) {
        UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:ballViews[i] attachedToItem:ballViews[i + 1]];
        [animator addBehavior:attachmentBehavior];
    }
    [self addGestureRecognizer:panGestureRecognizer];
}

- (void)handleAttachmentGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        [self initDragBehaviourWithAnchorPosition:[gestureRecognizer locationInView:self]];
        [animator addBehavior:dragBehaviour];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        [dragBehaviour setAnchorPoint:[gestureRecognizer locationInView:self]];
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [animator removeAllBehaviors];
        [self removeGestureRecognizer:panGestureRecognizer];
        [self addGravityAfterDragEnded];
    }
}

- (void)addGravityAfterDragEnded {
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:ballViews];
    [animator addBehavior:gravityBehavior];

    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:ballViews];
    [collisionBehavior setTranslatesReferenceBoundsIntoBoundary:YES];
    [animator addBehavior:collisionBehavior];
}

- (void)initDragBehaviourWithAnchorPosition:(CGPoint)anchorPosition {
    UIView *ballView = ballViews[0];
    dragBehaviour = [[UIAttachmentBehavior alloc] initWithItem:ballView attachedToAnchor:anchorPosition];
    double length = [self getDistanceBetweenAnchor:anchorPosition andBallView:ballView];
    [dragBehaviour setLength:((CGFloat) length  < 20) ? (CGFloat) length : 20];
}

- (double)getDistanceBetweenAnchor:(CGPoint)anchor andBallView:(UIView *)ballView {
    return sqrt(pow((anchor.x - ballView.center.x), 2.0) + pow((anchor.y - ballView.center.y), 2.0));
}

@end