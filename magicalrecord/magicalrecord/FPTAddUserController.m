//
//  FPTAddUserController.m
//  magicalrecord
//
//  Created by Rahul Agrawal on 23/08/2014.
//  Copyright (c) 2014 Rahul Agrawal. All rights reserved.
//

#import "FPTAddUserController.h"
#import "User.h"

static const CGFloat margin = 10.0f;

@interface FPTAddUserController ()

@property (nonatomic, strong) UITextField *nameField;

@end

@implementation FPTAddUserController

- (id)init {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, 100, 60, 44)];
    nameLabel.text = @"name";
    [self.view addSubview:nameLabel];
    
    CGFloat nameFieldStart = nameLabel.frame.origin.x+nameLabel.frame.size.width + margin;
    CGFloat nameFieldWidth = self.view.frame.size.width - nameFieldStart - margin;
    
    self.nameField = [[UITextField alloc] initWithFrame:CGRectMake(nameFieldStart, 100,nameFieldWidth , 44)];
    [self.view addSubview:self.nameField];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Show View" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addName:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(10, 154, 100, 44);
    [self.view addSubview:button];
    
}

- (void)addName:(UIButton *)button {
    NSLog(@"%@ name added",self.nameField.text);
    User *user = [User MR_findFirstByAttribute:@"userName" withValue:self.nameField.text];
    if (user) {
        user.count = @([user.count  integerValue] + 1);
    } else {
        User *user = [User MR_createEntity];
        user.userName = self.nameField.text;
        user.count = @(1);
    }
    [[NSManagedObjectContext MR_defaultContext] saveToPersistentStoreAndWait];
    [self.navigationController popViewControllerAnimated:NO];
}


@end
