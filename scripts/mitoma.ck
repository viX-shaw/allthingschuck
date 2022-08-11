//make a mandolin and hook it to audio out
Mandolin mand => dac;

//global scale array
[60, 62, 63,65,67,69,70,72] @=> int scale[];

//func to modify an element of array
fun void arrayAdder(int temp[], int index) {
    1 +=> temp[index];
}

//play scale on Mandolin
fun void playScale(int temp[]) {
    for(0 => int i; i < temp.cap(); i++) {
        Std.mtof(temp[i]) => mand.freq;
        <<<i, temp[i]>>>;
        1 => mand.noteOn;
        0.4::second => now;
    }
    second => now;
}

// play our scale on our mandolin
<<< "Original Scale" >>>;
playScale(scale);
// modify our scale
arrayAdder(scale,2);
arrayAdder(scale,6);
// play scale again, sounds different, huh?
<<< "Modified Scale:" >>>;
playScale(scale);
