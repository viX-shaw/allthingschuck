//drums.ck

// sound chain
SndBuf hihat => dac;

me.dir(-2) + "/audio/hihat_01.wav" => hihat.read;

//param setup
.5 => hihat.gain;

while(true) {
    Math.random2f(.1, .3) => hihat.gain;
    Math.random2f(.9, 1.2) => hihat.rate;
    (Math.random2(1,2) * 0.2) :: second => now;
    0 => hihat.pos;
}