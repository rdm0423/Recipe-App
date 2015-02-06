//
//  RecipiesTableViewDataSource.h
//  Recipe App
//
//  Created by Ross McIlwaine on 2/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RecipiesTableViewDataSource : NSObject <UITableViewDataSource>

//@property (nonatomic, strong) NSArray *images;

- (void)registerTableView:(UITableView *)tableView;

//- (CGFloat)heightForIndexPath:(NSIndexPath *)indexPath;

@end
