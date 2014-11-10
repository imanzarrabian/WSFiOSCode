//
//  ViewController.m
//  TestXcode
//
//  Created by Iman Zarrabian on 10/11/14.
//  Copyright (c) 2014 Iman Zarrabian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIAlertView *myAlertView;
@property (weak, nonatomic) IBOutlet UIButton *myButton;

@end


@implementation ViewController

@synthesize myAlertView = _myAlertView;

- (void)viewDidLoad {
    [super viewDidLoad];

   self.myAlertView = [[UIAlertView alloc] initWithTitle:@"Youhou" message:@"Successful display" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)displayPopupOnTouch:(id)sender {
    //METHODE 1
   /* self.myButton.selected = !self.myButton.selected;
    
    NSLog(@"%@",self.myButton.titleLabel.text);
    
    NSString *myString = self.myButton.selected ? @"oui":@"non";
    
    [self.myButton setTitle:myString forState:UIControlStateNormal];
*/
    //METHODE 2
    BOOL test;
    if ([self.myButton.titleLabel.text isEqualToString:@"non"]) {
        test = YES;
    }
    
    NSString *myString = test ? @"oui":@"non";
    [self.myButton setTitle:myString forState:UIControlStateNormal];

    //Displaying the alertView
    [self.myAlertView show];
}

/**OPTIONAL**/
#pragma mark - OPTIONAL METHODS
//getter
- (UIAlertView *)myAlertView {
    return _myAlertView;
}

//setter
- (void)setMyAlertView:(UIAlertView *)myAlertView {
    _myAlertView = myAlertView;
}
/**END OPTIONAL**/


@end
