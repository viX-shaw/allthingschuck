//A Smart Mandolin Player with four strings
// added tremolo and chords support

public class MandoPlayer {
    //Make an array of four mandolin strings
    Mandolin m[4];
    m[0] => JCRev rev => Dyno d => dac;
    m[1] => rev;
    m[2] => rev;
    m[3] => rev;
    0.25 => rev.gain;
    0.02 => rev.mix;
    
    //set all four string freqs
    fun void freqs(float gStr, float dStr, float aStr, float eStr) {
        gStr => m[0].freq;
        dStr => m[1].freq;
        aStr => m[2].freq;
        eStr => m[3].freq;
    }
    
    fun void notes(int gNote, int dNote, int aNote, int eNote)
    {
        Std.mtof(gNote) => m[0].freq;
        Std.mtof(dNote) => m[1].freq;
        Std.mtof(aNote) => m[2].freq;
        Std.mtof(eNote) => m[3].freq;
    }
    
    fun void chord(string which) {
        if (which == "G") this.notes(55,62,71,79); //G3,D4,B4,G5
        else if (which == "C") this.notes(55,64,72,79);//G3,E4,B4#,G5
        else if (which == "D") this.notes(57,62,69,78); //A3,D4,A4,F5#
        else <<<"I don't know this chord, ", which>>>;
    }
    
    //roll a chord from lowest to highest at rate
    fun void roll(string chord, dur rate) {
        this.chord(chord);
        for (0=>int i; i<4; i++) {
            1 => m[i].noteOn;
            rate => now;
        }
    }
    
    //archetypical tremolo strumming
    fun void strum(int note, dur howLong)
    {
        int whichString;
        if (note<62) 0 => whichString;
        else if (note<69) 1 => whichString;
        else if (note<76) 2 => whichString;
        else 3 => whichString;
        
        Std.mtof(note) => m[whichString].freq;
        now + howLong => time stop;
        while (now < stop) {
            Std.rand2f(0.5,1.0) => m[whichString].noteOn;
            Std.rand2f(.06,.09) :: second => now;
        }
    }
    
    //damp all strings by an amt
    // 0.0 lots of damping , 1.0 none
    fun void damp(float amount) {
        for (0=>int i; i<4; i++) {
            amount => m[i].stringDamping;
        }
    }
    //END of MandoPlayer class definition
}