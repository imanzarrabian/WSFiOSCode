//
//  DetailViewController.m
//  TestXcode
//
//  Created by Iman Zarrabian on 10/11/14.
//  Copyright (c) 2014 Iman Zarrabian. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (nonatomic, strong) NSArray *myColorsArray;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myColorsArray = @[[UIColor redColor],
                           [UIColor yellowColor],
                           [UIColor purpleColor],
                           [UIColor blueColor]];
    
    NSInteger randomIndex = arc4random() % 4;
    self.view.backgroundColor = self.myColorsArray[randomIndex];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dismissOnTouch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
