s.boot;
Server.default.scope;
FreqScope.new;

~sound = {SinOsc.ar(MouseX.kr(400,500),0,0.3)}.play;

//===========//

(
{
    var env = Env.sine(5, 5);
    var envgen = EnvGen.ar(env);
~sound = Saw.ar( 440 ) * envgen * 0.1
}.play
)


//====================//

(
~sound = {
	SinOsc.ar(MouseX.kr(0.1,2) * \freq.kr(440),0,1-MouseY.kr(0,1));
}.play;
)

~sound.set(\freq, 880);

(
{
	100 do: {
		[440,550,660,770] do: {|f|
			~sound.set(\freq, f);
			0.02.wait;
		}
	}
}.fork
)

////////////

(
~mul = 1;
~rate = 0.1;
{
	100 do: {
		[440,550,660,770] * ~mul do: {|f|
			~sound.set(\freq, f);
			~rate.wait;
		}
	}
}.fork
)

~rate = 0.05;
~mul = 0.5;

/////////

(
~mul = 1;
~rate = 0.1;
~mel=[440,550,660,770];
~player = {
	inf do: {
		    ~mel * ~mul do: {|f|
			~sound.set(\freq, f );
			~rate.wait;
		}
	}
}.fork
)

~rate = 0.05;
~mul = 1;
~mel = [1050,1100,1000];

~player.play;
~player.stop;
~player.reset;
//===============//

~sound = { SinOsc.ar(440, 0, 0.5) }.play;
~sound release: 5;

~sound.set(\out, 1);

~sound = { SinOsc.ar(\freq.kr(440), 0, Adsr()).out }.play;

~sound.set(\freq, 1000);

~sound release: 10;

~sound = { SinOsc.ar(\freq.kr(1200), 0, Perc(0.01, 5)).out }.play;

~sound = { SinOsc.ar(\freq.kr(1200), 0, Adsr(0.2,0.5,0.1,1,1,-4,0, doneAction:2)).out }.play;


