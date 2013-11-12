#import "BallView.h"

@implementation BallView {

}

- (id)init {
    self = [super init];
    if (self) {
        [self setFrame:CGRectMake(0, 0, 40, 40)];
        self.backgroundColor = [UIColor lightGrayColor];
        self.layer.cornerRadius = 20;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 2;
    }
    return self;
}

@end