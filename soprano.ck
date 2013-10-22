/*
* TETRIS 8-bit music
* using only soprano instrument
*/

SqrOsc s => dac;
0.5 => s.gain;

0 => int tempo;

// Notes
440.00  => float a4;
493.88  => float b4;
523.25  => float c5;
587.33  => float d5;
659.26  => float e5;
698.46  => float f5;
783.99  => float g5;
880.00  => float a5;

// Durations Declarations
dur whole;
dur half;
dur quarter;
dur eighth;
dur sixteenth;

// Music

while (tempo < 200) {


  // Change speed of the music
  // based on the tempo
  if (tempo == 0) {
    1::second => whole;
  } else {
    1::second - tempo::ms => whole;
  }

  // Durations Bindings
  whole/2 => half;
  whole/4 => quarter;
  whole/8 => eighth;
  whole/16 => sixteenth;

  // Bar 1
  e5 => s.freq; quarter => now;
  b4 => s.freq; eighth => now;
  c5 => s.freq; eighth => now;
  d5 => s.freq; eighth => now;
  e5 => s.freq; sixteenth => now;
  d5 => s.freq; sixteenth => now;
  c5 => s.freq; eighth => now;
  b4 => s.freq; eighth => now;

  // Bar 2
  a4 => s.freq; quarter => now;
  a4 => s.freq; eighth => now;
  c5 => s.freq; eighth => now;
  e5 => s.freq; quarter => now;
  d5 => s.freq; eighth => now;
  c5 => s.freq; eighth => now;

  // Bar 3
  b4 => s.freq; quarter => now;
  c5 => s.freq; eighth => now;
  d5 => s.freq; quarter => now;
  e5 => s.freq; quarter => now;

  // Bar 4
  c5 => s.freq; quarter => now;
  a4 => s.freq; quarter => now;
  a4 => s.freq; half => now;

  // Bar 5
  eighth => now; // Rest
  d5 => s.freq; quarter => now;
  f5 => s.freq; eighth => now;
  a5 => s.freq; quarter => now;
  g5 => s.freq; eighth => now;
  f5 => s.freq; eighth => now;

  // Bar 6
  e5 => s.freq; quarter => now;
  c5 => s.freq; eighth => now;
  e5 => s.freq; quarter => now;
  d5 => s.freq; eighth => now;
  c5 => s.freq; eighth => now;

  // Bar 7
  b4 => s.freq; quarter => now;
  b4 => s.freq; eighth => now;
  c5 => s.freq; eighth => now;
  d5 => s.freq; quarter => now;
  e5 => s.freq; quarter => now;

  // Bar 8
  c5 => s.freq; quarter => now;
  a4 => s.freq; quarter => now;
  a4 => s.freq; quarter => now;
  quarter => now; // Rest

  tempo + 50 => tempo;
}
