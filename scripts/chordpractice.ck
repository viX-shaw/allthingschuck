 fun float pitch(string noteName)
 {
    //Notes in the first octave
     [21,23,12,14,16,17,19] @=> int notes[];
     noteName.charAt(0) - 65 => int base;
     notes[base] => int note;
     
     if (base>=0 && base<=6)
     {
        if(noteName.charAt(1) == '#'){
            notes[base] + 1 => note;
        }
        if(noteName.charAt(1) == 's'){
            notes[base] + 1 => note;
        }
        if(noteName.charAt(1) == 'f'){
            notes[base] - 1 => note;
        }
        if(noteName.charAt(1) == 'b'){
            notes[base] - 1 => note;
        }
     }
     else
     {
        <<< "Illegal Note Name!!" >>>;
     }
     
     noteName.charAt(noteName.length()-1)-48 => int oct;
     if (oct>-1 && oct<10) {
        note + 12*oct => note;
        return Std.mtof(note);
     }
     else
     {
        <<< "Illegal Octave!!" >>>;
     }
 }
 
Rhodey chord[3];
Pan2 p[3];
Chorus c[2] => NRev rev[2] => dac;
p[0] => rev[0]; p[1] => rev[1];
Delay d[2]; rev[0] => d[0] => d[1] => rev[1]; 
0.7 => d[0].gain => d[1].gain;
second/2 => d[0].max => d[0].delay => d[1].max => d[1].delay;
chord[0] => p[0]; chord[1] => p[1];
chord[2] => p[0] => p[1];
// turn volume down a bit
0.33 => rev[0].gain => rev[1].gain;
0.07 => c[0].mix;
0.07 => c[1].mix;
0.04 => rev[0].mix;
0.04 => rev[1].mix;

/*for (int i; i < 3; i++) {
    chord[i] => p[i] => c;
    -0.4 + 0.2*i => p[i].pan;
    Math.random2f(6.95,7.05) => chord[i].lfoSpeed;
    0.04 => chord[i].lfoDepth;
}*/

SinOsc panner => blackhole;
1 => panner.freq;
spork ~ doPan();

fun void doPan() {
    while( true ) {
        1.0 - panner.last() => float temp;
        temp => p[0].pan;
        1.0 - temp => p[1].pan;
        ms => now;
    }
}



fun void playChord(string note1,string note2, string note3,dur howLong) {
    pitch(note1) => chord[0].freq;
    pitch(note2) => chord[1].freq;
    pitch(note3) => chord[2].freq;
    
    1=> chord[2].noteOn;Math.random2f(0.01,0.08)::second => now;
    1=> chord[0].noteOn;Math.random2f(0.01,0.08)::second => now;
    1=> chord[1].noteOn;Math.random2f(0.01,0.08)::second => now;
    howLong => now;
}

////Popular chord progressions
// C Major Chord
playChord("C3", "E3", "G3", 1*second);
playChord("A3", "C4", "E4", 1*second);
playChord("F3", "A3", "C3", 1*second);
playChord("G3", "B4", "D4", 1*second);

playChord("C3", "E3", "G3", 1*second);
playChord("E3", "G3", "B4", 1*second);
playChord("F3", "A3", "C4", 1*second);
playChord("G3", "B4", "D4", 1*second);


playChord("C3", "E3", "G3", 1*second);
playChord("F3", "A3", "C4", 1*second);
playChord("D3", "F3", "A3", 1*second);
playChord("G3", "B4", "D4", 1*second);

