//
//  ViewController.m
//  hua0405
//
//  Created by 小龙 on 2019/4/5.
//  Copyright © 2019 onepiece. All rights reserved.
//

#import "ViewController.h"
#import "fishhook.h"
#import "SecViewController.h"

@interface ViewController ()

@end

@implementation ViewController

static ViewController* ctl;

-(int)getasge{
    return 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ctl = self;
    //定义rebinding 结构体
    struct rebinding _rebinding = {};
    _rebinding.name = "NSLog";  //  这个写对应的系统函数名
    _rebinding.replaced = (void *)&SysLog;
    _rebinding.replacement = MyLog;
    
    //将上面的结构体 放入 reb结构体数组中
    struct rebinding bind[] = {_rebinding};
    
    /*
     * arg1 : 结构体数据组
     * arg2 : 数组的长度
     */
    rebind_symbols(bind, 1);
    // Do any additional setup after loading the view.
}


static void (*SysLog)(NSString *format, ...);

//void MyLog(NSString *format, ...)
void MyLog(){
    //format = [format stringByAppendingString:@" 我是fish 钩子"];
    //SysLog(format);
    SysLog(@"我是一条小小小鱼");
    SecViewController* next = [[SecViewController alloc]init];
    [ctl presentViewController:next animated:false completion:^{
        //free(<#void *#>)
        ctl = NULL;
    }];
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"fhdskjfhds");
}
@end
