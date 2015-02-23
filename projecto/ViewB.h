//
//  ViewB.h
//  projecto
//
//  Created by Hugo Costa on 23/02/15.
//  Copyright (c) 2015 Hugo Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewB : UIViewController <UITableViewDelegate, UITableViewDelegate>
- (IBAction)back:(id)sender;
- (IBAction)abrirGoogle:(id)sender;
- (IBAction)adicionarImagem:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tabela;

@end
