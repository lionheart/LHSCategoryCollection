//
//  UIView+LHSAdditions.h
//  LHCategoryCollection
//
//  Copyright (c) 2013 Lionheart Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LHSAdditions)

- (NSArray *)lhs_expandToFillSuperview;
- (NSArray *)lhs_addConstraints:(NSString *)constraint views:(NSDictionary *)views;
- (NSArray *)lhs_addConstraints:(NSString *)constraint metrics:(NSDictionary *)metrics views:(NSDictionary *)views;
- (NSArray *)lhs_centerHorizontallyForView:(UIView *)view;
- (NSArray *)lhs_centerVerticallyForView:(UIView *)view;
- (NSArray *)lhs_centerHorizontallyForView:(UIView *)view width:(CGFloat)width;
- (NSArray *)lhs_centerVerticallyForView:(UIView *)view height:(CGFloat)height;
- (CGFloat)lhs_distanceToPoint:(CGPoint)point;
- (void)lhs_removeSubviews;

@end
