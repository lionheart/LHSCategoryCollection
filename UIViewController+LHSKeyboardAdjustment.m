//
//  UIViewController+LHSKeyboardAdjustment.m
//  LHSCategoryCollection
//
//  Created by Dan Loewenherz on 3/18/14.
//
//

#import "UIViewController+LHSKeyboardAdjustment.h"

@implementation UIViewController (LHSKeyboardAdjustment)

- (void)lhs_addObserversForKeyboardAdjustment {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(lhs_keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(lhs_keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];;
}

- (void)lhs_removeObserversForKeyboardAdjustment {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
}

- (void)lhs_keyboardWillHide:(NSNotification *)sender {
    if ([self respondsToSelector:@selector(keyboardResizingBottomConstraint)]) {
        self.keyboardResizingBottomConstraint.constant = 0;
        [self.view layoutIfNeeded];
    }
}

- (void)lhs_keyboardDidShow:(NSNotification *)sender {
    if ([self respondsToSelector:@selector(keyboardResizingBottomConstraint)]) {
        CGRect frame = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGRect newFrame = [self.view convertRect:frame fromView:[[UIApplication sharedApplication] delegate].window];
        self.keyboardResizingBottomConstraint.constant = newFrame.origin.y - CGRectGetHeight(self.view.frame);
        [self.view layoutIfNeeded];
    }
}

@end
