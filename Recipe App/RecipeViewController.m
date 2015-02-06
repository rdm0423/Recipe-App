//
//  RecipeViewController.m
//  Recipe App
//
//  Created by Ross McIlwaine on 2/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecipiesTableViewDataSource.h"
#import "DetailViewController.h"
#import "RARecipes.h"

@interface RecipeViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RecipiesTableViewDataSource *dataSource;
@property (nonatomic, strong) DetailViewController *dvc;

@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    
    self.dataSource = [RecipiesTableViewDataSource new];
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    [self.dataSource registerTableView:self.tableView];
    
    self.dvc = [DetailViewController new];
    
    self.title = @"Recipe App";
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailViewController *detailViewController = [DetailViewController new];
    
    detailViewController.recipeIndex = indexPath.row;
    
    
    self.dvc.title = [RARecipes titleAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:self.dvc animated:YES];
    
}



@end
