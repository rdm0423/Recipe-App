//
//  DetailViewController.m
//  Recipe App
//
//  Created by Ross McIlwaine on 2/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "RARecipes.h"

static CGFloat margin = 15;

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGFloat topMargin = 65;
    CGFloat heightForDescription = [self heightForDescription:[RARecipes descriptionAtIndex:self.recipeIndex]];
    CGFloat labelWidth = self.view.frame.size.width - 2 * margin;
    
    
//    UIImageView *recipeImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 70, 200, 125)];

    
    //description label
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, labelWidth, 20)];
    descriptionLabel.text = @"Description";
    descriptionLabel.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
    [self.view addSubview:descriptionLabel];
    
    // need to adjust top margin for every label
    
    CGFloat tempTop = topMargin + 20;
    
    //Recipe Description
    UILabel *recipeDescription = [[UILabel alloc] initWithFrame:CGRectMake(margin, tempTop, labelWidth, heightForDescription)];
    recipeDescription.text = [RARecipes descriptionAtIndex:self.recipeIndex];
    recipeDescription.numberOfLines = 0;
    recipeDescription.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    [self.view addSubview:recipeDescription];
    
//    top += 20 + margin;
    CGFloat top = topMargin + heightForDescription + margin * 2;
    
    //ingredient label
    UILabel *ingredientList = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, labelWidth, 44)];
    ingredientList.text = @"Ingredients";
    ingredientList.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
    [self.view addSubview:ingredientList];
    
    //
//    UILabel *ingredientType = [[UILabel alloc] initWithFrame:CGRectMake(15, 200, labelWidth, 44)];
//    ingredientType.text = [RARecipes
    
    top += 20 + margin;
    
    for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.recipeIndex]; i++) {
        
        UILabel *volume = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, labelWidth / 4, 20)];
        volume.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        volume.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [self.view addSubview:volume];
        
        UILabel *type = [[UILabel alloc] initWithFrame:CGRectMake(margin + labelWidth / 4, top, labelWidth * 3 / 4, 20)];
        type.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        type.numberOfLines = 0;
        type.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [self.view addSubview:type];
        

        top += (20 + margin);
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Mark adjusting height

- (CGFloat)heightForDescription:(NSString *)description {
    
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                context:nil];
    
    return bounding.size.height;
    
}

- (CGFloat)heightForDirections:(NSString *)description {
    
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin - 40, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                context:nil];
    
    return bounding.size.height;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
