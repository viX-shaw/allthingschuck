// bass.ck
// sound chain - mandolin for bass, adjusted params
//               for a big body 

Mandolin bass => NRev r => dac;
//parameter setup

.1 => r.mix;
.0 => bass.stringDamping;
.02 => bass.stringDetune;
.05 => bass.bodySize;
.5 => bass.gain;

//jazz scale data
[41,43,45,48,50,51,53,60,63] @=> int scale[];
4 => int walkPos;

//loop
while(true) {
    Math.random2(-1, 1) +=> walkPos;
    if (walkPos < 0) 1 => walkPos;
    if (walkPos >= scale.cap()) scale.cap()-2 => walkPos;
    
    Std.mtof(scale[walkPos]-12) => bass.freq;
    Math.random2f(.05, .5) => bass.pluckPos;
    1 => bass.noteOn;
    .55 :: second => now;
    1 => bass.noteOff;
    .05 :: second => now;
}