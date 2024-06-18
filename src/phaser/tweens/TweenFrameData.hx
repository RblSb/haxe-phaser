package phaser.tweens;

/**
	The TweenFrameData is a class that contains a single target that will change the texture frame
	at the conclusion of the Tween.
	
	TweenFrameData instances are typically created by the TweenBuilder automatically, when it
	detects the prescence of a 'texture' property as the key being tweened.
	
	A Tween can own multiple TweenFrameData instances, but a TweenFrameData only
	ever belongs to a single Tween.
	
	You should not typically create these yourself, but rather use the TweenBuilder,
	or the `Tween.addFrame` method.
**/
@:native("Phaser.Tweens.TweenFrameData") extern class TweenFrameData extends BaseTweenData {
	function new(tween:Tween, targetIndex:Float, texture:String, frame:ts.AnyOf2<String, Float>, delay:haxe.Constraints.Function, duration:Float, hold:Float, repeat:Float, repeatDelay:Float, flipX:Bool, flipY:Bool);
	/**
		The property of the target to be tweened.
		
		Always 'texture' for a TweenFrameData object.
	**/
	final key : String;
	/**
		The texture to be set at the start of the tween.
	**/
	var startTexture : String;
	/**
		The texture to be set at the end of the tween.
	**/
	var endTexture : String;
	/**
		The frame to be set at the start of the tween.
	**/
	var startFrame : ts.AnyOf2<String, Float>;
	/**
		The frame to be set at the end of the tween.
	**/
	var endFrame : ts.AnyOf2<String, Float>;
	/**
		Internal method that resets this Tween Data entirely, including the progress and elapsed values.
		
		Called automatically by the parent Tween. Should not be called directly.
	**/
	function reset(?isSeeking:Bool):Void;
	/**
		Internal method that advances this TweenData based on the delta value given.
	**/
	function update(delta:Float):Bool;
	/**
		Internal method that will emit a TweenData based Event on the
		parent Tween and also invoke the given callback, if provided.
	**/
	function dispatchEvent(event:String, ?callback:phaser.types.tweens.TweenCallbackTypes):Void;
	static var prototype : TweenFrameData;
}