//
//  PendulumViewController.m
//  UIDynamicExample
//
//  Created by jli on 11/8/13.
//
//

#import "PendulumViewController.h"
#import "PendulumView.h"

@interface PendulumViewController ()

@end

@implementation PendulumViewController

- (id) init{
    self = [super init];
    if(self != nil){
        [self.tabBarItem setTitle:@"Pendulum"];
    }
    return self;
}

- (void)loadView{
    self.view = [[PendulumView alloc]init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
