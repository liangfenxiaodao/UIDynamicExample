#import "UIView+Category.h"

@implementation UIView (Category)

- (CGFloat)left {
    return [self frame].origin.x;
}

- (CGFloat)top {
    return [self frame].origin.y;
}

- (CGFloat)width {
    return [self frame].size.width;
}

- (CGFloat)height {
    return [self frame].size.height;
}

- (CGPoint)origin {
    return [self frame].origin;
}

@end

