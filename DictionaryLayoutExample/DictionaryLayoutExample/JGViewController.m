//
//  JGViewController.m
//  DictionaryLayoutExample
//
//  Created by Jaden Geller on 12/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "JGViewController.h"
#import "UIView+DictionaryLayout.h"
@interface JGViewController ()

@end

@implementation JGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *exampleView = [[UIView alloc]init];
    
    // Add subview before setting layout for proper layout positioning
    [self.view addSubview:exampleView];
    
    exampleView.layout = [NSDictionary dictionaryWithFileName:@"ExampleView"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
