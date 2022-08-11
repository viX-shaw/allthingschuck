//Trying out the Mandoplayer

MandoPlayer m;

//and declares some data for chords and strumming
["G", "C", "G", "D", "D", "D", "D", "G"] @=> string chords[];
[0.4,0.4,0.4,0.1,0.1,0.1,0.1,0.01] @=> float durs[];
[79,81,83] @=> int strums[];

//counter to iterate thru the arrays
0 => int i;
//roll the basic chords, reading thru the arrays
while(i < chords.cap()) {
    m.roll(chords[i], durs[i]::second);
    i++;
}

//strum a few notes
0 => i;
while(i < strums.cap()) {
    m.strum(strums[i], 1.0 :: second);
    i++;
}

//end up with a big G chord
m.damp(1.0); //No damping
m.roll("G", 0.02::second);
3.0::second => now; // Ring for a long time

//damp it to silence, let it ring a little
m.damp(0.01);
1::second => now;