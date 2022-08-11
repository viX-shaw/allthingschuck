// Computer music!! Impulse through resonant filter
Impulse imp => ResonZ filt => dac;
/* Set the Q (Quality) fairly high, to yield a pitch
100.0 => filt.Q;
while (1)
{
 // pick a random frequency
 Math.random2f(500.0,2500.0) => filt.freq;
 // fire our impulse, and hang out a bit
 100.0 => imp.next;
 0.1 :: second => now;
}*/

// pass noise through low pass filter
Noise nz => HPF lp => dac;
// set frequency and Q
500.0 => lp.freq;
100.0 => lp.Q;
0.2 => lp.gain;
second => now;