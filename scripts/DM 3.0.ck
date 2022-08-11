// Drum Machine, version 3.0
// by block-rockin programmer, Dec 31, 1999
// SndBufs for kick (bass) and snare drums
SndBuf kick => Gain master => dac;
SndBuf snare => master;
SndBuf hihat => master;
// load up some samples of those
me.dir()+"../audio/kick_01.wav" => kick.read;
me.dir()+"../audio/snare_01.wav" => snare.read;
me.dir()+"../audio/hihat_01.wav" => hihat.read;

0.3 => hihat.gain;
0.15 :: second => dur tempo;
// scores (arrays) to tell drums when to play
[1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0] @=> int kickHits[];
[0,0,1,0,0,0,1,0,0,0,0,0,1,1,1,1] @=> int snareHits[];
while (true)
{
 0 => int beat;
 while (beat < kickHits.cap())
 {
 // play kick drum based on array value
 if (kickHits[beat])
 {
 0 => kick.pos;
 0 => hihat.pos;
 }
 if (snareHits[beat])
 {
 0 => snare.pos;
 }
 // always play hihat
 0 => hihat.pos;
 tempo => now;
 beat++;
 }
}