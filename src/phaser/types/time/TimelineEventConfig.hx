package phaser.types.time;

typedef TimelineEventConfig = {
	/**
		The time (in ms) at which the Event will fire. The Timeline starts at 0.
	**/
	@:optional
	var at : Float;
	/**
		If the Timeline is running, this is the time (in ms) at which the Event will fire based on its current elapsed value. If set it will override the `at` property.
	**/
	@:optional
	@:native("in")
	var in_ : Float;
	/**
		Fire this event 'from' milliseconds after the previous event in the Timeline. If set it will override the `at` and `in` properties.
	**/
	@:optional
	var from : Float;
	/**
		A function which will be called when the Event fires.
	**/
	@:optional
	var run : haxe.Constraints.Function;
	/**
		A function which will be called when the Event loops, this does not get called if the `repeat` method is not used or on first iteration.
	**/
	@:optional
	var loop : haxe.Constraints.Function;
	/**
		Optional string-based event name to emit when the Event fires. The event is emitted from the Timeline instance.
	**/
	@:optional
	var event : String;
	/**
		The scope (`this` object) with which to invoke the run `callback`, if set.
	**/
	@:optional
	var target : Dynamic;
	/**
		If set, the Event will be removed from the Timeline when it fires.
	**/
	@:optional
	var once : Bool;
	/**
		If set, the Timeline will stop and enter a complete state when this Event fires, even if there are other events after it.
	**/
	@:optional
	var stop : Bool;
	/**
		A Tween or TweenChain configuration object or instance. If set, the Event will create this Tween when it fires.
	**/
	@:optional
	var tween : ts.AnyOf4<phaser.types.tweens.TweenBuilderConfig, phaser.types.tweens.TweenChainBuilderConfig, phaser.tweens.Tween, phaser.tweens.TweenChain>;
	/**
		A key-value object of properties to set on the `target` when the Event fires. Ignored if no `target` is given.
	**/
	@:optional
	var set : Dynamic;
	/**
		A key from the Sound Manager to play, or a config object for a sound to play when the Event fires. If a config object it must provide two properties: `key` and `config`. The `key` is the key of the sound to play, and the `config` is the config is a Phaser.Types.Sound.SoundConfig object.
	**/
	@:optional
	var sound : ts.AnyOf2<String, Dynamic>;
};