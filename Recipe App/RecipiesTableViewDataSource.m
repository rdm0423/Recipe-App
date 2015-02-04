//
//  RecipiesTableViewDataSource.m
//  Recipe App
//
//  Created by Ross McIlwaine on 2/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipiesTableViewDataSource.h"
#import "RARecipes.h"

@implementation RecipiesTableViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [RARecipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [RARecipes titleAtIndex:indexPath.row]];
    
    return cell;
}





@end
