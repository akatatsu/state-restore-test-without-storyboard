//
//  PresentViewController.m
//  StateRestoreTest
//
//  Created by MLJ1084 on 2014/10/07.
//  Copyright (c) 2014年 akatatsu. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(actionCancel)];
    
    self.title = @"Test for ModalView";
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 250, 100)];
    label.text = @"This is ModalView";
    [self.view addSubview:label];
}

- (void)actionCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
