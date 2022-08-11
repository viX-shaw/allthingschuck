//kick.ck on the fly drumming with global conducting BPM
SndBuf kick => dac;
1 => kick.gain;
me.dir(-2) + "/audio/kick_04.wav" => kick.read;

//make a conductor for our tempo
//will be manipulated elsewhere
BPM t;

while(1) {
    //update our tempo each measure
    t.quarterNote => dur quarter;
    //play a measure of quarter note kicks 
    for(0 => int i; i<4; i++)
    {
        0 => kick.pos;
        quarter => now;
    }
}