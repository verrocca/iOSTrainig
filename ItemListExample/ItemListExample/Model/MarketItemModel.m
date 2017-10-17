//
//  MarketItemModel.m
//  TableViewExample
//
//  Created by Pablo Luis Pellegrino on 10/17/17.
//  Copyright © 2017 Pablo Luis Pellegrino. All rights reserved.
//

#import "MarketItemModel.h"

@implementation MarketItemModel

-(instancetype) initWithName:(NSString*)name price:(NSNumber*)price
{
    self = [super init];
    if(self) {
        _itemName = name;
        _itemPrice = price;
    }
    return self;
}

@end
