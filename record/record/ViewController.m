//
//  ViewController.m
//  record
//
//  Created by zglnbjys on 2018/12/26.
//  Copyright © 2018年 tianyaoqi. All rights reserved.
//

#import "ViewController.h"
#import "MyRecordHomeVC.h"
#import "MyLiveController.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTable;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myTable];
}

- (UITableView *)myTable {
    if (!_myTable) {
        _myTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _myTable.delegate = self;
        _myTable.dataSource = self;
    }
    return _myTable;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        [_dataSource addObject:@"直播"];
        [_dataSource addObject:@"视频"];
        [_dataSource addObject:@"IM"];
//        [_dataSource addObject:@""];
//        [_dataSource addObject:@""];
    }
    return _dataSource;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"UITableViewCell";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MyRecordHomeVC *vc = [[MyRecordHomeVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1) {
        MyLiveController *liveVc = [[MyLiveController alloc] init];
        [self.navigationController pushViewController:liveVc animated:YES];
    }
    
}

@end
