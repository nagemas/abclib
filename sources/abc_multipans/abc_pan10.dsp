//--------------------------------------------------------------------------------------//
//----------------------------------------abclib----------------------------------------//
//
//-------------------------------FAUST CODE FOR MIXED MUSIC-----------------------------//
//
//-------------------------------- BY ALAIN BONARDI - 2019 -----------------------------//
//--------------------------------------------------------------------------------------//

declare name "abc_pan10";
declare author "Alain Bonardi";
declare licence "GPLv3";

import("stdfaust.lib");
import("../abccommon/abcmultipan.dsp");

//--------------------------------------------------------------------------------------//
//NUMBER OF OSCILLATORS TO MODIFY
//--------------------------------------------------------------------------------------//

process = multipan(10);