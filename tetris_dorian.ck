// Music Composition using D Dorian Scale
// Tetris Song

// Audio Network with Panning
SqrOsc s => Pan2 p => dac;
SinOsc t => dac;

0.3 => s.gain;
0.2 => t.gain;

[
  57,52,53,55,57,55,53,52,
  50,50,53,57,55,53,
  52,53,55,57,
  53,50,50,
  0,55,59,62,60,59,
  57,53,57,55,53,
  52,52,53,55,57,
  53,50,50,0
] @=> int Midis[];

[
  .5, .25, .25, .25, .125, .125, .25, .25,
  .5, .25, .25, .5, .25, .25,
  .5, .25, .5, .5,
  .5, .5, 1.0,
  .25, .5, .25, .5, .25, .25,
  .5, .25, .5, .25, .25,
  .5, .25, .25, .5, .5,
  .5, .5, .5, .5
] @=> float Durations[];

1 => int j;

while(j < 3) // Play twice, second time faster
{
  for(0 => int i; i < Midis.cap(); i++) {

    Std.mtof(Midis[i]) => s.freq;

    if (i % j == 0) {
      Std.mtof(Midis[i] * 2) => t.freq;
    } else {
      Std.mtof(Midis[i] / 2) => t.freq;
    }

    Math.random2f(-1.0,1.0) => p.pan; // Set paning for s device

    (Durations[i] / j)::second => now;
  }

  j++;
}
