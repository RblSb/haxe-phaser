package phaser.tweens;

@:native("Phaser.Tweens.Builders") @valueModuleOnly extern class Builders {
	/**
		Retrieves the value of the given key from an object.
	**/
	static function GetBoolean(source:Dynamic, key:String, defaultValue:Bool):Bool;
	/**
		This internal function is used to return the correct ease function for a Tween.
		
		It can take a variety of input, including an EaseMap based string, or a custom function.
	**/
	static function GetEaseFunction(ease:ts.AnyOf2<String, haxe.Constraints.Function>, ?easeParams:Array<Float>):haxe.Constraints.Function;
	/**
		This internal function is used to return the correct interpolation function for a Tween.
		
		It can take a variety of input, including a string, or a custom function.
	**/
	static function GetInterpolationFunction(interpolation:Null<ts.AnyOf2<String, haxe.Constraints.Function>>):Null<haxe.Constraints.Function>;
	/**
		Internal function used by the Tween Builder to create a function that will return
		the given value from the source.
	**/
	static function GetNewValue(source:Dynamic, key:String, defaultValue:Dynamic):haxe.Constraints.Function;
	/**
		Internal function used by the Tween Builder to return an array of properties
		that the Tween will be operating on. It takes a tween configuration object
		and then checks that none of the `props` entries start with an underscore, or that
		none of the direct properties are on the Reserved list.
	**/
	static function GetProps(config:phaser.types.tweens.TweenBuilderConfig):Array<String>;
	/**
		Extracts an array of targets from a Tween configuration object.
		
		The targets will be looked for in a `targets` property. If it's a function, its return value will be used as the result.
	**/
	static function GetTargets(config:Dynamic):Array<Dynamic>;
	/**
		Returns `getActive`, `getStart` and `getEnd` functions for a TweenData based on a target property and end value.
		
		`getActive` if not null, is invoked _immediately_ as soon as the TweenData is running, and is set on the target property.
		`getEnd` is invoked once any start delays have expired and returns what the value should tween to.
		`getStart` is invoked when the tween reaches the end and needs to either repeat or yoyo, it returns the value to go back to.
		
		If the end value is a number, it will be treated as an absolute value and the property will be tweened to it.
		A string can be provided to specify a relative end value which consists of an operation
		(`+=` to add to the current value, `-=` to subtract from the current value, `*=` to multiply the current
		value, or `/=` to divide the current value) followed by its operand.
		
		A function can be provided to allow greater control over the end value; it will receive the target
		object being tweened, the name of the property being tweened, and the current value of the property
		as its arguments and must return a value.
		
		If both the starting and the ending values need to be controlled, an object with `getStart` and `getEnd`
		callbacks, which will receive the same arguments, can be provided instead. If an object with a `value`
		property is provided, the property will be used as the effective value under the same rules described here.
	**/
	static function GetValueOp(key:String, propertyValue:Dynamic):haxe.Constraints.Function;
	/**
		Creates a new Number Tween.
	**/
	static function NumberTweenBuilder(parent:TweenManager, config:phaser.types.tweens.NumberTweenBuilderConfig, defaults:phaser.types.tweens.TweenConfigDefaults):Tween;
	/**
		Creates a Stagger function to be used by a Tween property.
		
		The stagger function will allow you to stagger changes to the value of the property across all targets of the tween.
		
		This is only worth using if the tween has multiple targets.
		
		The following will stagger the delay by 100ms across all targets of the tween, causing them to scale down to 0.2
		over the duration specified:
		
		```javascript
		this.tweens.add({
		     targets: [ ... ],
		     scale: 0.2,
		     ease: 'linear',
		     duration: 1000,
		     delay: this.tweens.stagger(100)
		});
		```
		
		The following will stagger the delay by 500ms across all targets of the tween using a 10 x 6 grid, staggering
		from the center out, using a cubic ease.
		
		```javascript
		this.tweens.add({
		     targets: [ ... ],
		     scale: 0.2,
		     ease: 'linear',
		     duration: 1000,
		     delay: this.tweens.stagger(500, { grid: [ 10, 6 ], from: 'center', ease: 'cubic.out' })
		});
		```
	**/
	static function StaggerBuilder(value:ts.AnyOf2<Float, Array<Float>>, ?config:phaser.types.tweens.StaggerConfig):haxe.Constraints.Function;
	/**
		Creates a new Tween.
	**/
	static function TweenBuilder(parent:TweenManager, config:ts.AnyOf2<Dynamic, phaser.types.tweens.TweenBuilderConfig>, defaults:phaser.types.tweens.TweenConfigDefaults):Tween;
	/**
		Creates a new Tween Chain instance.
	**/
	static function TweenChainBuilder(parent:TweenManager, config:ts.AnyOf2<Dynamic, phaser.types.tweens.TweenChainBuilderConfig>):TweenChain;
}