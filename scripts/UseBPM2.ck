SinOsc s => dac;
BPM t2; //Define t Object of Class BPM
0.3 => s.gain;

800 => int freq;
while(freq>400)
{
    freq => s.freq;
    t2.quarterNote => now;
    50 -=> freq;
}