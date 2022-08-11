// snare.ck
// on the fly drumming with global BPM conducting
SndBuf snare => dac;
me.dir(-2)+"/audio/snare_01.wav" => snare.read;
0.5 => snare.gain;
snare.samples() => snare.pos;
// make a conductor for our tempo
// this is set and updated elsewhere
BPM tempo;

while(1)
{
    //update our basic beat each measure
    tempo.quarterNote => dur quarter;
    //play measure of rest, snare, rest, sna-snare
    quarter => now; //rest
    
    0 => snare.pos;
    2.0*quarter => now; //snare and rest 2 beats
   
    0 => snare.pos;
    quarter/4.0 => now; //snare and wait quarter of a beat
    
    0 => snare.pos;
    (quarter*3.0)/4.0 => now;//snare and wait rest of the beat
}