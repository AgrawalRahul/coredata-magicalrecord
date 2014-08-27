//
//  FTPUserViewController.m
//  magicalrecord
//
//  Created by Rahul Agrawal on 23/08/2014.
//  Copyright (c) 2014 Rahul Agrawal. All rights reserved.
//

#import "FTPUserViewController.h"
#import "FPTAddUserController.h"
#import "User.h"

@interface FTPUserViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *data;

@end

@implementation FTPUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAddButton];
    [self setupTableView];
}

- (void)setupAddButton {
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(addUser:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)addUser:(UIButton *)button {
    FPTAddUserController *addUserController = [[FPTAddUserController alloc] init];
    [self.navigationController pushViewController:addUserController animated:NO];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                  style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.data = [User MR_findAll];
    if (self.data && self.data.count > 0) {
        [self.tableView reloadData];
    }
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    User *user = (User *)[self.data objectAtIndex:indexPath.row];
    cell.textLabel.text = [user.userName stringByAppendingFormat:@" - %@",[user.count stringValue]];
    return cell;
}

#pragma mark - UITableViewDelegate

@end
