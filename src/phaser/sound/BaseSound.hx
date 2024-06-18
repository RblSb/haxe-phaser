package phaser.sound;

/**
	Class containing all the shared state and behavior of a sound object, independent of the implementation.
**/
@:native("Phaser.Sound.BaseSound") extern class BaseSound extends phaser.events.EventEmitter {
	function new(manager:BaseSoundManager, key:String, ?config:phaser.types.sound.SoundConfig);
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
	/**
		Adds a marker into the current sound. A marker is represented by name, start time, duration, and optionally config object.
		This allows you to bundle multiple sounds together into a single audio file and use markers to jump between them for playback.
	**/
	function addMarker(marker:phaser.types.sound.SoundMarker):Bool;
	/**
		Updates previously added marker.
	**/
	function updateMarker(marker:phaser.types.sound.SoundMarker):Bool;
	/**
		Removes a marker from the sound.
	**/
	function removeMarker(markerName:String):Null<phaser.types.sound.SoundMarker>;
	/**
		Play this sound, or a marked section of it.
		
		It always plays the sound from the start. If you want to start playback from a specific time
		you can set 'seek' setting of the config object, provided to this call, to that value.
	**/
	function play(?markerName:ts.AnyOf2<String, phaser.types.sound.SoundConfig>, ?config:phaser.types.sound.SoundConfig):Bool;
	/**
		Pauses the sound. This only works if the sound is currently playing.
		
		You can inspect the `isPlaying` and `isPaused` properties to check the state.
	**/
	function pause():Bool;
	/**
		Resumes the sound. This only works if the sound is paused and not already playing.
		
		You can inspect the `isPlaying` and `isPaused` properties to check the state.
	**/
	function resume():Bool;
	/**
		Stop playing this sound.
	**/
	function stop():Bool;
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
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):BaseSound;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):BaseSound;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):BaseSound;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):BaseSound;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):BaseSound;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):BaseSound;
	static var prototype : BaseSound;
}