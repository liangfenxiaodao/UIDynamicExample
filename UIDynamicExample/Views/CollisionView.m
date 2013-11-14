#import "CollisionView.h"

@implementation CollisionView {
    UIImageView *_imageView;
}

- (id)init {
    self = [super init];
    if (self) {
        [self addDynamicBehaviour];
        [self createBangImage];
    }
    return self;
}

- (void)addDynamicBehaviour {
    theAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[ballView]];
    [theAnimator addBehavior:gravityBehavior];

    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[ballView]];
    [collisionBehavior setTranslatesReferenceBoundsIntoBoundary:YES];
    [theAnimator addBehavior:collisionBehavior];

    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[ballView]];
    [itemBehavior setElasticity:0.6];
    [theAnimator addBehavior:itemBehavior];
    [collisionBehavior setCollisionDelegate:self];
}

- (void)createBangImage {
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bang.png"]];
    [_imageView setFrame:CGRectMake(100, [UIScreen mainScreen].bounds.size.height - 100, 40, 40)];
    [_imageView.layer setHidden:YES];
    [self addSubview:_imageView];
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior
      endedContactForItem:(id <UIDynamicItem>)item
   withBoundaryIdentifier:(id <NSCopying>)identifier {
    [self bang];
}

- (void)bang {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"hidden"];
    [animation setToValue:[NSNumber numberWithBool:NO]];
    [animation setDuration:0.2];
    [animation setRemovedOnCompletion:YES];
    [_imageView.layer addAnimation:animation forKey:nil];
}


@end