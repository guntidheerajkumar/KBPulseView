using System;
using CoreGraphics;
using KBPulseView;
using UIKit;

namespace Sample
{
	public partial class ViewController : UIViewController
	{
		protected ViewController(IntPtr handle) : base(handle)
		{
			// Note: this .ctor should not contain any initialization logic.
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			var plusView = new UIView(new CGRect(30, 60, 40, 40));
			plusView.Layer.CornerRadius = 10f;
			plusView.BackgroundColor = UIColor.Blue;
			this.View.AddSubview(plusView);
			UIView_KBPulseView.StartPulseWithColor(plusView, UIColor.Blue, KBPulseViewAnimationType.RadarPulsing);
		}
	}
}