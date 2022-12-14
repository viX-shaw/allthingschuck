// clap.ck
// on the fly drumming with global BPM conducting
SndBuf clap => dac;
0.3 => clap.gain;
me.dir(-2)+"/audio/clap_01.wav" => clap.read;
// make a conductor
// this is set and controlled elsewhere
BPM tempo;
while (1) {
 // our basic beat for this instrument
 // update this every measure
 tempo.sixteenthNote => dur sixteenth;
 // play a whole measure of 16 16th notes
 for (0 => int beat; beat < 16; beat++) {
 // clap randomly on 16th notes
 if (Math.random2(0,7) < 3) {
 0 => clap.pos;
 }
 sixteenth => now;
 }
} 