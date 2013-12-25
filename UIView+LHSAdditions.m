//
//  UIView+LHSAdditions.m
//  LHSCategoryCollection
//
//  Copyright (c) 2013 Lionheart Software LLC. All rights reserved.
//

#import "UIView+LHSAdditions.h"

@implementation UIView (LHSAdditions)

+ (UIView *)lhs_snapshotContainingStatusBar {
    UIView *view = [[UIScreen mainScreen] snapshotViewAfterScreenUpdates:NO];
    UIScreen *screen = [UIScreen mainScreen];
    return [view resizableSnapshotViewFromRect:CGRectMake(0, 0, screen.bounds.size.width, 20)
                            afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
}

#pragma mark - Auto Layout Helpers

- (NSArray *)lhs_expandToFillSuperview {
    NSMutableArray *constraints = [NSMutableArray array];
    [constraints addObject:[self.superview lhs_addConstraints:@"H:|[view]|" views:@{@"view": self}]];
    [constraints addObject:[self.superview lhs_addConstraints:@"V:|[view]|" views:@{@"view": self}]];
    return constraints;
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
