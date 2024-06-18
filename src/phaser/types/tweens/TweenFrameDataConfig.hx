package phaser.types.tweens;

typedef TweenFrameDataConfig = {
	/**
		The target to tween.
	**/
	var target : Dynamic;
	/**
		The target index within the Tween targets array.
	**/
	var index : Float;
	/**
		The property of the target being tweened.
	**/
	var key : String;
	/**
		Duration of the tween in milliseconds, excludes time for yoyo or repeats.
	**/
	@:optional
	var duration : Float;
	/**
		The total calculated duration of this TweenData (based on duration, repeat, delay and yoyo)
	**/
	@:optional
	var totalDuration : Float;
	/**
		Time in milliseconds before tween will start.
	**/
	@:optional
	var delay : Float;
	/**
		Time in milliseconds the tween will pause before running the yoyo or starting a repeat.
	**/
	@:optional
	var hold : Float;
	/**
		Number of times to repeat the tween. The tween will always run once regardless, so a repeat value of '1' will play the tween twice.
	**/
	@:optional
	var repeat : Float;
	/**
		Time in milliseconds before the repeat will start.
	**/
	@:optional
	var repeatDelay : Float;
	/**
		Automatically call toggleFlipX when the TweenData yoyos or repeats
	**/
	@:optional
	var flipX : Bool;
	/**
		Automatically call toggleFlipY when the TweenData yoyos or repeats
	**/
	@:optional
	var flipY : Bool;
	/**
		Between 0 and 1 showing completion of this TweenData.
	**/
	@:optional
	var progress : Float;
	/**
		Delta counter
	**/
	@:optional
	var elapsed : Float;
	/**
		How many repeats are left to run?
	**/
	@:optional
	var repeatCounter : Float;
	/**
		LoadValue generation functions.
	**/
	@:optional
	var gen : TweenDataGenConfig;
	/**
		TWEEN_CONST.CREATED
	**/
	@:optional
	var state : phaser.tweens.States;
};