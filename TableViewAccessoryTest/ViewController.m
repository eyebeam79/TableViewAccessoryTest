//
//  ViewController.m
//  TableViewAccessoryTest
//
//  Created by SDT1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "ViewController.h"

#define CELL_ID @"CELL_ID"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController
{
    NSArray *data;
}

// 셀선택시 로그로 확인
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Select Row: %d", indexPath.row);
}

// 악세사리버튼 클릭시
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Accessory Button trapped: %d", indexPath.row);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    if (indexPath.row == 0)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else if (indexPath.row == 1)
    {
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
    }
    else if (indexPath.row == 2)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = data[indexPath.row];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    data = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
