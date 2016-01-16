//
//  TwoViewController.m
//  BlockDemo
//
//  Created by 林初开 on 16/1/14.
//  Copyright © 2016年 林初开. All rights reserved.
//

#import "TwoViewController.h"
#import "OneViewController.h"


@interface TwoViewController ()<UITextFieldDelegate>
{
    UILabel *titleLab;
    UIButton *blockBtn;
    UIButton *delegateBtn;
    UIButton *notificationBtn;
    UITextField *inputField;
    UILabel *inputLab;
}


@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, self.view.frame.size.width-100, 44)];
    titleLab.text = @"用以下的跳转方式将textField中的值传给第一个界面";
        [self.view addSubview:titleLab];
    //自动调节控件大小去适应字体
//    [lab setFont:[UIFont systemFontOfSize:44]];
    [titleLab setBackgroundColor:[UIColor orangeColor]];
    titleLab.numberOfLines = 0;
//    [lab sizeToFit];
    inputLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, 40, 36)];
    inputLab.text =@"输入";
    [self.view addSubview:inputLab];
    inputField =[[UITextField alloc] initWithFrame:CGRectMake(40, 64, 200, 36)];
    inputField.keyboardType =UIKeyboardAppearanceDefault;
    [self.view addSubview:inputField];
    

    blockBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    [blockBtn setTitle:@"用block传值" forState:UIControlStateNormal];
    [blockBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
  
    [self.view addSubview:blockBtn];

   
    [blockBtn addTarget:self action:@selector(goBackToOne) forControlEvents:UIControlEventTouchUpInside];
    
    delegateBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 50)];
    [delegateBtn setTitle:@"用代理传值" forState:UIControlStateNormal];
    [self.view addSubview:delegateBtn];
    [delegateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [delegateBtn addTarget:self action:@selector(delegateGoBackToOne) forControlEvents:UIControlEventTouchUpInside];
    
    notificationBtn =[[UIButton alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 50)];
    [self.view addSubview:notificationBtn];
    [notificationBtn setTitle:@"用通知传值" forState:UIControlStateNormal];
    [notificationBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [notificationBtn addTarget:self action:@selector(notificationGoBackToOne) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    return YES;
}
-(void)notificationGoBackToOne
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"postValueToOne" object:inputField.text];
}
-(void)delegateGoBackToOne
{
    if (self.delegate) {
        [self.delegate getTwoVCValueToOne:inputField.text];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
-(void)goBackToOne
{
    if (_MyBlock) {
        _MyBlock(5);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
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
