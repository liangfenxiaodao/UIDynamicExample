#import "AttachmentViewController.h"
#import "AttachmentView.h"

@implementation AttachmentViewController {

}
- (id)init {
    self = [super init];
    if (self) {
        [self.navigationItem setTitle:@"Attachment"];
    }

    return self;
}

- (void)loadView {
    self.view = [[AttachmentView alloc] init];
}
@end