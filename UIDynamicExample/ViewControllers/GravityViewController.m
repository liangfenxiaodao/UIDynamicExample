#import "GravityViewController.h"
#import "GravityView.h"

@implementation GravityViewController

- (id)init {
    self = [super init];
    if (self) {
        [self.navigationItem setTitle:@"Gravity"];
    }

    return self;
}


- (void)loadView {
    self.view = [[GravityView alloc] init];
}

@end