//
//  TwoViewController.h
//  BlockDemo
//
//  Created by 林初开 on 16/1/14.
//  Copyright © 2016年 林初开. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol PassValueDelegate <NSObject>

-(void)getTwoVCValueToOne:(NSString *)string;

@end

@interface TwoViewController : UIViewController


@property(nonatomic,copy) void (^MyBlock)(NSInteger);

@property(nonatomic,assign) id<PassValueDelegate> delegate;
@end
