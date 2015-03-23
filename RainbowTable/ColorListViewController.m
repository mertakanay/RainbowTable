//
//  ViewController.m
//  RainbowTable
//
//  Created by Mert Akanay on 16.03.2015.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ColorListViewController.h"

@interface ColorListViewController () <UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *colorsArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ColorListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.colorsArray = [NSMutableArray arrayWithObjects:[UIColor redColor],[UIColor cyanColor],[UIColor greenColor],[UIColor magentaColor],[UIColor yellowColor],[UIColor orangeColor], [UIColor colorWithRed:75/255.0 green:0.0 blue:130/255.0 alpha:1.0], nil];

}
- (IBAction)addColorOnTapped:(UIBarButtonItem *)sender
{
    CGFloat r = (float)rand() / RAND_MAX;
    CGFloat g = (float)rand() / RAND_MAX;
    CGFloat b = (float)rand() / RAND_MAX;
    UIColor *newColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    [self.colorsArray addObject:newColor];
    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource Protocols

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.text = [NSString stringWithFormat:@"Row: %li", (long)indexPath.row];
    UIColor *color = [self.colorsArray objectAtIndex:indexPath.row];
    cell.backgroundColor = color;

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.colorsArray.count;
}

@end
