//global vars
Mandolin mand => dac;
60 => int note;

//funcs
fun void moveNote(int n, string direction)
{
    if(direction == "Up"){
        n +=> note;
        <<<note>>>;
        play();
    }
    else {
        n -=> note;
        <<<note>>>;
        play();
    }
}

//play global note on global mand UG
fun void play()
{
    Std.mtof(note) => mand.freq;
    1 => mand.noteOn;
    0.2::second => now;
}

2 => int incNote;
while(true) {
    moveNote(incNote, "Up");
    moveNote(incNote, "D");
    moveNote(incNote, "Up");
    moveNote(incNote, "Up");
    moveNote(incNote, "D");
}