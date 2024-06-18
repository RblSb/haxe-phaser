package phaser.types.time;

typedef TimelineEvent = {
	/**
		Has this event completed yet?
	**/
	var complete : Bool;
	/**
		Is this a once only event?
	**/
	var once : Bool;
	/**
		The time (in elapsed ms) at which this event will fire.
	**/
	var time : Float;
	/**
		The amount of times this Event has repeated.
	**/
	@:optional
	var repeat : haxe.Constraints.Function;
	/**
		User-land callback which will be called if set. If it returns `true` then this event run all of its actions, otherwise it will be skipped.
	**/
	@:optional
	@:native("if")
	var if_ : haxe.Constraints.Function;
	/**
		User-land callback which will be called when the Event fires.
	**/
	@:optional
	var run : haxe.Constraints.Function;
	/**
		User-land callback which will be called when the Event loops.
	**/
	@:optional
	var loop : haxe.Constraints.Function;
	/**
		Tween configuration object which will be used to create a Tween when the Event fires if set.
	**/
	@:optional
	var tween : ts.AnyOf4<phaser.types.tweens.TweenBuilderConfig, phaser.types.tweens.TweenChainBuilderConfig, phaser.tweens.Tween, phaser.tweens.TweenChain>;
	/**
		Object containing properties to set on the `target` when the Event fires if set.
	**/
	@:optional
	var set : Dynamic;
	/**
		Sound configuration object which will be used to create a Sound when the Event fires if set.
	**/
	@:optional
	var sound : ts.AnyOf2<String, Dynamic>;
	/**
		The scope (`this` object) with which to invoke the run `callback`.
	**/
	@:optional
	var target : Dynamic;
	/**
		Optional event name to emit when the Event fires.
	**/
	@:optional
	var event : String;
};