//Sound Network
Mandolin chord[3];

for(0=> int i; i < chord.cap(); i++)
{
    //connect each element of our array to dac
    chord[i] => dac;
    //adjust gain so we don't overload
    1.0/chord.cap() => chord[i].gain;
}

fun void playChord(int root, string quality, dur howLong)
{
    //set root of chord
    Std.mtof(root) => chord[0].freq;
    
    //ser fifth of chord
    Std.mtof(root+7) => chord[2].freq;
    
    //third sets quality, major or minor
    if (quality == "major") {
        Std.mtof(root+4) => chord[1].freq;
    }else if (quality == "minor") {
        Std.mtof(root+3) => chord[1].freq;
    }else {
        <<<"You must specify major or minor!!">>>;
    }
    1=> chord[2].noteOn;
    1=> chord[0].noteOn;
    1=> chord[1].noteOn;
    howLong => now;
}

//Main program: now let's use playChord!!
while(true) {
    playChord(Std.rand2(70, 82), "minor", second/2);
    playChord(60, "minor", second/2);
    playChord(67, "major", second/2);
}