//DrumMachine, version 1.0
//by block-rocking programmer, Aug 17

//Sndbufs for kick (bass) and snare drums

SndBuf kick => Gain master => NRev r => Dyno safety => dac;
SndBuf snare => dac;

//load up samples of those
me.dir() + "../audio/kick_01.wav" => kick.read;
me.dir() + "../audio/snare_01.wav" => snare.read;

kick.samples() => snare.pos;
while (true)
{
    //Beat 1, play kick drum alone
    0 => kick.pos;
    0.6::second => now;
    
    //play both drums on beat 2
    0 => kick.pos;
    0 => snare.pos;
    0.6::second => now;
}
    