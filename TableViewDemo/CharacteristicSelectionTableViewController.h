//
//  CharacteristicSelectionTableViewController.h
//  TableViewDemo
//
//  Created by Brandon Trebitowski on 1/29/15.
//  Copyright (c) 2015 Pixegon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchTableViewController.h"

@interface CharacteristicSelectionTableViewController : UITableViewController
@property(nonatomic, strong) SearchCallBackBlock callbackBlock;
@end
