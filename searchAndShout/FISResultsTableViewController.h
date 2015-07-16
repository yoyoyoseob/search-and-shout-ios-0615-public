//
//  FISResultsTableViewController.h
//  searchAndShout
//
//  Created by Yoseob Lee on 7/16/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISResultsTableViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *searchQueryArray;
@property (nonatomic) NSInteger searchIndex;

@end
