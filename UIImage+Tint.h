//
//  UIImage+Tint.h
//  LHSCategoryCollection
//
//  Created by Dan Loewenherz on 12/17/13.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Tint)

- (UIImage *)imageWithColor:(UIColor *)color;
- (UIImage *)imageWithAlpha:(CGFloat)alpha;

@end
