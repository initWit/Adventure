//
//  RiddleViewController.m
//  Adventure
//
//  Created by Richard Fellure on 5/13/14.
//  Copyright (c) 2014 Rich. All rights reserved.
//

#import "RiddleViewController.h"
#import "CustomViewController.h"
#import "ViewController.h"

@interface RiddleViewController ()
@property (weak, nonatomic) IBOutlet UITextView *finalTextView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *girlfriendButton;
@property (weak, nonatomic) IBOutlet UIButton *scotchButton;
@property (weak, nonatomic) IBOutlet UILabel *riddleLabel;
@property (weak, nonatomic) IBOutlet UIButton *AnswerOne;
@property (weak, nonatomic) IBOutlet UIButton *AnswerTwo;


@end

@implementation RiddleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.buttonText;
    self.nameLabel.text = self.nameText;

    self.girlfriendButton.alpha = 0;
    self.scotchButton.alpha = 0;
    self.nameLabel.alpha = 0;
    self.finalTextView.alpha = 0;



}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{

    if ([sender.titleLabel.text isEqualToString:@"REWIND"]) {
        // pass the text to the text property of the first view controller


        ViewController *firstViewController = segue.destinationViewController;

        NSString *textOfFinalBox = self.finalTextView.text;

        NSString *nameOfPerson = self.nameText;

        NSString *result = [NSString stringWithFormat:@"%@ %@",nameOfPerson,textOfFinalBox];

        firstViewController.passedInText = result;




    }
    else{
        CustomViewController *nextViewController = segue.destinationViewController;
        nextViewController.buttonText = sender.titleLabel.text;
        nextViewController.nameText = self.nameLabel.text;
    }
}

- (IBAction)wrongAnswer:(id)sender {
    self.riddleLabel.text = @"Try harder!";
}

- (IBAction)rightAnswer:(id)sender {
    self.riddleLabel.alpha = 0;
    self.AnswerOne.alpha = 0;
    self.AnswerTwo.alpha = 0;

    self.girlfriendButton.alpha = 1;
    self.scotchButton.alpha = 1;
    self.nameLabel.alpha = 1;
    self.finalTextView.alpha = 1;
}


@end
