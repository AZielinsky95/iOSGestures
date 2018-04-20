//
//  RotationViewController.m
//  iOSGestures
//
//  Created by Alejandro Zielinsky on 2018-04-19.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat width = 100;
    CGFloat height = 100;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2,width,height);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor redColor];
    [self.view  addSubview: view ];
    
    UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotated:)];
    
    [view addGestureRecognizer:rotateGesture];
}

-(void)rotated:(UIRotationGestureRecognizer*)sender
{
    CGFloat rotation = sender.rotation;
    sender.view.transform = CGAffineTransformMakeRotation(rotation);
    rotation = 0.0f;
}

@end
