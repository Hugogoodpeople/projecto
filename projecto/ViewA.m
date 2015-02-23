//
//  ViewA.m
//  projecto
//
//  Created by Hugo Costa on 23/02/15.
//  Copyright (c) 2015 Hugo Costa. All rights reserved.
//

#import "ViewA.h"
#import "ViewB.h"

@interface ViewA ()

@end

@implementation ViewA

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// para remover o texto antes da view ser mostrada de novo
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.textUserName setText:nil];
    [self.textPassword setText:nil];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.textUserName resignFirstResponder];
    [self.textPassword resignFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == self.textUserName) {
    
        if(range.length + range.location > textField.text.length)
        {
            return NO;
        }
    
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return (newLength > 8) ? NO : YES;
        
    }
    
    return YES;
}

- (IBAction)makeLogin:(id)sender
{
    NSString * error;
    if (self.textUserName.text.length == 0) {
        error = @"user name";
    }
    else if(self.textPassword.text.length == 0)
    {
        error = @"password";
    }
    
    
    if (error)
    {
        [[[UIAlertView alloc] initWithTitle:@"Campos obrigatorios" message:[NSString stringWithFormat:@"Preencha o campo %@", error] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    }
    else
    {
        [self.navigationController pushViewController:[ViewB new] animated:YES];
    }
}

@end
