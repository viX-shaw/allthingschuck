//Fun with UGens!
//Impulse excited resonant filater drives
// three delay lines, fed back to themselves

//LENGTH OF DELAY LINES MAKES ALL THE DIFFERENCE, try to study it!


Impulse imp => ResonZ rez => Gain input => dac;
100 => rez.Q;
100 => rez.gain;
1.0 => input.gain;

//We can make arrays of UGens, too
Delay del[3];

//Lets have some stereo
input => del[0] => dac.left;
input => del[2] => dac;
input => del[2] => dac.right;

//Set up all the delay lines
for (0 => int i; i<3; i++) {
    del[i] => del[i];
    0.6 => del[i].gain;
    (0.8 + i*0.3)::second => del[i].max => del[i].delay;
}

//Define note array for our song
[60, 64, 65, 67, 70, 72]@=> int notes[];
notes.cap() - 1 => int numNotes;

//Let the fun begin and continue on forever
while(1) {
    Std.mtof(notes[Math.random2(0, numNotes)]) => rez.freq;
    1.0 => imp.next;
    0.4::second => now;
}