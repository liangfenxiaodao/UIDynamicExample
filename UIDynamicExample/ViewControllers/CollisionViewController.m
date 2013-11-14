#import "CollisionViewController.h"
#import "CollisionView.h"

@implementation CollisionViewController

- (id)init {
    self = [super init];
    if (self) {
        [self.navigationItem setTitle:@"Basic Collision"];
    }

    return self;
}

- (void)loadView {
    self.view = [[CollisionView alloc] init];
}

@end