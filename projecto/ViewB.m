//
//  ViewB.m
//  projecto
//
//  Created by Hugo Costa on 23/02/15.
//  Copyright (c) 2015 Hugo Costa. All rights reserved.
//

#import "ViewB.h"
#import "ViewC.h"

@interface ViewB ()
{
    NSMutableArray * temArray;
    NSMutableArray * items;
}

@end

@implementation ViewB

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tabela.allowsMultipleSelectionDuringEditing = NO;
    
    items = [NSMutableArray new];
    [items addObject:@"img1.jpg"];
    
    temArray = [NSMutableArray new];
    [temArray addObject:@"img1.jpg"];
    [temArray addObject:@"img2.jpg"];
    [temArray addObject:@"img3.jpg"];
    [temArray addObject:@"img4.jpg"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)abrirGoogle:(id)sender {
    [self.navigationController pushViewController:[ViewC new] animated:YES];
}

- (IBAction)adicionarImagem:(id)sender {
    [items addObject:[temArray objectAtIndex:(items.count%4)]];
    [self.tabela reloadData];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tabela dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    
    if (cell == nil) {
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    cell.imageView.image = [UIImage imageNamed:[items objectAtIndex:(indexPath.row%4)]];
    cell.imageView.contentMode = UIViewContentModeScaleToFill;
    [cell.imageView setFrame:cell.bounds];


    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[[UIAlertView alloc] initWithTitle:nil message:@"Hello world" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        
        [items removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
