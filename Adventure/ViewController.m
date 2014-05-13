//
//  ViewController.m
//  Adventure
//
//  Created by Richard Fellure on 5/13/14.
//  Copyright (c) 2014 Rich. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *clearBoxesButton;
@property (weak, nonatomic) IBOutlet UILabel *finalTextLabel;
@property (weak, nonatomic) IBOutlet UITextField *customName;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    CustomViewController *nextViewController = segue.destinationViewController;
    nextViewController.buttonText = sender.titleLabel.text;
    self.customNameText = self.customName.text;
    nextViewController.nameText = self.customNameText;
     NSLog(@"%@", self.customName.text);
    [self.customName resignFirstResponder];
//    nextViewController.navigationItem.title = sender.titleLabel.text;
//    NSLog(@"%@",self.clearBoxesButton.titleLabel.text);
}

-(IBAction)unwindSegueToBeginning: (UIStoryboardSegue *) sender{
    NSLog(@"MADE IT BACK");

    self.finalTextLabel.text = self.passedInText;
}

@end
