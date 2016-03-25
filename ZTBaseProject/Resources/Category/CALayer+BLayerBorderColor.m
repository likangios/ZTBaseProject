//
//  CALayer+BLayerBorderColor.m
//  Box
//
//  Created by FengLing on 16/1/5.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "CALayer+BLayerBorderColor.h"
#import <objc/runtime.h>

#undef   KEY_BORDERCOLOR
#define KEY_BORDERCOLOR     "CALayer.borderColorWithUIColor"

#undef   KEY_BORDERSELECTEDCOLOR
#define KEY_BORDERSELECTEDCOLOR     "CALayer.borderSelectedColorWithUIColor"

@implementation CALayer (BLayerBorderColor)

- (UIColor *)borderColorWithUIColor{
    NSObject *obj = objc_getAssociatedObject(self, KEY_BORDERCOLOR);
    if (obj && [obj isKindOfClass:[UIColor class]]) {
        return (UIColor *)obj;
    }
    return nil;
}
- (void)setBorderColorWithUIColor:(UIColor *)borderColorWithUIColor{
    objc_setAssociatedObject(self, KEY_BORDERCOLOR, borderColorWithUIColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.borderColor = borderColorWithUIColor.CGColor;
}

- (UIColor *)borderSelectedColorWithUIColor{
    NSObject *obj = objc_getAssociatedObject(self, KEY_BORDERSELECTEDCOLOR);
    if (obj && [obj isKindOfClass:[UIColor class]]) {
        return (UIColor *)obj;
    }
    return nil;
}
- (void)setBorderSelectedColorWithUIColor:(UIColor *)borderSelectedColorWithUIColor{
    objc_setAssociatedObject(self, KEY_BORDERSELECTEDCOLOR, borderSelectedColorWithUIColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
