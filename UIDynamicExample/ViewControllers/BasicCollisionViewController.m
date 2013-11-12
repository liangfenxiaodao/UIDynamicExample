#import "BasicCollisionViewController.h"
#import "BasicCollisionView.h"

@implementation BasicCollisionViewController

- (id)init {
    self = [super init];
    if (self) {
        [self.navigationItem setTitle:@"Basic Collision"];
    }

    return self;
}

- (void)loadView {
    self.view = [[BasicCollisionView alloc] init];
}

@end