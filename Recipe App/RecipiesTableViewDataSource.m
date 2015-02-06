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



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
    
    
//    self.images = [[NSMutableArray alloc] initWithObjects:@"pork.jpeg", @"salmon.jpeg", @"pumpkinPie.jpeg", @"jambalaya", @"chocolateCake.jpeg", nil];
    

    cell.textLabel.text = [NSString stringWithFormat:@"%@", [RARecipes titleAtIndex:indexPath.row]];
    
//    cell.imageView.image = [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
    
    cell.imageView.image = [UIImage imageNamed:[RARecipes imageAtIndex:indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [RARecipes count];
}



@end
