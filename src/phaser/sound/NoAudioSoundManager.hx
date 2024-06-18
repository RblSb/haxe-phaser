package phaser.sound;

/**
	No-audio implementation of the Sound Manager. It is used if audio has been
	disabled in the game config or the device doesn't support any audio.
	
	It represents a graceful degradation of Sound Manager logic that provides
	minimal functionality and prevents Phaser projects that use audio from
	breaking on devices that don't support any audio playback technologies.
**/
@:native("Phaser.Sound.NoAudioSoundManager") extern class NoAudioSoundManager extends BaseSoundManager {
	function new(game:phaser.Game);
	/**
		Adds a new sound into the sound manager.
	**/
	function add(key:String, ?config:phaser.types.sound.SoundConfig):NoAudioSound;
	/**
		Adds a new audio sprite sound into the sound manager.
		Audio Sprites are a combination of audio files and a JSON configuration.
		The JSON follows the format of that created by https://github.com/tonistiigi/audiosprite
	**/
	function addAudioSprite(key:String, ?config:phaser.types.sound.SoundConfig):NoAudioSound;
	/**
		Gets any sounds in the manager matching the given key.
	**/
	function getAll<T>(key:String):Array<T>;
	/**
		Empty function for the No Audio Sound Manager.
	**/
	function onGameBlur():Void;
	/**
		Empty function for the No Audio Sound Manager.
	**/
	function onGameFocus():Void;
	/**
		Empty function for the No Audio Sound Manager.
	**/
	function update():Void;
	/**
		Empty function for the No Audio Sound Manager.
	**/
	function setRate():NoAudioSoundManager;
	/**
		Empty function for the No Audio Sound Manager.
	**/
	function setDetune():NoAudioSoundManager;
	/**
		Empty function for the No Audio Sound Manager.
	**/
	function setMute():Void;
	/**
		Empty function for the No Audio Sound Manager.
	**/
	function setVolume():Void;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):NoAudioSoundManager;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):NoAudioSoundManager;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):NoAudioSoundManager;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):NoAudioSoundManager;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):NoAudioSoundManager;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):NoAudioSoundManager;
	static var prototype : NoAudioSoundManager;
}