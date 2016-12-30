using System;
using Foundation;
using UIKit;

namespace KBPulseView
{
	// @interface KBPulseView (UIView)
	[Category]
	[BaseType(typeof(UIView))]
	interface UIView_KBPulseView
	{
		// -(void)startPulseWithColor:(UIColor *)color;
		[Export("startPulseWithColor:")]
		void StartPulseWithColor(UIColor color);

		// -(void)startPulseWithColor:(UIColor *)color animation:(KBPulseViewAnimationType)animationType;
		[Export("startPulseWithColor:animation:")]
		void StartPulseWithColor(UIColor color, KBPulseViewAnimationType animationType);

		// -(void)startPulseWithColor:(UIColor *)color scaleFrom:(CGFloat)initialScale to:(CGFloat)finishScale frequency:(CGFloat)frequency opacity:(CGFloat)opacity animation:(KBPulseViewAnimationType)animationType;
		[Export("startPulseWithColor:scaleFrom:to:frequency:opacity:animation:")]
		void StartPulseWithColor(UIColor color, nfloat initialScale, nfloat finishScale, nfloat frequency, nfloat opacity, KBPulseViewAnimationType animationType);

		// -(void)stopPulse;
		[Export("stopPulse")]
		void StopPulse();
	}
}
