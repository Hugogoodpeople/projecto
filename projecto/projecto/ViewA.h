//
//  ViewA.h
//  projecto
//
//  Created by Hugo Costa on 23/02/15.
//  Copyright (c) 2015 Hugo Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <TwitterKit/TwitterKit.h>

@interface ViewA : UIViewController  <TWTRTweetViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textUserName;
@property (weak, nonatomic) IBOutlet UITextField *textPassword;

- (IBAction)makeLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *labelContador;


@property (weak, nonatomic) IBOutlet TWTRTweetView *tweetView;

@end
