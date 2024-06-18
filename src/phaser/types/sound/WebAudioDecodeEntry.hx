package phaser.types.sound;

/**
	An entry in the Web Audio Decoding Queue.
**/
typedef WebAudioDecodeEntry = {
	/**
		The key of the sound.
	**/
	var key : String;
	/**
		The callback to invoke on successful decoding.
	**/
	var success : haxe.Constraints.Function;
	/**
		The callback to invoke if the decoding fails.
	**/
	var failure : haxe.Constraints.Function;
	/**
		Has the decoding of this sound file started?
	**/
	var decoding : Bool;
};