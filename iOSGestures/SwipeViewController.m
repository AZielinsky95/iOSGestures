//
//  SwipeViewController.m
//  iOSGestures
//
//  Created by Alejandro Zielinsky on 2018-04-19.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@property BOOL isOpen;
@property (nonatomic,strong) UIView *backgroundView;
@property (nonatomic,strong) UIView *sliderView;
@end

@implementation SwipeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    CGFloat width = 400;
    CGFloat height = 50;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2,width,height);

    self.backgroundView = [[UIView alloc] initWithFrame:frame];
    self.backgroundView .backgroundColor = [UIColor brownColor];
    [self.view  addSubview: self.backgroundView ];
    
    CGRect sliderFrame = CGRectMake(CGRectGetMidX(self.backgroundView.bounds) - width/2, CGRectGetMidY(self.backgroundView.bounds) - height/2,width,height);
    
    self.sliderView = [[UIView alloc] initWithFrame:sliderFrame];
    self.sliderView.backgroundColor = [UIColor whiteColor];
    [self.backgroundView addSubview: self.sliderView];

    [self.backgroundView setClipsToBounds:YES];
    
    UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiped:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.sliderView addGestureRecognizer:swipeLeftGesture];

    UISwipeGestureRecognizer *swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiped:)];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.sliderView addGestureRecognizer:swipeRightGesture];


}

-(void)swiped:(UISwipeGestureRecognizer*)sender
{
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        NSLog(@"SWIPELEFT");
        if(!self.isOpen)
        {
            [UIView animateWithDuration:1
                             animations:^
             {
                 sender.view.center = CGPointMake(100,sender.view.center.y);
             }
             completion:^(BOOL finished)
             {
                 self.isOpen = !self.isOpen;
             }];
        }
    }
    else
    {
        NSLog(@"SWIPERight");
        if(self.isOpen)
        {
            [UIView animateWithDuration:1
                             animations:^
             {
                 sender.view.center = CGPointMake(self.backgroundView.center.x - 7,sender.view.center.y);
             }
                             completion:^(BOOL finished)
             {
                 self.isOpen = NO;
             }];
        }
    }
    
}



@end
