//Simple clarinet synthesis
//Envelope applied to SqrOsc

SqrOsc clar => Envelope env => dac;

//initial note freq(musical A)
55.0 => clar.freq;

//play up the overtone series
while(clar.freq() < 441.0)
{
    //trigger envelope
    1 => env.keyOn;
    //hang out a bit
    0.2::second => now;
    
    0 => env.keyOff;
    //hang out some more
    0.2:: second => now;
    //next note up the overtone series
    clar.freq() + 55.0 => clar.freq;
}
