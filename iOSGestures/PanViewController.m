//
//  PanViewController.m
//  iOSGestures
//
//  Created by Alejandro Zielinsky on 2018-04-19.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (IBAction)redViewPanned:(UIPanGestureRecognizer *)sender
{
   // CGPoint location = [sender locationInView:self.view];
    
    CGPoint translationInView = [sender translationInView:self.view];
    
    CGPoint oldCenter = sender.view.center;
    
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.view];

}

@end
