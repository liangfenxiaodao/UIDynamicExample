#import "MainViewController.h"
#import "GeneralViewController.h"

#define keyItemName @"name"
#define keyClassName @"class"

@implementation MainViewController {
    NSArray *items;
}

- (id)init {
    self = [super init];
    if (self) {
        items = [self setupItems];
        [self.navigationItem setTitle:@"Dynamic Behaviours"];
    }
    return self;
}


- (NSArray *)setupItems {
    return @[@{keyItemName : @"Gravity", keyClassName : @"GravityView"},
            @{keyItemName : @"Collision", keyClassName : @"CollisionView"},
            @{keyItemName : @"Attachment", keyClassName : @"AttachmentView"},
            @{keyItemName : @"Advanced Attachment", keyClassName : @"AdvancedAttachmentView"},
            @{keyItemName : @"Snap", keyClassName : @"SnapView"},
            @{keyItemName : @"Push", keyClassName : @"PushView"}];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell.textLabel setText:items[[indexPath row]][keyItemName]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [items count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = items[[indexPath row]];
    GeneralViewController *viewController = [[GeneralViewController alloc] initWithViewName:item[keyClassName] andTitle:item[keyItemName]];
    [[self navigationController] pushViewController:viewController animated:NO];
}

@end