// cowbell.ck
// on the fly drumming with global BPM conducting
SndBuf cow => dac;
0.3 => cow.gain;
me.dir(-2)+"/audio/cowbell_01.wav" => cow.read;
// make a conductor for our tempo
// this is set and updated elsewhere
BPM tempo;

while(1)
{
    //update every measure
    tempo.eighthNote => dur eighth;
    //play a measure of eighths
    for(0 => int beat ; beat<8; beat++)
    {
        //but play only on the last beat/8th note
        if (beat==7){
            0 => cow.pos;
        }
        eighth => now;
    }
}