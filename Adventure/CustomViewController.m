//
//  CustomViewController.m
//  Adventure
//
//  Created by Richard Fellure on 5/13/14.
//  Copyright (c) 2014 Rich. All rights reserved.
//

#import "CustomViewController.h"
#import "ViewController.h"

@interface CustomViewController ()
@property (weak, nonatomic) IBOutlet UITextView *finalTextView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation CustomViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.buttonText;
    self.nameLabel.text = self.nameText;
    
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


@end
