package phaser.types.tweens;

typedef TweenCallbacks = {
	/**
		A function to call when the tween becomes active within the Tween Manager.
	**/
	@:optional
	dynamic function onActive(tween:phaser.tweens.Tween, targets:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		A function to call when the tween starts playback, after any delays have expired.
	**/
	@:optional
	dynamic function onStart(tween:phaser.tweens.Tween, targets:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		A function to call when the tween completes.
	**/
	@:optional
	dynamic function onComplete(tween:phaser.tweens.Tween, targets:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		A function to call each time the tween loops.
	**/
	@:optional
	dynamic function onLoop(tween:phaser.tweens.Tween, targets:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		A function to call each time the tween is paused.
	**/
	@:optional
	dynamic function onPause(tween:phaser.tweens.Tween, targets:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		A function to call each time the tween is resumed.
	**/
	@:optional
	dynamic function onResume(tween:phaser.tweens.Tween, targets:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		A function to call each time the tween repeats. Called once per property per target.
	**/
	@:optional
	dynamic function onRepeat(tween:phaser.tweens.Tween, target:Dynamic, key:String, current:Float, previous:Float, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		A function to call when the tween is stopped.
	**/
	@:optional
	dynamic function onStop(tween:phaser.tweens.Tween, targets:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		A function to call each time the tween steps. Called once per property per target.
	**/
	@:optional
	dynamic function onUpdate(tween:phaser.tweens.Tween, target:Dynamic, key:String, current:Float, previous:Float, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		A function to call each time the tween yoyos. Called once per property per target.
	**/
	@:optional
	dynamic function onYoyo(tween:phaser.tweens.Tween, target:Dynamic, key:String, current:Float, previous:Float, param:haxe.extern.Rest<Dynamic>):Void;
};