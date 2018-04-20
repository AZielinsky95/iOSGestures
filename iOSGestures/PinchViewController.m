//
//  PinchViewController.m
//  iOSGestures
//
//  Created by Alejandro Zielinsky on 2018-04-19.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()

@end

@implementation PinchViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2,width,height);
    UIView *view = [[UIView alloc] initWithFrame:frame];
    
    view.backgroundColor = [UIColor purpleColor];
    [self.view  addSubview:view];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinched:)];
    [view addGestureRecognizer:pinchGesture];
}

-(void)pinched:(UIPinchGestureRecognizer*)sender
{
    CGFloat scale = sender.scale;
    sender.view.transform = CGAffineTransformMakeScale(scale,scale);
    scale = 1.0;
}

@end
