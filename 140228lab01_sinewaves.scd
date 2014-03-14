s.boot;
Server.default.scope;
FreqScope.new;
// One Sine:
{ SinOsc.ar(400, 0, 0.1) }.play;

// Two Sines:
(
{ SinOsc.ar(400, 0, 0.1) }.play;
{ SinOsc.ar(800, 0, 0.1) }.play;
)

// Two Sines added, in one synth:
(
{
  SinOsc.ar(400, 0, 0.1)
  +
  SinOsc.ar(800, 0, 0.1)
}.play;
)

// A shorter way to create 2 sines.
// But these sines are in different channels: Left an Right:
(
{
  SinOsc.ar([400, 800], 0, 0.1)
}.play;
)

// A shorter way to create 2 sines.
// So if we add one more generator, it will not be heard in a stereo setting:
(
{
  SinOsc.ar([400, 800, 600], 0, 0.1)
}.play;
)

// To add all sounds to one channel, we need to mix them
(
{
  Mix.ar(SinOsc.ar([400, 800, 600], 0, 0.1))
}.play;
)

// Lets modulate the frequencies to make a melody;

// 1 Modulate one frequency only
a = { | freq = 400 | SinOsc.ar(freq, 0, 0.1) }.play;

// here is the change (modulation):
a.set(\freq, 600);

// Try modulating to different frequencies chosen from an array
a = { | freq = 400 | SinOsc.ar(freq, 0, 0.1) }.play;

// here is the change (modulation), in a routine:
(
r = {
  loop {
    a.set(\freq, [400, 600, 800, 1000, 1600, 2000].choose);
    0.2.wait;
  }
}.fork;
)

// If we want to modulate all frequencies together, then we need to
// make them depend on each other:
(
a = { | freq = 400 |
  Mix.ar(
    SinOsc.ar([freq, freq * 2], 0, 0.1)
  )
}.play;
)

// here is the change (modulation), in a routine:
(
r = {
  loop {
    a.set(\freq, [400, 600, 800, 1000, 1600, 2000].choose);
    0.2.wait;
  }
}.fork;
)

// We can use another shortcut to create a *harmonic series*
(
a = { | freq = 400 |
  Mix.ar(
    SinOsc.ar(freq * (1..5), 0, 0.02)
  )
}.play;
)

// here is the change (modulation), in a routine:
(
r = {
  loop {
    a.set(\freq, [400, 600, 800, 1000, 1600, 2000].choose);
    0.2.wait;
  }
}.fork;
)