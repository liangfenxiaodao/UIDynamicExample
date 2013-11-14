#import "AttachmentView.h"

@implementation AttachmentView

- (id)init {
    self = [super init];
    if (self) {
        [self addGravity];
    }
    return self;
}

- (void)addGravity {
    theAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    UIGravityBehavior *gravityBehaviour = [[UIGravityBehavior alloc] initWithItems:@[ballView]];
    [theAnimator addBehavior:gravityBehaviour];

    UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:ballView attachedToAnchor:CGPointMake(100, 0)];
    [attachmentBehavior setLength:300];
    [attachmentBehavior setDamping:0.1];
    [attachmentBehavior setFrequency:5];
    [theAnimator addBehavior:attachmentBehavior];

}
@end