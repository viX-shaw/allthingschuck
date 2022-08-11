public class BPM
{
    static dur quarterNote, eighthNote, sixteenthNote, thirtysecondNote;
    
    fun void tempo(float beat) {
        //beat arg is BPM, e.g. 120 beats per min.
        60.0/(beat) => float SPB;
        SPB :: second => quarterNote;
        quarterNote*0.5 => eighthNote;
        eighthNote*0.5 => sixteenthNote;
        sixteenthNote*0.5 => thirtysecondNote;
    }
}