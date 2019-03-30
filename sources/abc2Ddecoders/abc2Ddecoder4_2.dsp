//--------------------------------------------------------------------------------------//
//----------------------------------------abclib----------------------------------------//
//
//-------------------------------FAUST CODE FOR MIXED MUSIC-----------------------------//
//
//-------------------------------- BY ALAIN BONARDI - 2019 -----------------------------//
//--------------------------------------------------------------------------------------//

declare name "abc2Ddecoder4_2";
declare author "Alain Bonardi";
declare licence "GPLv3";

import("stdfaust.lib");
import("../abccommon/abc2ddecoder.dsp");

//--------------------------------------------------------------------------------------//
//HOA DECODER AT ORDER AO TO NL LOUDSPEAKERS//
//--------------------------------------------------------------------------------------//

//--------------------------------------------------------------------------------------//
//AMBISONIC ORDER AND NUMBER OF LOUDSPEAKERS
//--------------------------------------------------------------------------------------//
ao = 4;
nl = 2;

//--------------------------------------------------------------------------------------//
//A VECTOR OF GAINS ON THE OUTPUT
//--------------------------------------------------------------------------------------//
leftDispatcher = _<:(*(1-direct), *(direct));
rightDispatcher = _<:(*(direct), *(1-direct));

//--------------------------------------------------------------------------------------//
//DECODING
//--------------------------------------------------------------------------------------//
process = ho.decoderStereo(ao) : gainLine : (leftDispatcher, rightDispatcher) :> (_, _);