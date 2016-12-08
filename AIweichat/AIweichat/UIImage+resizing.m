//
//  UIImage+resizing.m
//  AIQQ聊天
//
//  Created by qianfeng on 15/8/16.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "UIImage+resizing.h"

@implementation UIImage(resizing)
- (UIImage *)resizingModeStretch:(NSString*)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    UIImage * changeImage = [image resizableImageWithCapInsets:(UIEdgeInsetsMake(imageH * 0.5, imageW *0.5, imageH * 0.5, imageW *0.5)) resizingMode:(UIImageResizingModeStretch)];
    return changeImage;
}
@end
