//DrumMachine, version 2.0
//by block-rocking programmer, Aug 17

//Sndbufs for kick (bass) and snare drums

SndBuf kick => Gain master => dac;
SndBuf snare => master;

//load up samples of those
me.dir() + "../audio/kick_01.wav" => kick.read;
me.dir() + "../audio/snare_01.wav" => snare.read;
//declare a new tempo variable
0.15::second => dur tempo;
//Since the pos after load is 0, all sounds play so it to samples when
//u don't want it to play.
kick.samples() => snare.pos;

while(true)
{
    for(0 => int beat; beat < 16; beat++)
    {
        //play kick drum on 0, 4, 8, 12
        if(beat==0 || beat==4 || beat==8 || beat==12)
        {
            0=>kick.pos;
        }
        if(beat==4 || beat==10 || beat==13 || beat==14)
        {
            0=>snare.pos;
        }
        tempo=>now;
    }
}

    