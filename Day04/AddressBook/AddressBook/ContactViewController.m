//
//  ContactViewController.m
//  AddressBook
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import "ContactViewController.h"
#import "AddViewController.h"
#import "EditViewController.h"

@interface ContactViewController () <UIActionSheetDelegate, AddViewControllerDelegate, EditViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray* contacts;

@end

@implementation ContactViewController

// 懒加载
- (NSMutableArray*)contacts
{
    if (!_contacts) {
        _contacts = [NSMutableArray array];
    }
    return _contacts;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 添加左上角注销的按钮
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(logOut)];
    self.navigationItem.leftBarButtonItem = item;
    
    // 根据传过来的用户名设置标题
    self.navigationItem.title = [NSString stringWithFormat:@"%@的联系人", self.username];
    
    // 取消分割线(iOS8无效)
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
}

// 某一组有多少行
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

// cell 长啥样儿!!!
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* cellid = @"contact_cell";
    
    // 去缓存池找
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    // 赋值
    cell.textLabel.text = [self.contacts[indexPath.row] name];
    cell.detailTextLabel.text = [self.contacts[indexPath.row] number];
    
    return cell;
}

// 添加联系人的代理方法(逆传)
- (void)addViewController:(AddViewController*)addViewController withContact:(Contact*)contact
{
    // 把模型数据放到 contacts 的数组当中
    [self.contacts addObject:contact];
    
    // 刷新
    [self.tableView reloadData];
}

// 编辑联系人的代理方法
- (void)editViewController:(EditViewController*)editViewController withContact:(Contact*)contact
{
    [self.tableView reloadData];
}

// 只要走 sb 线 无论是自动型还是手动型都会调用
- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    
    UIViewController* vc = segue.destinationViewController;
    
    // 判断目标控制器的真实类型
    if ([vc isKindOfClass:[AddViewController class]]) {
        // 设置代理
        AddViewController* add = (AddViewController*)vc;
        add.delegate = self;
    }
    else {
        // 顺传赋值
        EditViewController* edit = (EditViewController*)vc;
        
        // 设置代理
        edit.delegate = self;
        
        // 获取点击 cell 的位置(indexpath)
        NSIndexPath* path = [self.tableView indexPathForSelectedRow];
        
        // 获取模型
        Contact* con = self.contacts[path.row];
        
        // 赋值
        edit.contact = con;
    }
}
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//
//    [self.tableView reloadData];
//}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    [self.tableView reloadData];
//}

// 注销按钮的点击事件
- (void)logOut
{
    UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:@"你确定要注销嘛?!" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    
    [sheet showInView:self.view];
}

// acitonSheet的点击事件 buttonIndex: 从0开始 从上往下依次递增
- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        // 返回上一个控制器
        [self.navigationController popViewControllerAnimated:YES];
    }
}

// item 枚举的区别
- (void)test
{
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:nil]; // 细
    
    UIBarButtonItem* item1 = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStyleDone target:self action:nil]; // 粗
    
    self.navigationItem.leftBarButtonItems = @[ item, item1 ];
}

@end
