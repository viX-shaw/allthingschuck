//Super simple Karplus-Strong plucked string
/*Impulse imp => Delay str => dac;

//connect string back into itself
str => str;
//round-trip string delay, 100Hz At 44.1k samplerate
441.0 :: samp => str.delay;
//set round-trip string gain to less than 1.0
0.98 => str.gain;
//"pluck" the string
1.0 => imp.next;
// let the string "ring" a bit
5.0 :: second => now;


Noise pluck => Delay str => dac;

//connect string back into itself
str => OneZero filter => str;
//round-trip string delay, 100Hz At 44.1k samplerate
441.0 :: samp => str.delay;
//set round-trip string gain to less than 1.0
0.98 => str.gain;
//"pluck" the string for the right amt. of time
1.0 => pluck.gain;
441.0 :: samp => now;
//shut off noise generator
0.0 => pluck.gain;
// let the string "ring" a bit
5.0 :: second => now;*/

//Allowing ADSR to control the plucking
//Even better karplus-string plucked string

Shakers nois => ADSR pluck => DelayA str => NRev s => NRev t => Dyno d => dac;

0 => nois.preset;
1 => nois.energy;
1 => nois.objects;
//hook string back into itself
str => OneZero lowpass => str;

//set ADSR noise envelope params
//pluck.set(0.008::second, 0.01::second, 0.0, 0.01::second);
pluck.set(0.002 :: second, 0.002 :: second, 1, 0.01 :: second);

while (true)
{
 Math.random2f(110.0, 440.0) :: samp => str.delay;
 // turn on note (pluck string) and wait a bit
 1 => pluck.keyOn;
 0.3 :: second => now;
 0 => pluck.keyOn;
 1 :: second => now;
 1 => nois.noteOn;
}