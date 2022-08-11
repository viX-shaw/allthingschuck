//sound chain : two drums
SndBuf kick => dac;
SndBuf snare => dac;
SndBuf clap => dac;
SndBuf hihat => dac;

//load the sound files for the drums
me.dir() + "../audio/kick_01.wav" => kick.read;
me.dir() + "../audio/snare_03.wav" => snare.read;
me.dir() + "../audio/hihat_01.wav" => hihat.read;
me.dir() + "../audio/clap_01.wav" => clap.read;

//set their pointers to end. so they dont play in the beginnning
kick.samples() => kick.pos;
snare.samples() => snare.pos;
clap.samples() => clap.pos;
hihat.samples() => hihat.pos;

// drum patterns as logical variables
[1,0,0,0,1,0,0,0] @=> int kickPattern1[];
[0,0,1,0,0,0,1,0] @=> int kickPattern2[];
[1,0,1,0,1,0,1,0] @=> int snarePattern1[];
[1,1,1,1,0,1,1,1] @=> int snarePattern2[];
[0,0,0,0,0,0,0,0] @=> int clapPattern[];
[0,0,0,0,0,0,0,0] @=> int hihatPattern[];
//[0,0,1,1,0,1,1,0] @=> int clapPattern[];
//[1,0,0,1,0,0,1,0] @=> int hihatPattern[];


//func to play pattern arrays
fun void playSection(int kickA[], int snareA[], int clapA[], int hihatA[], float beattime) {
    for(0 => int i; i < kickA.cap(); i++) {
        if(kickA[i]) {
            0 => kick.pos;
        }
        if (snareA[i]) {
            0 => snare.pos;
        }
        if (clapA[i]) {
            0 => clap.pos;
        }
        if (hihatA[i]) {
            0 => hihat.pos;
        }
        beattime::second => now;
    }
}

while(true) {
    playSection(kickPattern1, snarePattern2, clapPattern, hihatPattern, 0.2);
    playSection(kickPattern2, snarePattern2, clapPattern, hihatPattern, 0.2);
    playSection(kickPattern1, snarePattern2, clapPattern, hihatPattern, 0.2);
    playSection(kickPattern2, snarePattern1, clapPattern, hihatPattern, 0.2);
}


