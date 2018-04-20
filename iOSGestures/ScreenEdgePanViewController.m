//
//  ScreenEdgePanViewController.m
//  iOSGestures
//
//  Created by Alejandro Zielinsky on 2018-04-19.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "ScreenEdgePanViewController.h"

@interface ScreenEdgePanViewController ()
@property BOOL reachedLimit;
@property CGFloat maxX;
@property CGFloat width;
@property CGFloat height;
@property UIScreenEdgePanGestureRecognizer *screenEdgePanGesture;
@end

@implementation ScreenEdgePanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.maxX = 350;
    
    self.width = 300;
    self.height = 300;
    CGRect frame = CGRectMake(CGRectGetMaxX(self.view.bounds)-10, CGRectGetMidY(self.view.bounds) - self.height/2,self.width,self.height);
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor redColor];
    [self.view  addSubview: view ];
    
    self.screenEdgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenEdgePan:)];
    [self.screenEdgePanGesture setEdges:UIRectEdgeRight];
    [view addGestureRecognizer:self.screenEdgePanGesture];
}

-(void)screenEdgePan:(UIScreenEdgePanGestureRecognizer*)sender
{
    CGPoint translationInView = [sender translationInView:self.view];
    
    CGPoint oldCenter = sender.view.center;
    
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y);
    
    if(!self.reachedLimit)
    {
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.view];
    }
    
    if(sender.view.center.x <= self.maxX)
    {
        self.reachedLimit = true;
    }
    
    if(sender.state == UIGestureRecognizerStateEnded && self.reachedLimit)
    {
        UIPanGestureRecognizer *screenPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(screenPan:)];
        [sender.view addGestureRecognizer:screenPanGesture];
        [sender.view removeGestureRecognizer:sender];
    }
    else if(sender.state == UIGestureRecognizerStateEnded && !self.reachedLimit)
    {
        //If we ended touch and we didnt reach limit go back to edge
        sender.view.center = CGPointMake((CGRectGetMaxX(self.view.bounds)-10)+self.width/2,sender.view.center.y);
    }
    

}

-(void)screenPan:(UIPanGestureRecognizer*)sender
{

    CGPoint translationInView = [sender translationInView:self.view];
    
    CGPoint oldCenter = sender.view.center;
    
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y);
    if(newCenter.x <= self.maxX)
    {
        return;
    }
    else
    {
        sender.view.center = newCenter;
    }
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    if(sender.state == UIGestureRecognizerStateEnded && newCenter.x >= 450)
    {
        sender.view.center = CGPointMake((CGRectGetMaxX(self.view.bounds)-10) + (self.width/2),sender.view.center.y);
        [self.screenEdgePanGesture setEdges:UIRectEdgeRight];
        [sender.view addGestureRecognizer:self.screenEdgePanGesture];
        [sender.view removeGestureRecognizer:sender];
    }
    else if(sender.state == UIGestureRecognizerStateEnded && newCenter.x <= 450)
    {
          sender.view.center = CGPointMake(self.maxX,sender.view.center.y);
    }
    
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
