//
//  JGViewController.m
//  JGDictionaryLayoutViewExample
//
//  Created by Jaden Geller on 12/29/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "JGViewController.h"
#import "JGDictionaryLayoutView.h"

@interface JGViewController ()

@end

@implementation JGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    JGDictionaryLayoutView *view = [[JGDictionaryLayoutView alloc]init];
    
    // Add subview before setting layout so that constraints can be added
    [self.view addSubview:view];
    
    view.layout = [NSDictionary dictionaryWithFileName:@"ExampleView"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
