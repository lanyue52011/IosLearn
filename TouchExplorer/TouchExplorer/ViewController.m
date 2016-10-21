//
//  ViewController.m
//  TouchExplorer
//
//  Created by 周登峰 on 8/15/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

static CGFloat const kMin=25;
static CGFloat const kMax=5;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //GCD
    
    dispatch_queue_t queun=dispatch_queue_create("com.tab.queun", nil);
    
    dispatch_async(queun, ^{
        NSLog(@" current thread= %@",[NSThread currentThread]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"main thread =%@", [NSThread currentThread]);
        });
    
    });
    
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    UISwipeGestureRecognizer *vertical=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(reportVertical:)];
    vertical.direction=UISwipeGestureRecognizerDirectionUp|UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:vertical];
    
    
    UISwipeGestureRecognizer *hertical=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(reportHertical:)];
    hertical.direction=UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:hertical];
    
//    
//   NSThread *thread= [[NSThread alloc] initWithTarget:self selector:@selector(displayLableFromTouches:) object:nil];
//    thread.threadPriority=0.1;
//    [thread start];
    //[NSThread detachNewThreadSelector:self toTarget:@selector(displayLableFromTouches:) withObject:nil];
    
    //[self performSelector:<#(nonnull SEL)#> withObject:<#(nullable id)#> afterDelay:<#(NSTimeInterval)#>]
    
   // [self performSelectorInBackground:@selector(displayLableFromTouches:) withObject:nil];
    
    
}

-(void)displayLableFromTouches:(NSSet *)touches{
    NSInteger numTaps=[[touches anyObject] tapCount];
    self.labelTaps.text=[[NSString alloc] initWithFormat:@"%ld次点击",(unsigned long)numTaps];
    
    NSInteger numTouches=[touches count];
    
    self.labelTouch.text=[[NSString alloc] initWithFormat:@"%ld个手指点击",(unsigned long)numTouches];
    
}


-(void)reportVertical:(UISwipeGestureRecognizer *)recognizer{
    self.textMessage.text=@"垂直方向上滑动！";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
         self.textMessage.text=@"";
    });
    
}
-(void)reportHertical:(UISwipeGestureRecognizer *)recognizer{
    self.textMessage.text=@"水平方向滑动！";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
       self.textMessage.text=@"";
    });
}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//   // self.textMessage.text=@"touchesBegin!";
//    self.StartPoint=   [[touches anyObject] locationInView:self.view];
//    //[self displayLableFromTouches:event.allTouches];
//}
//
//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    //self.textMessage.text=@"touches Ended!";
//    //[self displayLableFromTouches:event.allTouches];
//}

//-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    //self.textMessage.text=@"touches Moved!";
//    //[self displayLableFromTouches:event.allTouches];
//    
//    UITouch *touche=[touches anyObject];
//    CGPoint endPoint=[touche locationInView:self.view];
//    
//    CGFloat dx=fabs(endPoint.x-self.StartPoint.x);
//    CGFloat dy=fabs(endPoint.y-self.StartPoint.y);
//    //水平方向滑动
//    if(dx>=kMin&&dy<kMin){
//        self.textMessage.text=@"水平方向滑动！";
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0*NSEC_PER_SEC),dispatch_get_main_queue(),^{
//        self.textMessage.text=@"";
//        });
//    } else if(dy>=kMin&&dx<=kMin){
//        self.textMessage.text=@"垂直方向上滑动！";
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0*NSEC_PER_SEC),dispatch_get_main_queue(),^{
//           self.textMessage.text=@"";
//        });
//    }
//    
//    
//}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   // self.textMessage.text=@"touches Cancelled!";
   // [self displayLableFromTouches:event.allTouches];
}

- (IBAction)btnTip:(id)sender {
}
@end
