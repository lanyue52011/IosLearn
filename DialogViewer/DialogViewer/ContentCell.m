//
//  ContentCell.m
//  DialogViewer
//
//  Created by 周登峰 on 7/19/16.
//  Copyright © 2016 tab. All rights reserved.
//

#import "ContentCell.h"

@implementation ContentCell

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        self.label=[[UILabel alloc] initWithFrame:self.contentView.bounds];
        self.label.opaque=NO;
        self.label.backgroundColor=[UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0];
        self.label.textColor=[UIColor blackColor];
        self.label.textAlignment=NSTextAlignmentCenter;
        self.label.font=[[self class] defaultFont];
        [self.contentView addSubview:self.label];
    }
    return  self;
}
+(UIFont *) defaultFont{
    return [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}
+(CGSize)sizeForContentString:(NSString *)s forMaxWidth:(CGFloat)maxWidth{
    CGSize maxSize=CGSizeMake(maxWidth, 1000);
    NSStringDrawingOptions opts=NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading;
    
    NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc]init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    
    NSDictionary *attribute=@{NSFontAttributeName:[self defaultFont],NSParagraphStyleAttributeName:style};
    
    CGRect rect=[s boundingRectWithSize:maxSize options:opts attributes:attribute context:nil];
    return rect.size;
}
-(NSString *)text{
    return  self.label.text;
}

-(void)setText:(NSString *)text {
    self.label.text=text;
    CGRect newLableFrame=self.label.frame;
    CGRect newContentFrame=self.contentView.frame;
    CGSize textSize=[[self class] sizeForContentString:text forMaxWidth:_maxWidth];
    newLableFrame.size=textSize;
    self.label.frame=newLableFrame;
    self.contentView.frame=newContentFrame;
}
@end
