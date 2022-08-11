// hihat.ck
// on the fly drumming with global BPM conducting
SndBuf hat => dac;
0.3 => hat.gain;
me.dir(-2)+"/audio/hihat_02.wav" => hat.read;

// make a conductor for our tempo
// this is set and updated elsewhere
BPM tempo;

while(1)
{
    tempo.eighthNote => dur eighth;
    
    //play a measure of eighths but leave out the last
    for(0 => int beat; beat<8; beat++)
    {
        if (beat!=7)
            0 => hat.pos;
        
        eighth => now;
    }
}