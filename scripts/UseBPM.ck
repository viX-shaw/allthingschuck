SinOsc s => dac;
BPM t; //Define t Object of Class BPM
t.tempo(300);
0.3 => s.gain;

400 => int freq;
while(freq<800)
{
    freq => s.freq;
    t.quarterNote => now;
    50 +=> freq;
}