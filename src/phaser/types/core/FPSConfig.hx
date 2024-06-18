package phaser.types.core;

typedef FPSConfig = {
	/**
		The minimum acceptable rendering rate, in frames per second.
	**/
	@:optional
	var min : Float;
	/**
		The optimum rendering rate, in frames per second. This does not enforce the fps rate, it merely tells Phaser what rate is considered optimal for this game.
	**/
	@:optional
	var target : Float;
	/**
		Enforces an fps rate limit that the game step will run at, regardless of browser frequency. 0 means 'no limit'. Never set this higher than RAF can handle.
	**/
	@:optional
	var limit : Float;
	/**
		Use setTimeout instead of requestAnimationFrame to run the game loop.
	**/
	@:optional
	var forceSetTimeOut : Bool;
	/**
		Calculate the average frame delta from this many consecutive frame intervals.
	**/
	@:optional
	var deltaHistory : Float;
	/**
		The amount of frames the time step counts before we trust the delta values again.
	**/
	@:optional
	var panicMax : Float;
	/**
		Apply delta smoothing during the game update to help avoid spikes?
	**/
	@:optional
	var smoothStep : Bool;
};