#import "GeneralViewController.h"

@implementation GeneralViewController {
    NSString *viewName;
}
- (id)initWithViewName:(NSString *)aViewName andTitle: (NSString *) title{
    self = [super init];
    if (self) {
        viewName = aViewName;
        [self.navigationItem setTitle:title];

    }
    return self;
}

- (void)loadView {
    self.view = [[NSClassFromString(viewName) alloc]init];
}

@end