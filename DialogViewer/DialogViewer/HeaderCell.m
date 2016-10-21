//
//  HeaderCell.m
//  DialogViewer
//
//  Created by 周登峰 on 7/19/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        self.label.backgroundColor=[UIColor colorWithHue:0.9 saturation:0.9 brightness:0.9 alpha:1.0];
        self.label.textColor=[UIColor blackColor];

    }
    return self;
}
+(UIFont *) defaultFont{
    return [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}

@end
