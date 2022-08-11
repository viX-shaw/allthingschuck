// Simple example of a resonant pop sound-making class
public class Simple {
 // our Simple instrument patch
 Impulse imp => ResonZ filt => dac;
 Impulse imp1 => ResonZ filt1 => NRev v => NRev k => dac;
 // some default settings
 100.0 => filt.Q => filt.gain;
 1000.0 => filt.freq => filt1.freq;
    
 50.0 => filt1.Q => filt1.gain;

 // method to allow setting Q
 fun void setQ(float Q)
 {
 Q => filt.Q;
 Q/2 => filt1.Q;
 }
 // method to allow setting gain
 fun void setGain(float gain)
 {
 filt.Q() * gain => imp.gain;
 imp.gain() / 2 => imp1.gain;
 }
 // play a note by firing impulse
 fun void noteOn(float volume)
 {
 volume => imp.next => imp1.next;
 }
 
  // set freq as we would any instrument
 fun void pitch(float freq)
 {
 freq => filt.freq => filt1.freq;
 }
 
 fun void pitch(int noteNum)
 {
    Std.mtof(noteNum) => filt.freq => filt1.freq;
 }
 
 fun void pitch(string noteName)
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
        return this.pitch(note);
     }
     else
     {
        <<< "Illegal Octave!!" >>>;
     }
 }
}
// Make an instance of (declare) one of our Simples
Simple s;
while (1) {
    // MIDI note number pitch
s.pitch(60);
1 => s.noteOn;
second => now;
// pitch as float frequency
s.pitch(440.0);
1 => s.noteOn;
second => now;
// pitch as note name string
s.pitch("G#3");
1 => s.noteOn;
second => now;
    
}