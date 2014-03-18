//
//  UIViewController+LHSKeyboardAdjustment.h
//  LHSCategoryCollection
//
//  Created by Dan Loewenherz on 3/18/14.
//
//

#import <UIKit/UIKit.h>

@protocol LHSKeyboardResizing <NSObject>

- (NSLayoutConstraint *)keyboardResizingBottomConstraint;

@end

@interface UIViewController (LHSKeyboardAdjustment) <LHSKeyboardResizing>

- (void)lhs_keyboardWillHide:(NSNotification *)sender;
- (void)lhs_keyboardDidShow:(NSNotification *)sender;
- (void)lhs_addObserversForKeyboardAdjustment;
- (void)lhs_removeObserversForKeyboardAdjustment;

@end
