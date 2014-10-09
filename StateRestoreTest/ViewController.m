//
//  ViewController.m
//  StateRestoreTest
//
//  Created by Tatsuhiko Akashi on 2014/10/06.
//  Copyright (c) 2014年 akatatsu. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "ModalViewController.h"

#define kItemKey @"Items"

@interface ViewController (){
    UIButton* b;
}

@property (retain,nonatomic) UITableView* tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Test for Push View";
    
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    b = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-150, self.view.frame.size.width, 80)];
    [b setTitle:@"Tap to Modal View" forState:UIControlStateNormal];
    b.backgroundColor = [UIColor blackColor];
    [b addTarget:self action:@selector(tapButton) forControlEvents:UIControlEventTouchDown];
    [self.tableView addSubview:b];
    [self.tableView bringSubviewToFront:b];
    
    self.restorationIdentifier = @"ViewController";
    self.restorationClass = [self class];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%d",(int)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController* detail = [[DetailViewController alloc] initWithNum:(int)indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
}

+ (UIViewController *) viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder {
    ViewController *viewController = [[ViewController alloc] init];
    return viewController;
}

- (void)tapButton
{
    ModalViewController* modal = [[ModalViewController alloc] init];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:modal];
    nav.restorationIdentifier = @"ModalNC";
    [self presentViewController:nav animated:YES completion:nil];
}

@end
