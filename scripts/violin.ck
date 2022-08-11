//Simple SawOsc violin with ADSR envelope and vibrato
SinOsc vibrato => SinOsc viol => ADSR env => dac;

//Tell the osc to interpret input as freq. modulation.
2 => viol.sync;
// set vibrato freq to 6Hz
6.0 => vibrato.freq;
//set all ADSR params at once
env.set(0.1::second, 0.1::second, 0.5, 0.1::second);

//define a D major scale (in MIDI note nos)
[62, 64, 66, 67, 69, 71, 73, 74] @=> int scale[];
//run through our scale one note at a time
for(0=>int i; i< scale.cap(); i++)
{
    //set freq accordingly to note no.
    //Std.mtof(scale[i]) => viol.freq => vibrato.freq;
    Math.random2f(300.0,1000.0) => viol.freq;
    Math.random2f(300.0,1000.0) => vibrato.freq;
    //trigger note and wait a bit
    1 => env.keyOn;
    0.5 :: second => now;
    //turn off note and wait a bit
    1 => env.keyOff;
    0.1::second => now;
}
//repeat last note with lots of vibrato
1 => env.keyOn;
10.0 => vibrato.gain;
1.0::second => now;
0 => env.keyOff;
0.2 ::second => now;