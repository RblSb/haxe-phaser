package phaser.sound;

/**
	Web Audio API implementation of the sound.
**/
@:native("Phaser.Sound.WebAudioSound") extern class WebAudioSound extends BaseSound {
	function new(manager:WebAudioSoundManager, key:String, ?config:phaser.types.sound.SoundConfig);
	/**
		Audio buffer containing decoded data of the audio asset to be played.
	**/
	var audioBuffer : js.html.audio.AudioBuffer;
	/**
		A reference to an audio source node used for playing back audio from
		audio data stored in Phaser.Sound.WebAudioSound#audioBuffer.
	**/
	var source : js.html.audio.AudioBufferSourceNode;
	/**
		A reference to a second audio source used for gapless looped playback.
	**/
	var loopSource : js.html.audio.AudioBufferSourceNode;
	/**
		Gain node responsible for controlling this sound's muting.
	**/
	var muteNode : js.html.audio.GainNode;
	/**
		Gain node responsible for controlling this sound's volume.
	**/
	var volumeNode : js.html.audio.GainNode;
	/**
		Panner node responsible for controlling this sound's pan.
		
		Doesn't work on iOS / Safari.
	**/
	var pannerNode : js.html.audio.StereoPannerNode;
	/**
		The Stereo Spatial Panner node.
	**/
	var spatialNode : js.html.audio.PannerNode;
	/**
		If the Spatial Panner node has been set to track a vector or
		Game Object, this retains a reference to it.
	**/
	var spatialSource : phaser.types.math.Vector2Like;
	/**
		The time at which the sound should have started playback from the beginning.
		
		Treat this property as read-only.
		
		Based on `BaseAudioContext.currentTime` value.
	**/
	var playTime : Float;
	/**
		The time at which the sound source should have actually started playback.
		
		Treat this property as read-only.
		
		Based on `BaseAudioContext.currentTime` value.
	**/
	var startTime : Float;
	/**
		The time at which the sound loop source should actually start playback.
		
		Based on `BaseAudioContext.currentTime` value.
	**/
	var loopTime : Float;
	/**
		An array where we keep track of all rate updates during playback.
		
		Treat this property as read-only.
		
		Array of object types: `{ time: number, rate: number }`
	**/
	var rateUpdates : Array<Dynamic>;
	/**
		Used for keeping track when sound source playback has ended
		so its state can be updated accordingly.
	**/
	final hasEnded : Bool;
	/**
		Used for keeping track when sound source has looped
		so its state can be updated accordingly.
	**/
	final hasLooped : Bool;
	/**
		This method is only used internally and it creates a looping buffer source.
	**/
	function createAndStartLoopBufferSource():Void;
	/**
		This method is only used internally and it creates a buffer source.
	**/
	function createBufferSource():js.html.audio.AudioBufferSourceNode;
	/**
		This method is only used internally and it stops and removes a buffer source.
	**/
	function stopAndRemoveBufferSource():Void;
	/**
		This method is only used internally and it stops and removes a looping buffer source.
	**/
	function stopAndRemoveLoopBufferSource():Void;
	/**
		Sets the x position of this Sound in Spatial Audio space.
		
		This only has any effect if the sound was created with a SpatialSoundConfig object.
		
		Also see the `WebAudioSoundManager.setListenerPosition` method.
		
		If you find that the sound becomes too quiet, too quickly, as it moves away from
		the listener, then try different `refDistance` property values when configuring
		the spatial sound.
	**/
	var x : Float;
	/**
		Sets the y position of this Sound in Spatial Audio space.
		
		This only has any effect if the sound was created with a SpatialSoundConfig object.
		
		Also see the `WebAudioSoundManager.setListenerPosition` method.
		
		If you find that the sound becomes too quiet, too quickly, as it moves away from
		the listener, then try different `refDistance` property values when configuring
		the spatial sound.
	**/
	var y : Float;
	/**
		Update method called automatically by sound manager on every game step.
	**/
	function update():Void;
	/**
		Method used internally for calculating current playback time of a playing sound.
	**/
	function getCurrentTime():Void;
	/**
		Method used internally for calculating the time
		at witch the loop source should start playing.
	**/
	function getLoopTime():Void;
	/**
		Rate at which this Sound will be played.
		Value of 1.0 plays the audio at full speed, 0.5 plays the audio at half speed
		and 2.0 doubles the audios playback speed.
	**/
	var rate : Float;
	/**
		Sets the playback rate of this Sound.
		
		For example, a value of 1.0 plays the audio at full speed, 0.5 plays the audio at half speed
		and 2.0 doubles the audios playback speed.
	**/
	function setRate(value:Float):WebAudioSound;
	/**
		The detune value of this Sound, given in [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).
		The range of the value is -1200 to 1200, but we recommend setting it to [50](https://en.wikipedia.org/wiki/50_Cent).
	**/
	var detune : Float;
	/**
		Sets the detune value of this Sound, given in [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).
		The range of the value is -1200 to 1200, but we recommend setting it to [50](https://en.wikipedia.org/wiki/50_Cent).
	**/
	function setDetune(value:Float):WebAudioSound;
	/**
		Boolean indicating whether the sound is muted or not.
		Gets or sets the muted state of this sound.
	**/
	var mute : Bool;
	/**
		Sets the muted state of this Sound.
	**/
	function setMute(value:Bool):WebAudioSound;
	/**
		Gets or sets the volume of this sound, a value between 0 (silence) and 1 (full volume).
	**/
	var volume : Float;
	/**
		Sets the volume of this Sound.
	**/
	function setVolume(value:Float):WebAudioSound;
	/**
		Property representing the position of playback for this sound, in seconds.
		Setting it to a specific value moves current playback to that position.
		The value given is clamped to the range 0 to current marker duration.
		Setting seek of a stopped sound has no effect.
	**/
	var seek : Float;
	/**
		Seeks to a specific point in this sound.
	**/
	function setSeek(value:Float):WebAudioSound;
	/**
		Flag indicating whether or not the sound or current sound marker will loop.
	**/
	var loop : Bool;
	/**
		Sets the loop state of this Sound.
	**/
	function setLoop(value:Bool):WebAudioSound;
	/**
		Gets or sets the pan of this sound, a value between -1 (full left pan) and 1 (full right pan).
		
		Always returns zero on iOS / Safari as it doesn't support the stereo panner node.
	**/
	var pan : Float;
	/**
		Sets the pan of this sound, a value between -1 (full left pan) and 1 (full right pan).
		
		Note: iOS / Safari doesn't support the stereo panner node.
	**/
	function setPan(value:Float):WebAudioSound;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebAudioSound;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebAudioSound;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebAudioSound;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):WebAudioSound;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):WebAudioSound;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):WebAudioSound;
	static var prototype : WebAudioSound;
}