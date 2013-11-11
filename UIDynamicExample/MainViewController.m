#import "MainViewController.h"
#import "GravityViewController.h"
#import "CollisionViewController.h"

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
    return @[@"Gravity", @"Basic Collision"];
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
    return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%i", [indexPath row]);
    switch ([indexPath row]) {
        case 0: {
            GravityViewController *gravityViewController = [[GravityViewController alloc] init];
            [[self navigationController] pushViewController:gravityViewController animated:NO];
            return;
        }
        case 1: {
            CollisionViewController *gravityWithCollisionViewController = [[CollisionViewController alloc] init];
            [[self navigationController] pushViewController:gravityWithCollisionViewController animated:NO];
            return;
        }
        default:
            return;
    }
}

@end