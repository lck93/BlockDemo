//
//  OneViewController.m
//  BlockDemo
//
//  Created by 林初开 on 16/1/14.
//  Copyright © 2016年 林初开. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"

@interface OneViewController ()<PassValueDelegate>
{
    TwoViewController *two;
    UILabel  *lab;
    NSString *str;
    UIButton *btn;
}

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 300, 44)];
    [btn setTintColor:[UIColor blackColor]];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    two = [[TwoViewController alloc] init];
    two.delegate =self;
    lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, 300, 44)];
    [btn setTitle:@"跳转到第二个界面" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(receiveMessage) forControlEvents:UIControlEventTouchUpInside];
//    two = [[TwoViewController alloc] init];
    [self.view addSubview:btn];
    [self.view addSubview:lab];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setValueFromTwo:) name:@"postValueToOne" object:nil];
    
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
   
    // tabbar点击 block回调
    __weak typeof(lab) weakSelf = lab;   // 防止死循环
    two.MyBlock = ^(NSInteger num){
         weakSelf.text = [NSString stringWithFormat:@"%ld",num];
    };
  
    
    
}
-(void)setValueFromTwo:(NSNotification *)noti
{
    lab.text = noti.object;
}
-(void)getTwoVCValueToOne:(NSString *)string{
    lab.text = string;
}
-(void)receiveMessage
{
    
    [self presentViewController:two animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

