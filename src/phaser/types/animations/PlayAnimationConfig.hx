package phaser.types.animations;

typedef PlayAnimationConfig = {
	/**
		The string-based key of the animation to play, or an Animation instance.
	**/
	var key : ts.AnyOf2<String, phaser.animations.Animation>;
	/**
		The frame rate of playback in frames per second (default 24 if duration is null)
	**/
	@:optional
	var frameRate : Float;
	/**
		How long the animation should play for in milliseconds. If not given its derived from frameRate.
	**/
	@:optional
	var duration : Float;
	/**
		Delay before starting playback. Value given in milliseconds.
	**/
	@:optional
	var delay : Float;
	/**
		Number of times to repeat the animation (-1 for infinity)
	**/
	@:optional
	var repeat : Float;
	/**
		Delay before the animation repeats. Value given in milliseconds.
	**/
	@:optional
	var repeatDelay : Float;
	/**
		Should the animation yoyo? (reverse back down to the start) before repeating?
	**/
	@:optional
	var yoyo : Bool;
	/**
		If this animation has a delay, should it show the first frame immediately (true), or only after the delay (false)
	**/
	@:optional
	var showBeforeDelay : Bool;
	/**
		Should sprite.visible = true when the animation starts to play?
	**/
	@:optional
	var showOnStart : Bool;
	/**
		Should sprite.visible = false when the animation finishes?
	**/
	@:optional
	var hideOnComplete : Bool;
	/**
		Skip frames if the time lags, or always advanced anyway?
	**/
	@:optional
	var skipMissedFrames : Bool;
	/**
		The frame of the animation to start playback from.
	**/
	@:optional
	var startFrame : Float;
	/**
		The time scale to be applied to playback of this animation.
	**/
	@:optional
	var timeScale : Float;
	/**
		Start playback of this animation from a randomly selected frame?
	**/
	@:optional
	var randomFrame : Bool;
};