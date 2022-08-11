//FM Unit Generator Instrument Test Program
//by Fm dude

//make an FM instrument and connect it to dac
FMVoices instr => dac;

//play it forever woth random freq and duration

while(true)
{
    Math.random2f(100.0, 300.0) => instr.freq;
    
    //turn note on (trigger internal ADSR)
    1 => instr.noteOn;
    Math.random2f(0.2, 0.5) :: second => now;
    
    //turn off (ramp down intrnal ADSR)
    1 => instr.noteOff;
    Math.random2f(0.05, 0.1)::second => now;
}