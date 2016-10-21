//
//  GCD.m
//  CommanLIB
//
//  Created by 周登峰 on 10/14/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "GCD.h"

@implementation GCD

-(void) initGCD{
    
    //执行一次
    dispatch_once_t onceT;
    dispatch_once(&onceT, ^{
        //do
    });
    
    //异步
    
    dispatch_queue_t globalQ=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQ, ^{
        //[self tableviewLoadData];
        
       dispatch_async(dispatch_get_main_queue(), ^{
           //同步到主界面
       });
    });
    //dis
    
    
    dispatch_sync(globalQ, ^{
        //同步等待本代码块执行完成才进行后面的工作
        
        
    });
    
    //dispatch_group_create()
    
    double delaySecont=2.0;
    dispatch_time_t popTimt=  dispatch_time(DISPATCH_TIME_NOW, delaySecont*NSEC_PER_SEC);
    dispatch_after(popTimt, globalQ, ^{
        //两秒后执行
    });
    
    //自己创建执行串行队列名称
    dispatch_queue_t uq=dispatch_queue_create("com.tab.p", nil);
    dispatch_async(uq, ^{
        //任务一
    });
    dispatch_async(uq, ^{
        //任务二
    });

    
    
    //任务组
    dispatch_group_t group=dispatch_group_create();
    
    dispatch_group_async(group,   globalQ, ^{
        //d1线程1
    });
    
    dispatch_group_async(group,   globalQ, ^{
        //d2线程2
    });
    
    dispatch_group_notify(group, globalQ, ^{
        //d1,d2 处理完成后执行...
    });
    
    
}


@end
