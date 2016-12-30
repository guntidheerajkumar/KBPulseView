

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CAAnimation.h>

typedef NS_ENUM(NSUInteger, KBPulseViewAnimationType) {
    KBPulseViewAnimationTypeRegularPulsing,
    KBPulseViewAnimationTypeRadarPulsing
};

@interface UIView (KBPulseView)

- (void)startPulseWithColor:(UIColor *)color;

- (void)startPulseWithColor:(UIColor *)color animation:(KBPulseViewAnimationType)animationType;

- (void)startPulseWithColor:(UIColor *)color scaleFrom:(CGFloat)initialScale to:(CGFloat)finishScale frequency:(CGFloat)frequency opacity:(CGFloat)opacity animation:(KBPulseViewAnimationType)animationType;

- (void)stopPulse;

@end
