//Loading and panning sound stereo files

SndBuf2 myStereoSound;
me.dir()+"../audio/stereo_fx_03.wav" => myStereoSound.read;

//Using two Gain UGens for controlling it on each channel separately.
Gain bal[2];
//connect everything up in stereo
myStereoSound.chan(0) => bal[0] => dac.left;
myStereoSound.chan(1) => bal[1] => dac.right;
//set our soundfile to repeat forever
//1 => myStereoSound.loop;

while(true)
{
    //pick a random playback rate and random panning
    Math.random2f(0.2, 1.8) => myStereoSound.rate;
    Math.random2f(-1.0, 1.0) => float balance;
    
    (balance+1)/2.0 => float rightGain;
    1.0 - rightGain => float leftGain;
    0.5 => bal[0].gain;
    0.5 => bal[1].gain;
    1::second => now;
}











/* Playing multiple sounds
// by ChucK Programmer July, 2023
SndBuf snare => dac;
// make and fill an array of sound file paths+names
string snare_samples[3];
me.dir()+"../audio/snare_01.wav" => snare_samples[0];
me.dir()+"../audio/snare_02.wav" => snare_samples[1];
me.dir()+"../audio/snare_03.wav" => snare_samples[2];
// infinite loop
while (true)
{
 // pick a random number between 0 and #files
 Math.random2(0,snare_samples.cap()-1) => int which;
 // load up that file
 snare_samples[which] => snare.read;
 // let it play
 0.5 :: second => now;
}*/

/* Playing multiple sound files (method 2)
// by ChucK Programmer, August, 2023
SndBuf snare[3];
// for fun, let's pan them to left, right, center
snare[0] => dac.left;
snare[1] => dac;
snare[2] => dac.right;
// pre-load all sound files at the beginning
me.dir()+"../audio/snare_01.wav" => snare[0].read;
me.dir()+"../audio/snare_02.wav" => snare[1].read;
me.dir()+"../audio/snare_03.wav" => snare[2].read;
// infinite loop
while (true)
{
 // pick a random number between 0 and #files
 Math.random2(0,snare.cap()-1) => int which;
 // play that sample
 0 => snare[which].pos;
 // let it play
 0.5 :: second => now;
}*/

/* Loading and playing stereo sound files
// by ChucK Programmer, September, 2023
SndBuf2 myStereoSound => dac;
// load up a stereo file
me.dir()+"../audio/stereo_fx_01.wav" => myStereoSound.read;
// and let it play for the right amount of time
myStereoSound.length() => now;
*/











