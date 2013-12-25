//
//  UIView+LHSAdditions.m
//  LHSCategoryCollection
//
//  Copyright (c) 2013 Lionheart Software LLC. All rights reserved.
//

#import "UIView+LHSAdditions.h"

@implementation UIView (LHSAdditions)

#pragma mark - Auto Layout Helpers

- (NSLayoutConstraint *)lhs_constraintForWidth:(CGFloat)width {
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:width];
}

- (NSLayoutConstraint *)lhs_constraintForHeight:(CGFloat)height {
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:height];
}

- (NSArray *)lhs_fillHeightOfSuperview {
    NSArray *constraints = [self.superview lhs_addConstraints:@"V:|[view]|" views:@{@"view": self}];
    [self.superview addConstraints:constraints];
    return constraints;
}

- (NSArray *)lhs_fillWidthOfSuperview {
    NSArray *constraints = [self.superview lhs_addConstraints:@"H:|[view]|" views:@{@"view": self}];
    [self.superview addConstraints:constraints];
    return constraints;
}

- (NSArray *)lhs_expandToFillSuperview {
    return [[self lhs_fillHeightOfSuperview] arrayByAddingObjectsFromArray:[self lhs_fillWidthOfSuperview]];
}

- (NSArray *)lhs_centerHorizontallyForView:(UIView *)view {
    return [self lhs_centerHorizontallyForView:view width:0];
}

- (NSArray *)lhs_centerVerticallyForView:(UIView *)view {
    return [self lhs_centerVerticallyForView:view height:0];
}

- (NSArray *)lhs_centerHorizontallyForView:(UIView *)view width:(CGFloat)width {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [self addConstraint:constraint];
    
    NSMutableArray *constraints = [@[constraint] mutableCopy];
    
    if (width > 0) {
        [constraints addObjectsFromArray:[self lhs_addConstraints:@"H:|-(>=1)-[view(width)]-(>=1)-|" metrics:@{@"width": @(width)} views:@{@"view": view}]];
    }
    
    return constraints;
}

- (NSArray *)lhs_centerVerticallyForView:(UIView *)view height:(CGFloat)height {
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self addConstraint:constraint];
    
    NSMutableArray *constraints = [@[constraint] mutableCopy];
    
    if (height > 0) {
        [constraints addObjectsFromArray:[self lhs_addConstraints:@"V:|-(>=1)-[view(height)]-(>=1)-|" metrics:@{@"height": @(height)} views:@{@"view": view}]];
    }
    
    return constraints;
}

#pragma - Auto Layout

- (NSArray *)lhs_addConstraints:(NSString *)constraint views:(NSDictionary *)views {
    return [self lhs_addConstraints:constraint metrics:0 views:views];
}

- (NSArray *)lhs_addConstraints:(NSString *)constraint metrics:(NSDictionary *)metrics views:(NSDictionary *)views {
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:constraint options:0 metrics:metrics views:views];
    [self addConstraints:constraints];
    return constraints;
}

#pragma - Helpers

- (CGFloat)lhs_distanceToPoint:(CGPoint)point {
    if (CGRectContainsPoint(self.frame, point)) {
        return 0;
    }
    
    CGPoint closest = self.frame.origin;
    if (self.frame.origin.x + self.frame.size.width < point.x) {
        closest.x += self.frame.size.width;
    }
    else if (point.x > self.frame.origin.x) {
        closest.x = point.x;
    }
    
    if (self.frame.origin.y + self.frame.size.height < point.y) {
        closest.y += self.frame.size.height;
    }
    else if (point.y > self.frame.origin.y) {
        closest.y = point.y;
    }
    
    CGFloat a = powf(closest.y-point.y, 2);
    CGFloat b = powf(closest.x-point.x, 2);
    return sqrtf(a + b);
}

#pragma mark - Utilities

- (void)lhs_removeSubviews {
    NSArray *subviews = [self subviews];
    for (UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
}

@end
