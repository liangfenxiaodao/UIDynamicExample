#import "AdvancedCollisionViewController.h"
#import "AdvancedCollisionView.h"

@implementation AdvancedCollisionViewController {

}

- (id)init {
    self = [super init];
    if (self) {
        [self.navigationItem setTitle:@"Advance Collision"];
    }
    return self;
}

- (void)loadView {
    self.view = [[AdvancedCollisionView alloc] init];
}
@end