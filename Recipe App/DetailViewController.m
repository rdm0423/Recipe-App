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
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:scrollView];
    scrollView.scrollEnabled = YES;
    
    CGFloat topMargin = 20;
    CGFloat heightForDescription = [self heightForDescription:[RARecipes descriptionAtIndex:self.recipeIndex]];
    CGFloat labelWidth = self.view.frame.size.width - 2 * margin;
    
    //food image
    UIImageView *recipeImage = [[UIImageView alloc] initWithFrame:CGRectMake(200, 70, 50, 50)];
    NSString *imageString = [NSString stringWithFormat:@"%@",[RARecipes imageAtIndex:self.recipeIndex]];
    recipeImage.image = [UIImage imageNamed:imageString];
    [scrollView addSubview:recipeImage];
    
    //description label
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, labelWidth, 20)];
    descriptionLabel.text = @"Description";
    descriptionLabel.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
    [scrollView addSubview:descriptionLabel];
    
    
    // need to adjust top margin for every label
    CGFloat tempTop = topMargin + 20;
    
    //Recipe Description
    UILabel *recipeDescription = [[UILabel alloc] initWithFrame:CGRectMake(margin, tempTop, labelWidth, heightForDescription)];
    recipeDescription.text = [RARecipes descriptionAtIndex:self.recipeIndex];
    recipeDescription.numberOfLines = 0;
    recipeDescription.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    [scrollView addSubview:recipeDescription];
    
    // variable to track top value
    CGFloat top = topMargin + heightForDescription + margin * 2;
    
    //ingredient label
    UILabel *ingredientList = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, labelWidth, 20)];
    ingredientList.text = @"Ingredients";
    ingredientList.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
    [scrollView addSubview:ingredientList];
    
    top += 20 + margin;
    
    for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.recipeIndex]; i++) {
        
        UILabel *volume = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, labelWidth / 4, 20)];
        volume.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        volume.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [scrollView addSubview:volume];
        
        UILabel *type = [[UILabel alloc] initWithFrame:CGRectMake(margin + labelWidth / 4, top, labelWidth * 3 / 4, 20)];
        type.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        type.numberOfLines = 0;
        type.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [scrollView addSubview:type];

        top += (20 + margin);
        
    }
    
    top += margin;
    
    UILabel *directionsLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, labelWidth, 20)];
    directionsLabel.text = @"Directions";
    directionsLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    [scrollView addSubview:directionsLabel];
    
    top += 20 + margin;
    
    for (int i = 0; i < [[RARecipes directionsAtIndex:self.recipeIndex] count]; i++) {
        
        CGFloat height = [self heightForDirections:[RARecipes directionsAtIndex:self.recipeIndex][i]];
        
        UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, labelWidth, 15)];
        count.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        count.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        count.text = [NSString stringWithFormat:@"Step %d", i + 1];
        [scrollView addSubview:count];
        
        UILabel *direction = [[UILabel alloc] initWithFrame:CGRectMake(margin, top + 5, labelWidth, height)];
        direction.numberOfLines = 0;
        direction.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        direction.text = [RARecipes directionsAtIndex:self.recipeIndex][i];
        [scrollView addSubview:direction];
        
        top += (height + margin);
    
    }
    
    
    
    //setting content size of the scrollview after all the labels to account for total size.
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2.5);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Mark adjusting height - Josh Code

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
