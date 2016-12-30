
#import "UIView+KBPulseView.h"

NSString *const KBPulseKey = @"KBPulseKey";
NSString *const KBRadarKey = @"KBRadarKey";
NSString *const KBLayerName = @"KBLayerName";

@implementation UIView (KBPulseView)

- (void)startPulseWithColor:(UIColor *)color {
    [self startPulseWithColor:color scaleFrom:1.2f to:1.4f frequency:1.0f opacity:0.7f animation:KBPulseViewAnimationTypeRegularPulsing];
}

- (void)startPulseWithColor:(UIColor *)color animation:(KBPulseViewAnimationType)animationType {
    CGFloat frequency = animationType == KBPulseViewAnimationTypeRadarPulsing ? 1.5f : 1.0f;
    CGFloat startScale = animationType == KBPulseViewAnimationTypeRadarPulsing ? 1.0f : 1.2f;
    [self startPulseWithColor:color scaleFrom:startScale to:1.4f frequency:frequency opacity:0.7f animation:animationType];
}

- (void)startPulseWithColor:(UIColor *)color scaleFrom:(CGFloat)initialScale to:(CGFloat)finishScale frequency:(CGFloat)frequency opacity:(CGFloat)opacity animation:(KBPulseViewAnimationType)animationType {
    CALayer *externalBorder = [CALayer layer];
    externalBorder.frame = self.frame;
    externalBorder.cornerRadius = self.layer.cornerRadius;
    externalBorder.backgroundColor = color.CGColor;
    externalBorder.opacity = opacity;
    externalBorder.name = KBLayerName;
    self.layer.masksToBounds = NO;
    [self.layer.superlayer insertSublayer:externalBorder below:self.layer];

    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @(initialScale);
    scaleAnimation.toValue = @(finishScale);
    scaleAnimation.duration = frequency;
    scaleAnimation.autoreverses = animationType == KBPulseViewAnimationTypeRegularPulsing;
    scaleAnimation.repeatCount = INT32_MAX;
    [externalBorder addAnimation:scaleAnimation forKey:KBPulseKey];

    if (animationType == KBPulseViewAnimationTypeRadarPulsing) {
        CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.fromValue = @(opacity);
        opacityAnimation.toValue = @(0.0);
        opacityAnimation.duration = frequency;
        opacityAnimation.autoreverses = NO;
        opacityAnimation.repeatCount = INT32_MAX;
        [externalBorder addAnimation:opacityAnimation forKey:KBRadarKey];
    }
}

- (void)stopPulse {
    [self.layer removeAnimationForKey:KBPulseKey];
    [self.layer removeAnimationForKey:KBRadarKey];
    CALayer *externalBorderLayer = [self externalBorderLayer];
    if (externalBorderLayer) {
        [externalBorderLayer removeFromSuperlayer];
    }
}

- (CALayer *)externalBorderLayer {
    for (CALayer *layer in self.layer.superlayer.sublayers) {
        if ([layer.name isEqualToString:KBLayerName]) {
            return layer;
        }
    }
    return nil;
}

@end
