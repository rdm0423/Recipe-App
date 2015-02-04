//
//  RecipeViewController.m
//  Recipe App
//
//  Created by Ross McIlwaine on 2/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecipiesTableViewDataSource.h"

@interface RecipeViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RecipiesTableViewDataSource *dataSource;

@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    
    self.dataSource = [RecipiesTableViewDataSource new];
    
    self.tableView.dataSource = self.dataSource;
        
    [self.dataSource registerTableView:self.tableView];
    
    self.title = @"Recipe App";
    
}



@end
