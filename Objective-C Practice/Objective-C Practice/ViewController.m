//
//  ViewController.m
//  Objective-C Practice
//
//  Created by song on 2023/03/20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
  BOOL isDark = YES;
  BOOL isLight = NO;
  
  if (isLight) {
    NSLog(@"다크모드입니다.");
  } else {
    NSLog(@"라이트모드입니다.");
  }
}


@end
