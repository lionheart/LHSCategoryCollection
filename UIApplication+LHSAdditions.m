//
//  UIApplication+LHSAdditions.m
//  LHSCategoryCollection
//
//  Created by Dan Loewenherz on 12/17/13.
//
//

#import "UIApplication+LHSAdditions.h"

@implementation UIApplication (LHSAdditions)

+ (BOOL)isIPad {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+ (BOOL)isIOS6OrGreater {
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0;
}

+ (CGSize)currentSize {
    return [UIApplication sizeInOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

+ (CGSize)sizeInOrientation:(UIInterfaceOrientation)orientation {
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        size = CGSizeMake(size.height, size.width);
    }
    
    return size;
}

@end
