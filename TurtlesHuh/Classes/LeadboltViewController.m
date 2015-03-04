//
//  LeadboltViewController.m
//  TurtlesHuh
//
//  Created by  on 2012/7/31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "LeadboltViewController.h"
#import "AppDelegate.h"

@implementation LeadboltViewController

-(id) init{
	
	if( ! [super init] )
		return nil;
    
    printf("ABC\n");
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 44, 320, 436)];
	
    
    NSString *urlAddress = @"http://ad.leadboltads.net/show_app_wall?section_id=510705058";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    
    [self.view addSubview:webView];
    
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)]; 
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:nil];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"     
                                                                   style:UIBarButtonItemStyleBordered     
                                                                  target:self     
                                                                  action:@selector(clickBackButton)]; 
    
    
    [navigationBar pushNavigationItem:navigationItem animated:NO];  
    [navigationItem setLeftBarButtonItem:backButton];  
    
    [self.view addSubview:navigationBar];    
    
    [navigationItem release];    
    [backButton release];    
    
    
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.frame = CGRectMake(140, 220, 40, 40);
	
    [self.view addSubview:activityIndicator];
   // self.view = activityIndicator;
     webView.delegate = self;
	
	return self;
}

-(void) clickBackButton{
    printf("Clicik back\n");
    AppController *appDelegate =(AppController*) [[UIApplication sharedApplication] delegate];
    [appDelegate removeLeadbolt];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    printf("webViewDidStartLoad\n");
    [activityIndicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    printf("webViewDidFinishLoad\n");
    [activityIndicator stopAnimating];
    //self.view = webView;
}

- (void)dealloc {
	printf("LeadbotViewControoler DEALLOC\n");
    
    [super dealloc];
}

@end
