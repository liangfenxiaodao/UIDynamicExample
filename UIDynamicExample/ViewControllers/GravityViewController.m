#import "GravityViewController.h"
#import "GravityView.h"

@implementation GravityViewController

- (void)loadView {
    self.view = [[GravityView alloc] init];
    [self.tabBarItem setTitle:@"Gravity"];
}

@end