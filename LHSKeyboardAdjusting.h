//
//  LHSKeyboardAdjusting.h
//  LHSCategoryCollection
//
//  Created by Dan Loewenherz on 3/18/14.
//
//

#import <UIKit/UIKit.h>

@protocol LHSKeyboardAdjusting <NSObject>

- (NSLayoutConstraint *)keyboardAdjustingBottomConstraint;

@end