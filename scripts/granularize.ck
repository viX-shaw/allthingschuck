SndBuf2 click => dac;

//read soundfile
me.dir() + "../audio/stereo_fx_01.wav" => click.read;

fun void granularize(SndBuf myWav, int steps) {
    myWav.samples()/steps => int grain;
    Math.random2(0, myWav.samples()-grain)+grain => myWav.pos;
    grain::samp => now;
}

//Main program
while(true) {
    //call func, time passes there
    granularize(click, 80);
    granularize(click, 70);
    granularize(click, 60);
}