//
import("stdfaust.lib");
//
//does not use any common .dsp file
//
//--------------------------------------------------------------------------------------//
//CONTROL PARAMETERS
//--------------------------------------------------------------------------------------//
//
//FOR PEAKAMP
//
//nsamp is the number of samples corresponding to the selected duration//
//
nsamp = int(hslider("v:peakamp/period [unit:msec]", 10, 1, 5000, 1) * millisec);
//number of samples for one millisecond of signal//
millisec = ma.SR / 1000.0;

peakamp(n) = maxVal(n) : ba.sAndH(getPeak) with {
	maxVal(n) = (_, abs) ~ (max : *(1 - resetMax)) : (_, !);
	resetMax = ba.pulse(n)@1;
	getPeak = ba.pulse(n);
};
