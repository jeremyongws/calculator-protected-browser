//
//  ViewController.m
//  Week1Assessment-JeremyOng
//
//  Created by Jeremy Ong on 01/04/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberOne;
@property (weak, nonatomic) IBOutlet UITextField *numberTwo;
@property (weak, nonatomic) IBOutlet UITextField *mathOperator;
@property (weak, nonatomic) IBOutlet UILabel *operationResults;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;

@end

@implementation CalculatorViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.nextButton.enabled = NO;
}

- (IBAction)onCalculateButtonPressed:(id)sender {
	NSString *numberOneTemp = self.numberOne.text;
	NSString *numberTwoTemp = self.numberTwo.text;
	NSString *mathOperatorTemp = self.mathOperator.text;
	NSString *result = [self calculate:numberOneTemp withOperator:mathOperatorTemp secondNumber:numberTwoTemp];
	if ([result integerValue] % 9 == 0){
		self.operationResults.text = result;
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"YOU ARE A " message:@"GENIUS" preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *thankYou = [UIAlertAction actionWithTitle:@"Thanks" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
			[alert dismissViewControllerAnimated:YES completion:nil];
			if ([result isEqualToString:@"999"]){
				self.nextButton.enabled = YES;
			}
		}];;
		[alert addAction:thankYou];
		[self presentViewController:alert animated:true completion:nil];
	} else {
		self.operationResults.text = [result stringByAppendingString:@" wrong answer!"];
	}
}

- (NSString*)calculate:(NSString*)firstNumber withOperator:(NSString*)operator secondNumber:(NSString*)secondNumber {
	if ([operator isEqualToString:@"+"]){
		NSInteger intResult = [firstNumber integerValue] + [secondNumber integerValue];
		NSString *result = [NSString stringWithFormat:@"%ld", (long)intResult];
		return result;
	} else if ([operator isEqualToString:@"-"]){
		NSInteger intResult = [firstNumber integerValue] - [secondNumber integerValue];
		NSString *result = [NSString stringWithFormat:@"%ld", (long)intResult];
		return result;
	} else if ([operator isEqualToString:@"*"]){
		NSInteger intResult = [firstNumber integerValue] * [secondNumber integerValue];
		NSString *result = [NSString stringWithFormat:@"%ld", (long)intResult];
		return result;
	} else if ([operator isEqualToString:@"/"]){
		NSInteger intResult = [firstNumber integerValue] / [secondNumber integerValue];
		NSString *result = [NSString stringWithFormat:@"%ld", (long)intResult];
		return result;
	}
	return @"failed";
}

@end
