//sound chain, SinOsc to audio out

/*SinOsc s => dac;

//our recursive factorial function
fun int factorial(int x) {
    <<<"note -", x>>>;
    sonify(x);
    if(x<=1) return 1;
    else return (x*factorial(x-1));
}

// a function to sonify numbers
fun void sonify(int note) {
    //offset above middle C
    Std.mtof(60+(0.5*note)) => s.freq;
    1.0 =>s.gain;
    300 :: ms => now;
    0.0 => s.gain;
    50 :: ms => now;
}

//try it out now
sonify(factorial(2));
second => now;
sonify(factorial(3));
second => now;
sonify(factorial(4));
second => now;
sonify(factorial(5));
second => now;*/



//Recursive drum roll using an Impulse UGen
Impulse imp => dac;

fun int impRoll(int index) {
    if (index >= 20)
    {
        1.0 => imp.next;
        index::ms => now;
        return impRoll(index-1);
    }else {
        return 0;
    }
}

impRoll(100);
second => now;
impRoll(120);
second => now;
impRoll(60);
second => now;
