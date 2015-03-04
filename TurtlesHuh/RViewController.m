//
//  RViewController.m
//  TurtlesHuh
//
//  Created by apple on 12/10/19.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "RViewController.h"


@implementation RViewController

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    printf("RViewController viewDidUnload\n");
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
