#import "BaseViewWithBall.h"
#import "BallView.h"

@implementation BaseViewWithBall {

}

- (id)init {
    self = [super init];
    if (self) {
        [self buildBall];
    }
    return self;
}


- (void)buildBall {
    ballView = [[BallView alloc] init];
    ballView.center = CGPointMake(100, 100);
    [self addSubview:ballView];
}
@end