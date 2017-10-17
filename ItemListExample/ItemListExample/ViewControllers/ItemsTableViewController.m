//
//  ItemsTableViewController.m
//  ItemListExample
//
//  Created by Pablo Luis Pellegrino on 10/17/17.
//  Copyright © 2017 Pablo Luis Pellegrino. All rights reserved.
//

#import "ItemsTableViewController.h"
#import "MarketItemModel.h"
#import "ItemsTableCell.h"
#import "EditItemViewController.h"

@interface ItemsTableViewController () <UITableViewDelegate, UITableViewDataSource, EditItemViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<MarketItemModel*> *itemList;

@end

@implementation ItemsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Lista de Items :)";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.itemList = [[NSMutableArray alloc] init];
    
    [self.tableView registerClass:[ItemsTableCell class] forCellReuseIdentifier:kCellReuseId];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

-(IBAction)addAction:(id)sender
{
    EditItemViewController *vc = [[EditItemViewController alloc] initWithDelegate:self];
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDelegate

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.f;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MarketItemModel *item = self.itemList[indexPath.row];
    
    EditItemViewController *vc = [[EditItemViewController alloc] initWithEditableItem:item delegate:self];
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.itemList count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellReuseId];
    MarketItemModel *item = self.itemList[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - $ %@", item.itemName, item.itemPrice];
    
    return cell;
}

#pragma mark - EditItemViewControllerDelegate

-(void) notifyNewItemCreated:(MarketItemModel *)newItem
{
    [self.itemList addObject:newItem];
    
    [self.tableView reloadData];
}

-(void) notifyItemEdited:(MarketItemModel *)editedItem
{
    [self.tableView reloadData];
}

-(void) notifyItemDeleted:(MarketItemModel *)deletedItem
{
    [self.itemList removeObject:deletedItem];
    
    [self.tableView reloadData];
}

@end
