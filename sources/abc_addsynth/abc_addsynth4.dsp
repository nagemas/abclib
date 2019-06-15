//--------------------------------------------------------------------------------------//
//----------------------------------------abclib----------------------------------------//
//
//-------------------------------FAUST CODE FOR MIXED MUSIC-----------------------------//
//
//-------------------------------- BY ALAIN BONARDI - 2019 -----------------------------//
//--------------------------------------------------------------------------------------//

declare name "abc_addsynth4";
declare author "Alain Bonardi";
declare licence "GPLv3";

import("stdfaust.lib");
import("../abccommon/abcaddsynth.dsp");

//--------------------------------------------------------------------------------------//
//NUMBER OF OSCILLATORS TO MODIFY
//--------------------------------------------------------------------------------------//

process = multiosc(4);