 //
//  UIViewController+LHSKeyboardAdjustment.h
//  LHSCategoryCollection
//
//  Created by Dan Loewenherz on 3/18/14.
//
//

#import <UIKit/UIKit.h>
#import "LHSKeyboardAdjusting.h"

typedef void (^LHSKeyboardAdjustingBlock)();

@interface UIViewController (LHSKeyboardAdjustment) <LHSKeyboardAdjusting>

- (void)lhs_keyboardWillHide:(NSNotification *)sender;
- (void)lhs_keyboardDidShow:(NSNotification *)sender;
- (void)lhs_activateKeyboardAdjustment;
- (void)lhs_activateKeyboardAdjustmentWithShow:(LHSKeyboardAdjustingBlock)show
                                          hide:(LHSKeyboardAdjustingBlock)hide;
- (void)lhs_deactivateKeyboardAdjustment;

@end
