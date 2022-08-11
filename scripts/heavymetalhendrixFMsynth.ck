// a brief FM electric guitar tribute
HevyMetl jimi => NRev r => Dyno safety => dac;
jimi => Delay d => d => r;
0.3 => d.gain;
1.2::second => d.max => d.delay;
//sets us up for whammy bar bend later
0.5 => jimi.lfoSpeed;

[[70.0,0.8,0.0],[67.0,0.4,0.0],[63.0,1.2,0.0],
 [67.0,1.2,0.0],[70.0,1.2,0.0],[75.0,2.4,0.2],
 [79.0,0.8,0.0],[77.0,0.4,0.0],[75.0,1.2,0.0],
 [67.0,1.2,0.1],[69.0,1.2,0.2]] @=> float banner[][];
 
 //play through our data table first
0 => int i;
while(i < banner.cap()) {
    banner[i][2] => jimi.lfoDepth;
    pick(banner[i][0], banner[i][1]);
    1 +=> i;
}

//play last note longer, then
Std.mtof(82) => jimi.freq;
1 => jimi.noteOn;
2.0 :: second => now;

//go nuts and sweep frequency downward
while(jimi.freq() > 100) {
    0.98 * jimi.freq() => jimi.freq;
    0.01::second => now;
}

1 => jimi.noteOff;
0.5 :: second => now;

while(jimi.freq() < 220) {
    1.02 * jimi.freq() => jimi.freq;
    0.01::second => now;
}

while(jimi.freq() > 100) {
    0.98 * jimi.freq() => jimi.freq;
    0.01::second => now;
}



1.0 :: second => now;
1 => jimi.noteOff;
2.0 :: second => now;

//function to play a note for a duration
fun void pick(float note, float howLong) {
    Std.mtof(note) => jimi.freq;
    1 => jimi.noteOn;
    (howLong - 0.1)::second => now;
    1 => jimi.noteOff;
    0.1::second => now;
}
