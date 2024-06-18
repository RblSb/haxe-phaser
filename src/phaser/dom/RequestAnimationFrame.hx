package phaser.dom;

/**
	Abstracts away the use of RAF or setTimeOut for the core game update loop.
	
	This is invoked automatically by the Phaser.Game instance.
**/
@:native("Phaser.DOM.RequestAnimationFrame") extern class RequestAnimationFrame {
	function new();
	/**
		True if RequestAnimationFrame is running, otherwise false.
	**/
	var isRunning : Bool;
	/**
		The callback to be invoked each step.
	**/
	dynamic function callback(time:Float):Void;
	/**
		True if the step is using setTimeout instead of RAF.
	**/
	var isSetTimeOut : Bool;
	/**
		The setTimeout or RAF callback ID used when canceling them.
	**/
	var timeOutID : Null<Float>;
	/**
		The delay rate in ms for setTimeOut.
	**/
	var delay : Float;
	/**
		The RAF step function.
		
		Invokes the callback and schedules another call to requestAnimationFrame.
	**/
	dynamic function step(time:Float):Void;
	/**
		The SetTimeout step function.
		
		Invokes the callback and schedules another call to setTimeout.
	**/
	var stepTimeout : haxe.Constraints.Function;
	/**
		Starts the requestAnimationFrame or setTimeout process running.
	**/
	function start(callback:js.html.FrameRequestCallback, forceSetTimeOut:Bool, delay:Float):Void;
	/**
		Stops the requestAnimationFrame or setTimeout from running.
	**/
	function stop():Void;
	/**
		Stops the step from running and clears the callback reference.
	**/
	function destroy():Void;
	static var prototype : RequestAnimationFrame;
}