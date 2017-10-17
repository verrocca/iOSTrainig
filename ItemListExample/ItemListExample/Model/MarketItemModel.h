//
//  MarketItemModel.h
//  TableViewExample
//
//  Created by Pablo Luis Pellegrino on 10/17/17.
//  Copyright © 2017 Pablo Luis Pellegrino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MarketItemModel : NSObject

@property(nonatomic, copy) NSString *itemName;
@property(nonatomic, copy) NSNumber *itemPrice;

-(instancetype) initWithName:(NSString*)name price:(NSNumber*)price;

@end
