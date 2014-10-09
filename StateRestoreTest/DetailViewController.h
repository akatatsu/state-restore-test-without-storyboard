//
//  DetailViewController.h
//  StateRestoreTest
//
//  Created by Tatsuhiko Akashi on 2014/10/06.
//  Copyright (c) 2014年 akatatsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UIViewControllerRestoration>

- (id)initWithNum:(int)num;

@end
