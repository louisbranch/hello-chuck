// Audio Network
SndBuf track1 => dac;
SndBuf track2 => dac;
SinOsc track3 => dac;

.6 => track1.gain;
.4 => track2.gain;
.3 => track3.gain;

me.dir() => string path;

path + "/audio/kick_01.wav" => string kick1;
path + "/audio/kick_02.wav" => string kick2;
path + "/audio/kick_03.wav" => string kick3;
path + "/audio/kick_04.wav" => string kick4;
path + "/audio/kick_05.wav" => string kick5;
path + "/audio/snare_01.wav" => string snare1;
path + "/audio/snare_02.wav" => string snare2;
path + "/audio/snare_03.wav" => string snare3;
path + "/audio/clap_01.wav" => string clap;
path + "/audio/cowbell_01.wav" => string cowbell;
path + "/audio/hihat_01.wav" => string hihat1;
path + "/audio/hihat_02.wav" => string hihat2;
path + "/audio/hihat_03.wav" => string hihat3;


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

1 => int counter;
250::ms => dur beat;

while (true) {

  counter % 8 => int i;
  counter % Midis.cap() => int j;

  if (i==0) {
    kick2 => track1.read;
  } else
  if (i==1) {
    hihat1 => track1.read;
  } else
  if (i==2) {
    kick2 => track1.read;
    clap => track2.read;
  } else
  if (i==3) {
    hihat1 => track1.read;
  } else
  if (i==4) {
    kick2 => track1.read;
  } else
  if (i==5) {
    hihat1 => track1.read;
  } else
  if (i==6) {
    kick2 => track1.read;
    clap => track2.read;
  } else
  if (i==7) {
    hihat1 => track1.read;
  }

  Std.mtof(Midis[j]) => track3.freq;

  beat => now;
  counter++;
}
