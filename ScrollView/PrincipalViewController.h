//
//  PrincipalViewController.h
//  ScrollView
//
//  Created by Rafael Brigagão Paulino on 28/08/12.
//  Copyright (c) 2012 Rafael Brigagão Paulino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrincipalViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *meuScroll;
@property (nonatomic, weak) IBOutlet UIPageControl *meuControl;

-(IBAction)pageControlMudou:(id)sender;

@end
