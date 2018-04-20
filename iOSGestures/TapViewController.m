//
//  TapViewController.m
//  iOSGestures
//
//  Created by Alejandro Zielinsky on 2018-04-19.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (IBAction)tapRecognizer:(UITapGestureRecognizer *)sender
{
    if(sender.view.backgroundColor == [UIColor redColor])
    {
        sender.view.backgroundColor = [UIColor whiteColor];
    }
    else
    {
       sender.view.backgroundColor = [UIColor redColor];
    }
}

@end
