package phaser.sound;

/**
	No audio implementation of the sound. It is used if audio has been
	disabled in the game config or the device doesn't support any audio.
	
	It represents a graceful degradation of sound logic that provides
	minimal functionality and prevents Phaser projects that use audio from
	breaking on devices that don't support any audio playback technologies.
**/
@:native("Phaser.Sound.NoAudioSound") extern class NoAudioSound extends phaser.events.EventEmitter {
	function new(manager:NoAudioSoundManager, key:String, ?config:phaser.types.sound.SoundConfig);
	/**
		Local reference to the sound manager.
	**/
	var manager : BaseSoundManager;
	/**
		Asset key for the sound.
	**/
	final key : String;
	/**
		Flag indicating if sound is currently playing.
	**/
	final isPlaying : Bool;
	/**
		Flag indicating if sound is currently paused.
	**/
	final isPaused : Bool;
	/**
		A property that holds the value of sound's actual playback rate,
		after its rate and detune values has been combined with global
		rate and detune values.
	**/
	final totalRate : Float;
	/**
		A value representing the duration, in seconds.
		It could be total sound duration or a marker duration.
	**/
	final duration : Float;
	/**
		The total duration of the sound in seconds.
	**/
	final totalDuration : Float;
	/**
		A config object used to store default sound settings' values.
		Default values will be set by properties' setters.
	**/
	var config : phaser.types.sound.SoundConfig;
	/**
		Reference to the currently used config.
		It could be default config or marker config.
	**/
	var currentConfig : phaser.types.sound.SoundConfig;
	/**
		Boolean indicating whether the sound is muted or not.
		Gets or sets the muted state of this sound.
	**/
	var mute : Bool;
	/**
		Gets or sets the volume of this sound, a value between 0 (silence) and 1 (full volume).
	**/
	var volume : Float;
	/**
		Rate at which this Sound will be played.
		Value of 1.0 plays the audio at full speed, 0.5 plays the audio at half speed
		and 2.0 doubles the audios playback speed.
	**/
	var rate : Float;
	/**
		The detune value of this Sound, given in [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).
		The range of the value is -1200 to 1200, but we recommend setting it to [50](https://en.wikipedia.org/wiki/50_Cent).
	**/
	var detune : Float;
	/**
		Property representing the position of playback for this sound, in seconds.
		Setting it to a specific value moves current playback to that position.
		The value given is clamped to the range 0 to current marker duration.
		Setting seek of a stopped sound has no effect.
	**/
	var seek : Float;
	/**
		Flag indicating whether or not the sound or current sound marker will loop.
	**/
	var loop : Bool;
	/**
		Gets or sets the pan of this sound, a value between -1 (full left pan) and 1 (full right pan).
		
		Always returns zero on iOS / Safari as it doesn't support the stereo panner node.
	**/
	var pan : Float;
	/**
		Object containing markers definitions.
	**/
	final markers : haxe.DynamicAccess<phaser.types.sound.SoundMarker>;
	/**
		Currently playing marker.
		'null' if whole sound is playing.
	**/
	final currentMarker : phaser.types.sound.SoundMarker;
	/**
		Flag indicating if destroy method was called on this sound.
	**/
	var pendingRemove : Bool;
	function addMarker(marker:phaser.types.sound.SoundMarker):Bool;
	function updateMarker(marker:phaser.types.sound.SoundMarker):Bool;
	function removeMarker(markerName:String):Dynamic;
	function play(?markerName:ts.AnyOf2<String, phaser.types.sound.SoundConfig>, ?config:phaser.types.sound.SoundConfig):Bool;
	function pause():Bool;
	/**
		Resumes the sound.
	**/
	function resume():Bool;
	/**
		Stop playing this sound.
	**/
	function stop():Bool;
	/**
		Sets the muted state of this Sound.
	**/
	function setMute(value:Bool):NoAudioSound;
	/**
		Sets the volume of this Sound.
	**/
	function setVolume(value:Float):NoAudioSound;
	/**
		Sets the playback rate of this Sound.
		
		For example, a value of 1.0 plays the audio at full speed, 0.5 plays the audio at half speed
		and 2.0 doubles the audios playback speed.
	**/
	function setRate(value:Float):NoAudioSound;
	/**
		Sets the detune value of this Sound, given in [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).
		The range of the value is -1200 to 1200, but we recommend setting it to [50](https://en.wikipedia.org/wiki/50_Cent).
	**/
	function setDetune(value:Float):NoAudioSound;
	/**
		Seeks to a specific point in this sound.
	**/
	function setSeek(value:Float):NoAudioSound;
	/**
		Sets the loop state of this Sound.
	**/
	function setLoop(value:Bool):NoAudioSound;
	/**
		Sets the pan of this sound, a value between -1 (full left pan) and 1 (full right pan).
		
		Note: iOS / Safari doesn't support the stereo panner node.
	**/
	function setPan(value:Float):NoAudioSound;
	/**
		Method used internally for applying config values to some of the sound properties.
	**/
	function applyConfig():Void;
	/**
		Method used internally for resetting values of some of the config properties.
	**/
	function resetConfig():Void;
	/**
		Update method called automatically by sound manager on every game step.
	**/
	function update(time:Float, delta:Float):Void;
	/**
		Method used internally to calculate total playback rate of the sound.
	**/
	function calculateRate():Void;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):NoAudioSound;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):NoAudioSound;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):NoAudioSound;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):NoAudioSound;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):NoAudioSound;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):NoAudioSound;
	static var prototype : NoAudioSound;
}