package phaser;

@:native("Phaser.Actions") @valueModuleOnly extern class Actions {
	/**
		Takes an array of Game Objects and aligns them next to each other.
		
		The alignment position is controlled by the `position` parameter, which should be one
		of the Phaser.Display.Align constants, such as `Phaser.Display.Align.TOP_LEFT`,
		`Phaser.Display.Align.TOP_CENTER`, etc.
		
		The first item isn't moved. The second item is aligned next to the first,
		then the third next to the second, and so on.
	**/
	static function AlignTo<G>(items:G, position:Float, ?offsetX:Float, ?offsetY:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have a public `angle` property,
		and then adds the given value to each of their `angle` properties.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `Angle(group.getChildren(), value, step)`
	**/
	static function Angle<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of objects and passes each of them to the given callback.
	**/
	static function Call<G>(items:G, callback:phaser.types.actions.CallCallback, context:Dynamic):G;
	/**
		Takes an array of objects and returns the first element in the array that has properties which match
		all of those specified in the `compare` object. For example, if the compare object was: `{ scaleX: 0.5, alpha: 1 }`
		then it would return the first item which had the property `scaleX` set to 0.5 and `alpha` set to 1.
		
		To use this with a Group: `GetFirst(group.getChildren(), compare, index)`
	**/
	static function GetFirst<G>(items:G, compare:Dynamic, ?index:Float):Null<ts.AnyOf2<Dynamic, phaser.gameobjects.GameObject>>;
	/**
		Takes an array of objects and returns the last element in the array that has properties which match
		all of those specified in the `compare` object. For example, if the compare object was: `{ scaleX: 0.5, alpha: 1 }`
		then it would return the last item which had the property `scaleX` set to 0.5 and `alpha` set to 1.
		
		To use this with a Group: `GetLast(group.getChildren(), compare, index)`
	**/
	static function GetLast<G>(items:G, compare:Dynamic, ?index:Float):Null<ts.AnyOf2<Dynamic, phaser.gameobjects.GameObject>>;
	/**
		Takes an array of Game Objects, or any objects that have public `x` and `y` properties,
		and then aligns them based on the grid configuration given to this action.
	**/
	static function GridAlign<G>(items:G, options:phaser.types.actions.GridAlignConfig):G;
	/**
		Takes an array of Game Objects, or any objects that have a public `alpha` property,
		and then adds the given value to each of their `alpha` properties.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `IncAlpha(group.getChildren(), value, step)`
	**/
	static function IncAlpha<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have a public `x` property,
		and then adds the given value to each of their `x` properties.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `IncX(group.getChildren(), value, step)`
	**/
	static function IncX<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have public `x` and `y` properties,
		and then adds the given value to each of them.
		
		The optional `stepX` and `stepY` properties are applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `IncXY(group.getChildren(), x, y, stepX, stepY)`
	**/
	static function IncXY<G>(items:G, x:Float, ?y:Float, ?stepX:Float, ?stepY:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have a public `y` property,
		and then adds the given value to each of their `y` properties.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `IncY(group.getChildren(), value, step)`
	**/
	static function IncY<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects and positions them on evenly spaced points around the perimeter of a Circle.
		
		If you wish to pass a `Phaser.GameObjects.Circle` Shape to this function, you should pass its `geom` property.
	**/
	static function PlaceOnCircle<G>(items:G, circle:phaser.geom.Circle, ?startAngle:Float, ?endAngle:Float):G;
	/**
		Takes an array of Game Objects and positions them on evenly spaced points around the perimeter of an Ellipse.
		
		If you wish to pass a `Phaser.GameObjects.Ellipse` Shape to this function, you should pass its `geom` property.
	**/
	static function PlaceOnEllipse<G>(items:G, ellipse:phaser.geom.Ellipse, ?startAngle:Float, ?endAngle:Float):G;
	/**
		Positions an array of Game Objects on evenly spaced points of a Line.
		If the ease parameter is supplied, it will space the points based on that easing function along the line.
	**/
	static function PlaceOnLine<G>(items:G, line:phaser.geom.Line, ?ease:ts.AnyOf2<String, haxe.Constraints.Function>):G;
	/**
		Takes an array of Game Objects and positions them on evenly spaced points around the perimeter of a Rectangle.
		
		Placement starts from the top-left of the rectangle, and proceeds in a clockwise direction.
		If the `shift` parameter is given you can offset where placement begins.
	**/
	static function PlaceOnRectangle<G>(items:G, rect:phaser.geom.Rectangle, ?shift:Float):G;
	/**
		Takes an array of Game Objects and positions them on evenly spaced points around the edges of a Triangle.
		
		If you wish to pass a `Phaser.GameObjects.Triangle` Shape to this function, you should pass its `geom` property.
	**/
	static function PlaceOnTriangle<G>(items:G, triangle:phaser.geom.Triangle, ?stepRate:Float):G;
	/**
		Play an animation on all Game Objects in the array that have an Animation component.
		
		You can pass either an animation key, or an animation configuration object for more control over the playback.
	**/
	static function PlayAnimation<G>(items:G, key:ts.AnyOf3<String, phaser.animations.Animation, phaser.types.animations.PlayAnimationConfig>, ?ignoreIfPlaying:Bool):G;
	/**
		Takes an array of Game Objects, or any objects that have a public property as defined in `key`,
		and then adds the given value to it.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `PropertyValueInc(group.getChildren(), key, value, step)`
	**/
	static function PropertyValueInc<G>(items:G, key:String, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have a public property as defined in `key`,
		and then sets it to the given value.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `PropertyValueSet(group.getChildren(), key, value, step)`
	**/
	static function PropertyValueSet<G>(items:G, key:String, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects and positions them at random locations within the Circle.
		
		If you wish to pass a `Phaser.GameObjects.Circle` Shape to this function, you should pass its `geom` property.
	**/
	static function RandomCircle<G>(items:G, circle:phaser.geom.Circle):G;
	/**
		Takes an array of Game Objects and positions them at random locations within the Ellipse.
		
		If you wish to pass a `Phaser.GameObjects.Ellipse` Shape to this function, you should pass its `geom` property.
	**/
	static function RandomEllipse<G>(items:G, ellipse:phaser.geom.Ellipse):G;
	/**
		Takes an array of Game Objects and positions them at random locations on the Line.
		
		If you wish to pass a `Phaser.GameObjects.Line` Shape to this function, you should pass its `geom` property.
	**/
	static function RandomLine<G>(items:G, line:phaser.geom.Line):G;
	/**
		Takes an array of Game Objects and positions them at random locations within the Rectangle.
	**/
	static function RandomRectangle<G>(items:G, rect:phaser.geom.Rectangle):G;
	/**
		Takes an array of Game Objects and positions them at random locations within the Triangle.
		
		If you wish to pass a `Phaser.GameObjects.Triangle` Shape to this function, you should pass its `geom` property.
	**/
	static function RandomTriangle<G>(items:G, triangle:phaser.geom.Triangle):G;
	/**
		Takes an array of Game Objects, or any objects that have a public `rotation` property,
		and then adds the given value to each of their `rotation` properties.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `Rotate(group.getChildren(), value, step)`
	**/
	static function Rotate<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Rotates each item around the given point by the given angle.
	**/
	static function RotateAround<G>(items:G, point:Dynamic, angle:Float):G;
	/**
		Rotates an array of Game Objects around a point by the given angle and distance.
	**/
	static function RotateAroundDistance<G>(items:G, point:Dynamic, angle:Float, distance:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have a public `scaleX` property,
		and then adds the given value to each of their `scaleX` properties.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `ScaleX(group.getChildren(), value, step)`
	**/
	static function ScaleX<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have public `scaleX` and `scaleY` properties,
		and then adds the given value to each of them.
		
		The optional `stepX` and `stepY` properties are applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `ScaleXY(group.getChildren(), scaleX, scaleY, stepX, stepY)`
	**/
	static function ScaleXY<G>(items:G, scaleX:Float, ?scaleY:Float, ?stepX:Float, ?stepY:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have a public `scaleY` property,
		and then adds the given value to each of their `scaleY` properties.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `ScaleY(group.getChildren(), value, step)`
	**/
	static function ScaleY<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public property `alpha`
		and then sets it to the given value.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `SetAlpha(group.getChildren(), value, step)`
	**/
	static function SetAlpha<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public property `blendMode`
		and then sets it to the given value.
		
		To use this with a Group: `SetBlendMode(group.getChildren(), value)`
	**/
	static function SetBlendMode<G>(items:G, value:ts.AnyOf3<String, Float, BlendModes>, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public property `depth`
		and then sets it to the given value.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `SetDepth(group.getChildren(), value, step)`
	**/
	static function SetDepth<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Passes all provided Game Objects to the Input Manager to enable them for input with identical areas and callbacks.
	**/
	static function SetHitArea<G>(items:G, ?hitArea:Dynamic, ?callback:phaser.types.input.HitAreaCallback):G;
	/**
		Takes an array of Game Objects, or any objects that have the public properties `originX` and `originY`
		and then sets them to the given values.
		
		The optional `stepX` and `stepY` properties are applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `SetOrigin(group.getChildren(), originX, originY, stepX, stepY)`
	**/
	static function SetOrigin<G>(items:G, originX:Float, ?originY:Float, ?stepX:Float, ?stepY:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public property `rotation`
		and then sets it to the given value.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `SetRotation(group.getChildren(), value, step)`
	**/
	static function SetRotation<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public properties `scaleX` and `scaleY`
		and then sets them to the given values.
		
		The optional `stepX` and `stepY` properties are applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `SetScale(group.getChildren(), scaleX, scaleY, stepX, stepY)`
	**/
	static function SetScale<G>(items:G, scaleX:Float, ?scaleY:Float, ?stepX:Float, ?stepY:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public property `scaleX`
		and then sets it to the given value.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `SetScaleX(group.getChildren(), value, step)`
	**/
	static function SetScaleX<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public property `scaleY`
		and then sets it to the given value.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `SetScaleY(group.getChildren(), value, step)`
	**/
	static function SetScaleY<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public properties `scrollFactorX` and `scrollFactorY`
		and then sets them to the given values.
		
		The optional `stepX` and `stepY` properties are applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `SetScrollFactor(group.getChildren(), scrollFactorX, scrollFactorY, stepX, stepY)`
	**/
	static function SetScrollFactor<G>(items:G, scrollFactorX:Float, ?scrollFactorY:Float, ?stepX:Float, ?stepY:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public property `scrollFactorX`
		and then sets it to the given value.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `SetScrollFactorX(group.getChildren(), value, step)`
	**/
	static function SetScrollFactorX<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public property `scrollFactorY`
		and then sets it to the given value.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `SetScrollFactorY(group.getChildren(), value, step)`
	**/
	static function SetScrollFactorY<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public method setTint() and then updates it to the given value(s). You can specify tint color per corner or provide only one color value for `topLeft` parameter, in which case whole item will be tinted with that color.
	**/
	static function SetTint<G>(items:G, topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public property `visible`
		and then sets it to the given value.
		
		To use this with a Group: `SetVisible(group.getChildren(), value)`
	**/
	static function SetVisible<G>(items:G, value:Bool, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public property `x`
		and then sets it to the given value.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `SetX(group.getChildren(), value, step)`
	**/
	static function SetX<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public properties `x` and `y`
		and then sets them to the given values.
		
		The optional `stepX` and `stepY` properties are applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `SetXY(group.getChildren(), x, y, stepX, stepY)`
	**/
	static function SetXY<G>(items:G, x:Float, ?y:Float, ?stepX:Float, ?stepY:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of Game Objects, or any objects that have the public property `y`
		and then sets it to the given value.
		
		The optional `step` property is applied incrementally, multiplied by each item in the array.
		
		To use this with a Group: `SetY(group.getChildren(), value, step)`
	**/
	static function SetY<G>(items:G, value:Float, ?step:Float, ?index:Float, ?direction:Float):G;
	/**
		Takes an array of items, such as Game Objects, or any objects with public `x` and
		`y` properties and then iterates through them. As this function iterates, it moves
		the position of the current element to be that of the previous entry in the array.
		This repeats until all items have been moved.
		
		The direction controls the order of iteration. A value of 0 (the default) assumes
		that the final item in the array is the 'head' item.
		
		A direction value of 1 assumes that the first item in the array is the 'head' item.
		
		The position of the 'head' item is set to the x/y values given to this function.
		Every other item in the array is then updated, in sequence, to be that of the
		previous (or next) entry in the array.
		
		The final x/y coords are returned, or set in the 'output' Vector2.
		
		Think of it as being like the game Snake, where the 'head' is moved and then
		each body piece is moved into the space of the previous piece.
	**/
	static function ShiftPosition<G, O>(items:G, x:Float, y:Float, ?direction:Float, ?output:O):O;
	/**
		Shuffles the array in place. The shuffled array is both modified and returned.
	**/
	static function Shuffle<G>(items:G):G;
	/**
		Smootherstep is a sigmoid-like interpolation and clamping function.
		
		The function depends on three parameters, the input x, the "left edge" and the "right edge", with the left edge being assumed smaller than the right edge. The function receives a real number x as an argument and returns 0 if x is less than or equal to the left edge, 1 if x is greater than or equal to the right edge, and smoothly interpolates, using a Hermite polynomial, between 0 and 1 otherwise. The slope of the smoothstep function is zero at both edges. This is convenient for creating a sequence of transitions using smoothstep to interpolate each segment as an alternative to using more sophisticated or expensive interpolation techniques.
	**/
	static function SmootherStep<G>(items:G, property:String, min:Float, max:Float, ?inc:Bool):G;
	/**
		Smoothstep is a sigmoid-like interpolation and clamping function.
		
		The function depends on three parameters, the input x, the "left edge"
		and the "right edge", with the left edge being assumed smaller than the right edge.
		
		The function receives a real number x as an argument and returns 0 if x is less than
		or equal to the left edge, 1 if x is greater than or equal to the right edge, and smoothly
		interpolates, using a Hermite polynomial, between 0 and 1 otherwise. The slope of the
		smoothstep function is zero at both edges.
		
		This is convenient for creating a sequence of transitions using smoothstep to interpolate
		each segment as an alternative to using more sophisticated or expensive interpolation techniques.
	**/
	static function SmoothStep<G>(items:G, property:String, min:Float, max:Float, ?inc:Bool):G;
	/**
		Takes an array of Game Objects and then modifies their `property` so the value equals, or is incremented, by the
		calculated spread value.
		
		The spread value is derived from the given `min` and `max` values and the total number of items in the array.
		
		For example, to cause an array of Sprites to change in alpha from 0 to 1 you could call:
		
		```javascript
		Phaser.Actions.Spread(itemsArray, 'alpha', 0, 1);
		```
	**/
	static function Spread<G>(items:G, property:String, min:Float, max:Float, ?inc:Bool):G;
	/**
		Takes an array of Game Objects and toggles the visibility of each one.
		Those previously `visible = false` will become `visible = true`, and vice versa.
	**/
	static function ToggleVisible<G>(items:G):G;
	/**
		Iterates through the given array and makes sure that each objects x and y
		properties are wrapped to keep them contained within the given Rectangles
		area.
	**/
	static function WrapInRectangle<G>(items:G, rect:phaser.geom.Rectangle, ?padding:Float):G;
}