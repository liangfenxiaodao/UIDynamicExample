#import "MainViewController.h"
#import "GeneralViewController.h"

@implementation MainViewController {
    NSArray *behaviours;
}

- (id)init {
    self = [super init];
    if (self) {
        behaviours = [self gravityBehaviours];
        [self.navigationItem setTitle:@"Dynamic Behaviours"];
    }
    return self;
}


- (NSArray *)gravityBehaviours {
    return @[@"Gravity", @"Collision", @"Attachment"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *behaviour = behaviours[(NSUInteger) [indexPath row]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell.textLabel setText:behaviour];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [behaviours count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch ([indexPath row]) {
        case 0: {
            GeneralViewController *gravityViewController = [[GeneralViewController alloc] initWithViewName:@"GravityView" andTitle:@"Gravity"];
            [[self navigationController] pushViewController:gravityViewController animated:NO];
            return;
        }
        case 1: {
            GeneralViewController *collisionViewController = [[GeneralViewController alloc] initWithViewName:@"CollisionView" andTitle:@"Collision"];
            [[self navigationController] pushViewController:collisionViewController animated:NO];
            return;
        }
        case 2: {
            GeneralViewController *attachmentViewController = [[GeneralViewController alloc] initWithViewName:@"AttachmentView" andTitle:@"Attachment"];
            [[self navigationController] pushViewController:attachmentViewController animated:NO];
            return;
        }
        default:
            return;
    }
}

@end