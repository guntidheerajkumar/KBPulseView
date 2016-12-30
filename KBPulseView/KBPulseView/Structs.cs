using System;
using ObjCRuntime;

namespace KBPulseView
{
	[Native]
	public enum KBPulseViewAnimationType : ulong
	{
		RegularPulsing,
		RadarPulsing
	}
}
