//
//  AccitentDetailController.h
//  fqnp
//
//  Created by 周登峰 on 8/3/16.
//  Copyright © 2016 cnpdc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AccidentController;
@interface AccitentDetailController : UIViewController
@property(strong,nonatomic) NSDictionary *event;
@property(weak,nonatomic) AccidentController *accidentController;
@end
