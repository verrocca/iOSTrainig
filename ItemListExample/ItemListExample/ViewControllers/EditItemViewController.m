//
//  EditItemViewController.m
//  ItemListExample
//
//  Created by Pablo Luis Pellegrino on 10/17/17.
//  Copyright © 2017 Pablo Luis Pellegrino. All rights reserved.
//

#import "EditItemViewController.h"
#import "MarketItemModel.h"

@interface EditItemViewController ()

@property (nonatomic, strong) MarketItemModel *editableItem;
@property (nonatomic, weak) id<EditItemViewControllerDelegate> delegate;

@property (nonatomic, weak) IBOutlet UITextField *descriptionTextField;
@property (nonatomic, weak) IBOutlet UITextField *priceTextField;

@end

@implementation EditItemViewController

-(instancetype) initWithEditableItem:(MarketItemModel*)item delegate:(id<EditItemViewControllerDelegate>)delegate
{
    self = [super init];
    if (self) {
        _editableItem = item;
        _delegate = delegate;
    }
    return self;
}

-(instancetype) initWithDelegate:(id<EditItemViewControllerDelegate>)delegate
{
    return [self initWithEditableItem:nil delegate:delegate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Edición de Item";
    
    self.priceTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    if(self.editableItem) {
        self.descriptionTextField.text = self.editableItem.itemName;
        self.priceTextField.text = [self.editableItem.itemPrice stringValue];
    }
}

-(IBAction)confirm:(id)sender
{
    NSString *itemName = self.descriptionTextField.text;
    NSNumber *price = @([self.priceTextField.text floatValue]);
    if(self.editableItem) {
        self.editableItem.itemName = itemName;
        self.editableItem.itemPrice = price;
        [self.delegate notifyItemEdited:self.editableItem];
    } else
    {
        MarketItemModel *newItem = [[MarketItemModel alloc] initWithName:itemName price:price];
        [self.delegate notifyNewItemCreated:newItem];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)delete:(id)sender
{
    if(self.editableItem) {
        [self.delegate notifyItemDeleted:self.editableItem];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
