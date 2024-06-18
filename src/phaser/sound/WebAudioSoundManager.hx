package phaser.sound;

/**
	Web Audio API implementation of the Sound Manager.
	
	Not all browsers can play all audio formats.
	
	There is a good guide to what's supported: [Cross-browser audio basics: Audio codec support](https://developer.mozilla.org/en-US/Apps/Fundamentals/Audio_and_video_delivery/Cross-browser_audio_basics#Audio_Codec_Support).
**/
@:native("Phaser.Sound.WebAudioSoundManager") extern class WebAudioSoundManager extends BaseSoundManager {
	function new(game:phaser.Game);
	/**
		The AudioContext being used for playback.
	**/
	var context : js.html.audio.AudioContext;
	/**
		Gain node responsible for controlling global muting.
	**/
	var masterMuteNode : js.html.audio.GainNode;
	/**
		Gain node responsible for controlling global volume.
	**/
	var masterVolumeNode : js.html.audio.GainNode;
	/**
		Destination node for connecting individual sounds to.
	**/
	var destination : js.html.audio.AudioNode;
	/**
		Method responsible for instantiating and returning AudioContext instance.
		If an instance of an AudioContext class was provided through the game config,
		that instance will be returned instead. This can come in handy if you are reloading
		a Phaser game on a page that never properly refreshes (such as in an SPA project)
		and you want to reuse already instantiated AudioContext.
	**/
	function createAudioContext(game:phaser.Game):js.html.audio.AudioContext;
	/**
		This method takes a new AudioContext reference and then sets
		this Sound Manager to use that context for all playback.
		
		As part of this call it also disconnects the master mute and volume
		nodes and then re-creates them on the new given context.
	**/
	function setAudioContext(context:js.html.audio.AudioContext):WebAudioSoundManager;
	/**
		Adds a new sound into the sound manager.
	**/
	function add(key:String, ?config:phaser.types.sound.SoundConfig):WebAudioSound;
	/**
		Decode audio data into a format ready for playback via Web Audio.
		
		The audio data can be a base64 encoded string, an audio media-type data uri, or an ArrayBuffer instance.
		
		The `audioKey` is the key that will be used to save the decoded audio to the audio cache.
		
		Instead of passing a single entry you can instead pass an array of `Phaser.Types.Sound.DecodeAudioConfig`
		objects as the first and only argument.
		
		Decoding is an async process, so be sure to listen for the events to know when decoding has completed.
		
		Once the audio has decoded it can be added to the Sound Manager or played via its key.
	**/
	function decodeAudio(?audioKey:ts.AnyOf2<String, Array<phaser.types.sound.DecodeAudioConfig>>, ?audioData:ts.AnyOf2<String, js.lib.ArrayBuffer>):Void;
	/**
		Sets the muted state of all this Sound Manager.
	**/
	function setMute(value:Bool):WebAudioSoundManager;
	/**
		Sets the volume of this Sound Manager.
	**/
	function setVolume(value:Float):WebAudioSoundManager;
	/**
		Sets the global playback rate at which all the sounds will be played.
		
		For example, a value of 1.0 plays the audio at full speed, 0.5 plays the audio at half speed
		and 2.0 doubles the audios playback speed.
	**/
	function setRate(value:Float):WebAudioSoundManager;
	/**
		Sets the global detuning of all sounds in [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).
		The range of the value is -1200 to 1200, but we recommend setting it to [50](https://en.wikipedia.org/wiki/50_Cent).
	**/
	function setDetune(value:Float):WebAudioSoundManager;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebAudioSoundManager;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebAudioSoundManager;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebAudioSoundManager;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):WebAudioSoundManager;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):WebAudioSoundManager;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):WebAudioSoundManager;
	static var prototype : WebAudioSoundManager;
}