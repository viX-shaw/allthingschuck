//SOund chain, mandolin to audio out
Mandolin mand => dac;

//<<<1::second/44000>>>;
//recursice scale player
fun int recurScale(int note, dur rate) {
    Std.mtof(note) => mand.freq;
    1 => mand.noteOn;
    rate => now;
    <<<note, rate/44000>>>;
    //only do it until some limit is reached
    if (note > 40)
    {
        //here's the recursion, it calls itself
        recurScale(note-1, 0.9*rate);
    }else {
        Math.random2(1, 2) => int r;
        recurScale(note*r, 2*rate+1::second);
    }
}

//now play a couple of scales
//recurScale(60, 0.5::second);
recurScale(67, 1.0::second);