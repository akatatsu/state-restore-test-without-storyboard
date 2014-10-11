//
//  DetailViewController.m
//  StateRestoreTest
//
//  Created by Tatsuhiko Akashi on 2014/10/06.
//  Copyright (c) 2014年 akatatsu. All rights reserved.
//

#import "DetailViewController.h"

#define kItemKey @"Items"

@interface DetailViewController (){
    int num;
    UILabel* label;
}

@end

@implementation DetailViewController

- (id)initWithNum:(int)NUM
{
    num = NUM;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Test for Push View";
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.text = [NSString stringWithFormat:@"%d",num];
    [self.view addSubview:label];
    
    //復元ID
    self.restorationIdentifier = @"DetailViewController";
    self.restorationClass = [self class];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

+ (UIViewController *) viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder {
    DetailViewController *viewController = [[DetailViewController alloc] init];
    return viewController;
}

-(void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [coder encodeObject:label.text forKey:kItemKey];
    [super encodeRestorableStateWithCoder:coder];
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    label.text = [coder decodeObjectForKey:kItemKey];
    [super decodeRestorableStateWithCoder:coder];
    
}

@end
