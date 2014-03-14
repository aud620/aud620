s.boot;
Server.default.scope;
FreqScope.new;

{PMOsc.ar(1000, 1367, 12, mul: EnvGen.kr(Env.perc(0, 0.5), Impulse.kr(1)))}.play;

(
{
Mix.ar(
 SinOsc.ar(abs((-20..20)*1367 + 1000),
 mul: 0.1*EnvGen.kr(Env.perc(0, 0.5), Impulse.kr(1)))
)}.play;
)

// 16.7. Carrier and modulator ratio

(
{var freq, ratio;
freq = LFNoise0.kr(4, 20, 60).round(1).midicps;
ratio = 2/1;
PMOsc.ar(
 freq, //carrier
 freq*ratio, //modulator
 MouseY.kr(0.1, 10), //index
 Mul: [0.4, 0.4]
)}.play
)

// 16.8. Envelope applied to amplitude and modulation index

(
{var freq, ratio, env, rate = 5, trig;
trig = Impulse.kr(5);
freq = TRand.kr([36, 60], [72, 86], trig).midicps;
ratio = 2;
env = EnvGen.kr(Env.perc(0, 1/rate), gate: trig);
PMOsc.ar(
 freq,
 freq*ratio,
 3 + env*4,
 mul: env
)}.play
)