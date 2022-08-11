BPM tempo;
tempo.tempo(120.0);

//Add in instruments one at a time, musically
Machine.add(me.dir()+"/kick.ck") => int kickID;
8.0 * tempo.quarterNote => now;
Machine.add(me.dir()+"/snare.ck") => int snareID;
8.0 * tempo.quarterNote => now;
Machine.add(me.dir()+"/hihat.ck") => int hatID;
Machine.add(me.dir()+"/cowbell.ck") => int cowID;
8.0 * tempo.quarterNote => now;
Machine.add(me.dir()+"/clap.ck") => int clapID;
8.0 * tempo.quarterNote => now;

// some fun with tempo
<<< "Set tempo to 80 BPM" >>>;
80.0 => float newtempo;
tempo.tempo(newtempo);
8.0 * tempo.quarterNote => now;

<<<"Set tempo to 160 BPM">>>;
160.0 => newtempo;
tempo.tempo(newtempo);
8.0 * tempo.quarterNote => now;


<<<"Gradually decrease tempo">>>;
while(newtempo > 60.0)
{
    newtempo - 20.0 => newtempo;
    tempo.tempo(newtempo);
    <<<"Tempo, ", newtempo>>>;
    4.0 * tempo.quarterNote => now;
}

//bring out instruments gradually
Machine.remove(kickID);
8.0 * tempo.quarterNote => now;
Machine.remove(snareID);
Machine.remove(hatID);
8.0 * tempo.quarterNote => now;
Machine.remove(cowID);
8.0 * tempo.quarterNote => now;
Machine.remove(clapID);
8.0 * tempo.quarterNote => now;