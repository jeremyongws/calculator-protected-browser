//
//  BrowserViewController.m
//  Week1Assessment-JeremyOng
//
//  Created by Jeremy Ong on 01/04/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import "BrowserViewController.h"

@interface BrowserViewController () < UITextFieldDelegate >
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlBar;

@end

@implementation BrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
		[self loadPage:@"https://www.google.com"];
	self.urlBar.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[self loadPage:self.urlBar.text];
	return YES;
}




- (void)loadPage:(NSString*)url{
	if ([url containsString:@"https://"]) {
		NSURL *address = [NSURL URLWithString:url];
		NSURLRequest *request = [NSURLRequest requestWithURL:address];
		[self.webView loadRequest:request];
	} else {
		NSString *https = @"https://";
		NSURL *address = [NSURL URLWithString:[https stringByAppendingString:url]];
		NSURLRequest *request = [NSURLRequest requestWithURL:address];
		[self.webView loadRequest:request];
	}
}

@end
