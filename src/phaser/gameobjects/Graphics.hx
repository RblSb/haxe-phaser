package phaser.gameobjects;

/**
	A Graphics object is a way to draw primitive shapes to your game. Primitives include forms of geometry, such as
	Rectangles, Circles, and Polygons. They also include lines, arcs and curves. When you initially create a Graphics
	object it will be empty.
	
	To draw to it you must first specify a line style or fill style (or both), draw shapes using paths, and finally
	fill or stroke them. For example:
	
	```javascript
	graphics.lineStyle(5, 0xFF00FF, 1.0);
	graphics.beginPath();
	graphics.moveTo(100, 100);
	graphics.lineTo(200, 200);
	graphics.closePath();
	graphics.strokePath();
	```
	
	There are also many helpful methods that draw and fill/stroke common shapes for you.
	
	```javascript
	graphics.lineStyle(5, 0xFF00FF, 1.0);
	graphics.fillStyle(0xFFFFFF, 1.0);
	graphics.fillRect(50, 50, 400, 200);
	graphics.strokeRect(50, 50, 400, 200);
	```
	
	When a Graphics object is rendered it will render differently based on if the game is running under Canvas or WebGL.
	Under Canvas it will use the HTML Canvas context drawing operations to draw the path.
	Under WebGL the graphics data is decomposed into polygons. Both of these are expensive processes, especially with
	complex shapes.
	
	If your Graphics object doesn't change much (or at all) once you've drawn your shape to it, then you will help
	performance by calling {@link Phaser.GameObjects.Graphics#generateTexture}. This will 'bake' the Graphics object into
	a Texture, and return it. You can then use this Texture for Sprites or other display objects. If your Graphics object
	updates frequently then you should avoid doing this, as it will constantly generate new textures, which will consume
	memory.
	
	As you can tell, Graphics objects are a bit of a trade-off. While they are extremely useful, you need to be careful
	in their complexity and quantity of them in your game.
**/
@:native("Phaser.GameObjects.Graphics") extern class Graphics extends GameObject {
	function new(scene:phaser.Scene, ?options:phaser.types.gameobjects.graphics.Options);
	/**
		The horizontal display origin of the Graphics.
	**/
	var displayOriginX : Float;
	/**
		The vertical display origin of the Graphics.
	**/
	var displayOriginY : Float;
	/**
		The array of commands used to render the Graphics.
	**/
	var commandBuffer : Array<Dynamic>;
	/**
		The default fill color for shapes rendered by this Graphics object.
		Set this value with `setDefaultStyles()`.
	**/
	final defaultFillColor : Float;
	/**
		The default fill alpha for shapes rendered by this Graphics object.
		Set this value with `setDefaultStyles()`.
	**/
	final defaultFillAlpha : Float;
	/**
		The default stroke width for shapes rendered by this Graphics object.
		Set this value with `setDefaultStyles()`.
	**/
	final defaultStrokeWidth : Float;
	/**
		The default stroke color for shapes rendered by this Graphics object.
		Set this value with `setDefaultStyles()`.
	**/
	final defaultStrokeColor : Float;
	/**
		The default stroke alpha for shapes rendered by this Graphics object.
		Set this value with `setDefaultStyles()`.
	**/
	final defaultStrokeAlpha : Float;
	/**
		Set the default style settings for this Graphics object.
	**/
	function setDefaultStyles(options:phaser.types.gameobjects.graphics.Styles):Graphics;
	/**
		Set the current line style. Used for all 'stroke' related functions.
	**/
	function lineStyle(lineWidth:Float, color:Float, ?alpha:Float):Graphics;
	/**
		Set the current fill style. Used for all 'fill' related functions.
	**/
	function fillStyle(color:Float, ?alpha:Float):Graphics;
	/**
		Sets a gradient fill style. This is a WebGL only feature.
		
		The gradient color values represent the 4 corners of an untransformed rectangle.
		The gradient is used to color all filled shapes and paths drawn after calling this method.
		If you wish to turn a gradient off, call `fillStyle` and provide a new single fill color.
		
		When filling a triangle only the first 3 color values provided are used for the 3 points of a triangle.
		
		This feature is best used only on rectangles and triangles. All other shapes will give strange results.
		
		Note that for objects such as arcs or ellipses, or anything which is made out of triangles, each triangle used
		will be filled with a gradient on its own. There is no ability to gradient fill a shape or path as a single
		entity at this time.
	**/
	function fillGradientStyle(topLeft:Float, topRight:Float, bottomLeft:Float, bottomRight:Float, ?alphaTopLeft:Float, ?alphaTopRight:Float, ?alphaBottomLeft:Float, ?alphaBottomRight:Float):Graphics;
	/**
		Sets a gradient line style. This is a WebGL only feature.
		
		The gradient color values represent the 4 corners of an untransformed rectangle.
		The gradient is used to color all stroked shapes and paths drawn after calling this method.
		If you wish to turn a gradient off, call `lineStyle` and provide a new single line color.
		
		This feature is best used only on single lines. All other shapes will give strange results.
		
		Note that for objects such as arcs or ellipses, or anything which is made out of triangles, each triangle used
		will be filled with a gradient on its own. There is no ability to gradient stroke a shape or path as a single
		entity at this time.
	**/
	function lineGradientStyle(lineWidth:Float, topLeft:Float, topRight:Float, bottomLeft:Float, bottomRight:Float, ?alpha:Float):Graphics;
	/**
		Start a new shape path.
	**/
	function beginPath():Graphics;
	/**
		Close the current path.
	**/
	function closePath():Graphics;
	/**
		Fill the current path.
	**/
	function fillPath():Graphics;
	/**
		Fill the current path.
		
		This is an alias for `Graphics.fillPath` and does the same thing.
		It was added to match the CanvasRenderingContext 2D API.
	**/
	function fill():Graphics;
	/**
		Stroke the current path.
	**/
	function strokePath():Graphics;
	/**
		Stroke the current path.
		
		This is an alias for `Graphics.strokePath` and does the same thing.
		It was added to match the CanvasRenderingContext 2D API.
	**/
	function stroke():Graphics;
	/**
		Fill the given circle.
	**/
	function fillCircleShape(circle:phaser.geom.Circle):Graphics;
	/**
		Stroke the given circle.
	**/
	function strokeCircleShape(circle:phaser.geom.Circle):Graphics;
	/**
		Fill a circle with the given position and radius.
	**/
	function fillCircle(x:Float, y:Float, radius:Float):Graphics;
	/**
		Stroke a circle with the given position and radius.
	**/
	function strokeCircle(x:Float, y:Float, radius:Float):Graphics;
	/**
		Fill the given rectangle.
	**/
	function fillRectShape(rect:phaser.geom.Rectangle):Graphics;
	/**
		Stroke the given rectangle.
	**/
	function strokeRectShape(rect:phaser.geom.Rectangle):Graphics;
	/**
		Fill a rectangle with the given position and size.
	**/
	function fillRect(x:Float, y:Float, width:Float, height:Float):Graphics;
	/**
		Stroke a rectangle with the given position and size.
	**/
	function strokeRect(x:Float, y:Float, width:Float, height:Float):Graphics;
	/**
		Fill a rounded rectangle with the given position, size and radius.
	**/
	function fillRoundedRect(x:Float, y:Float, width:Float, height:Float, ?radius:ts.AnyOf2<Float, phaser.types.gameobjects.graphics.RoundedRectRadius>):Graphics;
	/**
		Stroke a rounded rectangle with the given position, size and radius.
	**/
	function strokeRoundedRect(x:Float, y:Float, width:Float, height:Float, ?radius:ts.AnyOf2<Float, phaser.types.gameobjects.graphics.RoundedRectRadius>):Graphics;
	/**
		Fill the given point.
		
		Draws a square at the given position, 1 pixel in size by default.
	**/
	function fillPointShape(point:ts.AnyOf3<Dynamic, phaser.math.Vector2, phaser.geom.Point>, ?size:Float):Graphics;
	/**
		Fill a point at the given position.
		
		Draws a square at the given position, 1 pixel in size by default.
	**/
	function fillPoint(x:Float, y:Float, ?size:Float):Graphics;
	/**
		Fill the given triangle.
	**/
	function fillTriangleShape(triangle:phaser.geom.Triangle):Graphics;
	/**
		Stroke the given triangle.
	**/
	function strokeTriangleShape(triangle:phaser.geom.Triangle):Graphics;
	/**
		Fill a triangle with the given points.
	**/
	function fillTriangle(x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float):Graphics;
	/**
		Stroke a triangle with the given points.
	**/
	function strokeTriangle(x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float):Graphics;
	/**
		Draw the given line.
	**/
	function strokeLineShape(line:phaser.geom.Line):Graphics;
	/**
		Draw a line between the given points.
	**/
	function lineBetween(x1:Float, y1:Float, x2:Float, y2:Float):Graphics;
	/**
		Draw a line from the current drawing position to the given position.
		
		Moves the current drawing position to the given position.
	**/
	function lineTo(x:Float, y:Float):Graphics;
	/**
		Move the current drawing position to the given position.
	**/
	function moveTo(x:Float, y:Float):Graphics;
	/**
		Stroke the shape represented by the given array of points.
		
		Pass `closeShape` to automatically close the shape by joining the last to the first point.
		
		Pass `closePath` to automatically close the path before it is stroked.
	**/
	function strokePoints(points:ts.AnyOf2<Array<Dynamic>, Array<phaser.geom.Point>>, ?closeShape:Bool, ?closePath:Bool, ?endIndex:Float):Graphics;
	/**
		Fill the shape represented by the given array of points.
		
		Pass `closeShape` to automatically close the shape by joining the last to the first point.
		
		Pass `closePath` to automatically close the path before it is filled.
	**/
	function fillPoints(points:ts.AnyOf2<Array<Dynamic>, Array<phaser.geom.Point>>, ?closeShape:Bool, ?closePath:Bool, ?endIndex:Float):Graphics;
	/**
		Stroke the given ellipse.
	**/
	function strokeEllipseShape(ellipse:phaser.geom.Ellipse, ?smoothness:Float):Graphics;
	/**
		Stroke an ellipse with the given position and size.
	**/
	function strokeEllipse(x:Float, y:Float, width:Float, height:Float, ?smoothness:Float):Graphics;
	/**
		Fill the given ellipse.
	**/
	function fillEllipseShape(ellipse:phaser.geom.Ellipse, ?smoothness:Float):Graphics;
	/**
		Fill an ellipse with the given position and size.
	**/
	function fillEllipse(x:Float, y:Float, width:Float, height:Float, ?smoothness:Float):Graphics;
	/**
		Draw an arc.
		
		This method can be used to create circles, or parts of circles.
		
		Make sure you call `beginPath` before starting the arc unless you wish for the arc to automatically
		close when filled or stroked.
		
		Use the optional `overshoot` argument increase the number of iterations that take place when
		the arc is rendered in WebGL. This is useful if you're drawing an arc with an especially thick line,
		as it will allow the arc to fully join-up. Try small values at first, i.e. 0.01.
		
		Call {@link Phaser.GameObjects.Graphics#fillPath} or {@link Phaser.GameObjects.Graphics#strokePath} after calling
		this method to draw the arc.
	**/
	function arc(x:Float, y:Float, radius:Float, startAngle:Float, endAngle:Float, ?anticlockwise:Bool, ?overshoot:Float):Graphics;
	/**
		Creates a pie-chart slice shape centered at `x`, `y` with the given radius.
		You must define the start and end angle of the slice.
		
		Setting the `anticlockwise` argument to `true` creates a shape similar to Pacman.
		Setting it to `false` creates a shape like a slice of pie.
		
		This method will begin a new path and close the path at the end of it.
		To display the actual slice you need to call either `strokePath` or `fillPath` after it.
	**/
	function slice(x:Float, y:Float, radius:Float, startAngle:Float, endAngle:Float, ?anticlockwise:Bool, ?overshoot:Float):Graphics;
	/**
		Saves the state of the Graphics by pushing the current state onto a stack.
		
		The most recently saved state can then be restored with {@link Phaser.GameObjects.Graphics#restore}.
	**/
	function save():Graphics;
	/**
		Restores the most recently saved state of the Graphics by popping from the state stack.
		
		Use {@link Phaser.GameObjects.Graphics#save} to save the current state, and call this afterwards to restore that state.
		
		If there is no saved state, this command does nothing.
	**/
	function restore():Graphics;
	/**
		Inserts a translation command into this Graphics objects command buffer.
		
		All objects drawn _after_ calling this method will be translated
		by the given amount.
		
		This does not change the position of the Graphics object itself,
		only of the objects drawn by it after calling this method.
	**/
	function translateCanvas(x:Float, y:Float):Graphics;
	/**
		Inserts a scale command into this Graphics objects command buffer.
		
		All objects drawn _after_ calling this method will be scaled
		by the given amount.
		
		This does not change the scale of the Graphics object itself,
		only of the objects drawn by it after calling this method.
	**/
	function scaleCanvas(x:Float, y:Float):Graphics;
	/**
		Inserts a rotation command into this Graphics objects command buffer.
		
		All objects drawn _after_ calling this method will be rotated
		by the given amount.
		
		This does not change the rotation of the Graphics object itself,
		only of the objects drawn by it after calling this method.
	**/
	function rotateCanvas(radians:Float):Graphics;
	/**
		Clear the command buffer and reset the fill style and line style to their defaults.
	**/
	function clear():Graphics;
	/**
		Generate a texture from this Graphics object.
		
		If `key` is a string it'll generate a new texture using it and add it into the
		Texture Manager (assuming no key conflict happens).
		
		If `key` is a Canvas it will draw the texture to that canvas context. Note that it will NOT
		automatically upload it to the GPU in WebGL mode.
		
		Please understand that the texture is created via the Canvas API of the browser, therefore some
		Graphics features, such as `fillGradientStyle`, will not appear on the resulting texture,
		as they're unsupported by the Canvas API.
	**/
	function generateTexture(key:ts.AnyOf2<String, js.html.CanvasElement>, ?width:Float, ?height:Float):Graphics;
	/**
		Internal destroy handler, called as part of the destroy process.
	**/
	private function preDestroy():Void;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():Graphics;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
	**/
	function setAlpha(?value:Float):Graphics;
	/**
		The alpha value of the Game Object.
		
		This is a global value, impacting the entire Game Object, not just a region of it.
	**/
	var alpha : Float;
	/**
		Sets the Blend Mode being used by this Game Object.
		
		This can be a const, such as `Phaser.BlendModes.SCREEN`, or an integer, such as 4 (for Overlay)
		
		Under WebGL only the following Blend Modes are available:
		
		* NORMAL
		* ADD
		* MULTIPLY
		* SCREEN
		* ERASE
		
		Canvas has more available depending on browser support.
		
		You can also create your own custom Blend Modes in WebGL.
		
		Blend modes have different effects under Canvas and WebGL, and from browser to browser, depending
		on support. Blend Modes also cause a WebGL batch flush should it encounter a new blend mode. For these
		reasons try to be careful about the construction of your Scene and the frequency of which blend modes
		are used.
	**/
	var blendMode : ts.AnyOf3<String, Float, phaser.BlendModes>;
	/**
		Sets the Blend Mode being used by this Game Object.
		
		This can be a const, such as `Phaser.BlendModes.SCREEN`, or an integer, such as 4 (for Overlay)
		
		Under WebGL only the following Blend Modes are available:
		
		* NORMAL
		* ADD
		* MULTIPLY
		* SCREEN
		* ERASE (only works when rendering to a framebuffer, like a Render Texture)
		
		Canvas has more available depending on browser support.
		
		You can also create your own custom Blend Modes in WebGL.
		
		Blend modes have different effects under Canvas and WebGL, and from browser to browser, depending
		on support. Blend Modes also cause a WebGL batch flush should it encounter a new blend mode. For these
		reasons try to be careful about the construction of your Scene and the frequency in which blend modes
		are used.
	**/
	function setBlendMode(value:ts.AnyOf3<String, Float, phaser.BlendModes>):Graphics;
	/**
		The depth of this Game Object within the Scene. Ensure this value is only ever set to a number data-type.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	var depth : Float;
	/**
		The depth of this Game Object within the Scene.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	function setDepth(value:Float):Graphics;
	/**
		The Mask this Game Object is using during render.
	**/
	var mask : ts.AnyOf2<phaser.display.masks.BitmapMask, phaser.display.masks.GeometryMask>;
	/**
		Sets the mask that this Game Object will use to render with.
		
		The mask must have been previously created and can be either a GeometryMask or a BitmapMask.
		Note: Bitmap Masks only work on WebGL. Geometry Masks work on both WebGL and Canvas.
		
		If a mask is already set on this Game Object it will be immediately replaced.
		
		Masks are positioned in global space and are not relative to the Game Object to which they
		are applied. The reason for this is that multiple Game Objects can all share the same mask.
		
		Masks have no impact on physics or input detection. They are purely a rendering component
		that allows you to limit what is visible during the render pass.
	**/
	function setMask(mask:ts.AnyOf2<phaser.display.masks.BitmapMask, phaser.display.masks.GeometryMask>):Graphics;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):Graphics;
	/**
		Creates and returns a Bitmap Mask. This mask can be used by any Game Object,
		including this one, or a Dynamic Texture.
		
		Note: Bitmap Masks only work on WebGL. Geometry Masks work on both WebGL and Canvas.
		
		To create the mask you need to pass in a reference to a renderable Game Object.
		A renderable Game Object is one that uses a texture to render with, such as an
		Image, Sprite, Render Texture or BitmapText.
		
		If you do not provide a renderable object, and this Game Object has a texture,
		it will use itself as the object. This means you can call this method to create
		a Bitmap Mask from any renderable texture-based Game Object.
	**/
	function createBitmapMask<G, T>(?maskObject:ts.AnyOf2<GameObject, phaser.textures.DynamicTexture>, ?x:Float, ?y:Float, ?texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf3<String, Float, phaser.textures.Frame>):phaser.display.masks.BitmapMask;
	/**
		Creates and returns a Geometry Mask. This mask can be used by any Game Object,
		including this one.
		
		To create the mask you need to pass in a reference to a Graphics Game Object.
		
		If you do not provide a graphics object, and this Game Object is an instance
		of a Graphics object, then it will use itself to create the mask.
		
		This means you can call this method to create a Geometry Mask from any Graphics Game Object.
	**/
	function createGeometryMask<G, S>(?graphics:ts.AnyOf2<Graphics, Shape>):phaser.display.masks.GeometryMask;
	/**
		The initial WebGL pipeline of this Game Object.
		
		If you call `resetPipeline` on this Game Object, the pipeline is reset to this default.
	**/
	var defaultPipeline : phaser.renderer.webgl.WebGLPipeline;
	/**
		The current WebGL pipeline of this Game Object.
	**/
	var pipeline : phaser.renderer.webgl.WebGLPipeline;
	/**
		An object to store pipeline specific data in, to be read by the pipelines this Game Object uses.
	**/
	var pipelineData : Dynamic;
	/**
		Sets the initial WebGL Pipeline of this Game Object.
		
		This should only be called during the instantiation of the Game Object. After that, use `setPipeline`.
	**/
	function initPipeline(?pipeline:ts.AnyOf2<String, phaser.renderer.webgl.WebGLPipeline>):Bool;
	/**
		Sets the main WebGL Pipeline of this Game Object.
		
		Also sets the `pipelineData` property, if the parameter is given.
	**/
	function setPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.WebGLPipeline>, ?pipelineData:Dynamic, ?copyData:Bool):Graphics;
	/**
		Adds an entry to the `pipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPipelineData(key:String, ?value:Dynamic):Graphics;
	/**
		Resets the WebGL Pipeline of this Game Object back to the default it was created with.
	**/
	function resetPipeline(?resetData:Bool):Bool;
	/**
		Gets the name of the WebGL Pipeline this Game Object is currently using.
	**/
	function getPipelineName():String;
	/**
		Does this Game Object have any Post Pipelines set?
	**/
	var hasPostPipeline : Bool;
	/**
		The WebGL Post FX Pipelines this Game Object uses for post-render effects.
		
		The pipelines are processed in the order in which they appear in this array.
		
		If you modify this array directly, be sure to set the
		`hasPostPipeline` property accordingly.
	**/
	var postPipelines : Array<phaser.renderer.webgl.pipelines.PostFXPipeline>;
	/**
		An object to store pipeline specific data in, to be read by the pipelines this Game Object uses.
	**/
	var postPipelineData : Dynamic;
	/**
		The Pre FX component of this Game Object.
		
		This component allows you to apply a variety of built-in effects to this Game Object, such
		as glow, blur, bloom, displacements, vignettes and more. You access them via this property,
		for example:
		
		```js
		const player = this.add.sprite();
		player.preFX.addBloom();
		```
		
		Only the following Game Objects support Pre FX:
		
		* Image
		* Sprite
		* TileSprite
		* Text
		* RenderTexture
		* Video
		
		All FX are WebGL only and do not have Canvas counterparts.
		
		Please see the FX Class for more details and available methods.
	**/
	var preFX : Null<phaser.gameobjects.components.FX>;
	/**
		The Post FX component of this Game Object.
		
		This component allows you to apply a variety of built-in effects to this Game Object, such
		as glow, blur, bloom, displacements, vignettes and more. You access them via this property,
		for example:
		
		```js
		const player = this.add.sprite();
		player.postFX.addBloom();
		```
		
		All FX are WebGL only and do not have Canvas counterparts.
		
		Please see the FX Class for more details and available methods.
		
		This property is always `null` until the `initPostPipeline` method is called.
	**/
	var postFX : phaser.gameobjects.components.FX;
	/**
		This should only be called during the instantiation of the Game Object.
		
		It is called by default by all core Game Objects and doesn't need
		calling again.
		
		After that, use `setPostPipeline`.
	**/
	function initPostPipeline(?preFX:Bool):Void;
	/**
		Sets one, or more, Post Pipelines on this Game Object.
		
		Post Pipelines are invoked after this Game Object has rendered to its target and
		are commonly used for post-fx.
		
		The post pipelines are appended to the `postPipelines` array belonging to this
		Game Object. When the renderer processes this Game Object, it iterates through the post
		pipelines in the order in which they appear in the array. If you are stacking together
		multiple effects, be aware that the order is important.
		
		If you call this method multiple times, the new pipelines will be appended to any existing
		post pipelines already set. Use the `resetPostPipeline` method to clear them first, if required.
		
		You can optionally also set the `postPipelineData` property, if the parameter is given.
	**/
	function setPostPipeline(pipelines:ts.AnyOf6<String, haxe.Constraints.Function, Array<String>, Array<haxe.Constraints.Function>, phaser.renderer.webgl.pipelines.PostFXPipeline, Array<phaser.renderer.webgl.pipelines.PostFXPipeline>>, ?pipelineData:Dynamic, ?copyData:Bool):Graphics;
	/**
		Adds an entry to the `postPipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPostPipelineData(key:String, ?value:Dynamic):Graphics;
	/**
		Gets a Post Pipeline instance from this Game Object, based on the given name, and returns it.
	**/
	function getPostPipeline(pipeline:ts.AnyOf3<String, haxe.Constraints.Function, phaser.renderer.webgl.pipelines.PostFXPipeline>):ts.AnyOf2<phaser.renderer.webgl.pipelines.PostFXPipeline, Array<phaser.renderer.webgl.pipelines.PostFXPipeline>>;
	/**
		Resets the WebGL Post Pipelines of this Game Object. It does this by calling
		the `destroy` method on each post pipeline and then clearing the local array.
	**/
	function resetPostPipeline(?resetData:Bool):Void;
	/**
		Removes a type of Post Pipeline instances from this Game Object, based on the given name, and destroys them.
		
		If you wish to remove all Post Pipelines use the `resetPostPipeline` method instead.
	**/
	function removePostPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.pipelines.PostFXPipeline>):Graphics;
	/**
		Removes all Pre and Post FX Controllers from this Game Object.
		
		If you wish to remove a single controller, use the `preFX.remove(fx)` or `postFX.remove(fx)` methods instead.
		
		If you wish to clear a single controller, use the `preFX.clear()` or `postFX.clear()` methods instead.
	**/
	function clearFX():Graphics;
	/**
		A property indicating that a Game Object has this component.
	**/
	final hasTransformComponent : Bool;
	/**
		The x position of this Game Object.
	**/
	var x : Float;
	/**
		The y position of this Game Object.
	**/
	var y : Float;
	/**
		The z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#depth} instead.
	**/
	var z : Float;
	/**
		The w position of this Game Object.
	**/
	var w : Float;
	/**
		This is a special setter that allows you to set both the horizontal and vertical scale of this Game Object
		to the same value, at the same time. When reading this value the result returned is `(scaleX + scaleY) / 2`.
		
		Use of this property implies you wish the horizontal and vertical scales to be equal to each other. If this
		isn't the case, use the `scaleX` or `scaleY` properties instead.
	**/
	var scale : Float;
	/**
		The horizontal scale of this Game Object.
	**/
	var scaleX : Float;
	/**
		The vertical scale of this Game Object.
	**/
	var scaleY : Float;
	/**
		The angle of this Game Object as expressed in degrees.
		
		Phaser uses a right-hand clockwise rotation system, where 0 is right, 90 is down, 180/-180 is left
		and -90 is up.
		
		If you prefer to work in radians, see the `rotation` property instead.
	**/
	var angle : Float;
	/**
		The angle of this Game Object in radians.
		
		Phaser uses a right-hand clockwise rotation system, where 0 is right, PI/2 is down, +-PI is left
		and -PI/2 is up.
		
		If you prefer to work in degrees, see the `angle` property instead.
	**/
	var rotation : Float;
	/**
		Sets the position of this Game Object.
	**/
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):Graphics;
	/**
		Copies an object's coordinates to this Game Object's position.
	**/
	function copyPosition(source:ts.AnyOf3<phaser.types.math.Vector2Like, phaser.types.math.Vector3Like, phaser.types.math.Vector4Like>):Graphics;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):Graphics;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):Graphics;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):Graphics;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(?x:Float, ?y:Float):Graphics;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):Graphics;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):Graphics;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):Graphics;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):Graphics;
	/**
		Gets the local transform matrix for this Game Object.
	**/
	function getLocalTransformMatrix(?tempMatrix:phaser.gameobjects.components.TransformMatrix):phaser.gameobjects.components.TransformMatrix;
	/**
		Gets the world transform matrix for this Game Object, factoring in any parent Containers.
	**/
	function getWorldTransformMatrix(?tempMatrix:phaser.gameobjects.components.TransformMatrix, ?parentMatrix:phaser.gameobjects.components.TransformMatrix):phaser.gameobjects.components.TransformMatrix;
	/**
		Takes the given `x` and `y` coordinates and converts them into local space for this
		Game Object, taking into account parent and local transforms, and the Display Origin.
		
		The returned Vector2 contains the translated point in its properties.
		
		A Camera needs to be provided in order to handle modified scroll factors. If no
		camera is specified, it will use the `main` camera from the Scene to which this
		Game Object belongs.
	**/
	function getLocalPoint(x:Float, y:Float, ?point:phaser.math.Vector2, ?camera:phaser.cameras.scene2d.Camera):phaser.math.Vector2;
	/**
		Gets the sum total rotation of all of this Game Objects parent Containers.
		
		The returned value is in radians and will be zero if this Game Object has no parent container.
	**/
	function getParentRotation():Float;
	/**
		The visible state of the Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	var visible : Bool;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):Graphics;
	/**
		The horizontal scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorX : Float;
	/**
		The vertical scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorY : Float;
	/**
		Sets the scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	function setScrollFactor(x:Float, ?y:Float):Graphics;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):Graphics;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):Graphics;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):Graphics;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():Graphics;
	/**
		Allows you to store a key value pair within this Game Objects Data Manager.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		```javascript
		sprite.setData('name', 'Red Gem Stone');
		```
		
		You can also pass in an object of key value pairs as the first argument:
		
		```javascript
		sprite.setData({ name: 'Red Gem Stone', level: 2, owner: 'Link', gold: 50 });
		```
		
		To get a value back again you can call `getData`:
		
		```javascript
		sprite.getData('gold');
		```
		
		Or you can access the value directly via the `values` property, where it works like any other variable:
		
		```javascript
		sprite.data.values.gold += 50;
		```
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
		
		If the key already exists, a `changedata` event is emitted instead, along an event named after the key.
		For example, if you updated an existing key called `PlayerLives` then it would emit the event `changedata-PlayerLives`.
		These events will be emitted regardless if you use this method to set the value, or the direct `values` setter.
		
		Please note that the data keys are case-sensitive and must be valid JavaScript Object property strings.
		This means the keys `gold` and `Gold` are treated as two unique values within the Data Manager.
	**/
	function setData<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):Graphics;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:String, ?amount:Float):Graphics;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:String):Graphics;
	/**
		Pass this Game Object to the Input Manager to enable it for Input.
		
		Input works by using hit areas, these are nearly always geometric shapes, such as rectangles or circles, that act as the hit area
		for the Game Object. However, you can provide your own hit area shape and callback, should you wish to handle some more advanced
		input detection.
		
		If no arguments are provided it will try and create a rectangle hit area based on the texture frame the Game Object is using. If
		this isn't a texture-bound object, such as a Graphics or BitmapText object, this will fail, and you'll need to provide a specific
		shape for it to use.
		
		You can also provide an Input Configuration Object as the only argument to this method.
	**/
	function setInteractive(?hitArea:Dynamic, ?callback:phaser.types.input.HitAreaCallback, ?dropZone:Bool):Graphics;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():Graphics;
	/**
		If this Game Object has previously been enabled for input, this will queue it
		for removal, causing it to no longer be interactive. The removal happens on
		the next game step, it is not immediate.
		
		The Interactive Object that was assigned to this Game Object will be destroyed,
		removed from the Input Manager and cleared from this Game Object.
		
		If you wish to re-enable this Game Object at a later date you will need to
		re-create its InteractiveObject by calling `setInteractive` again.
		
		If you wish to only temporarily stop an object from receiving input then use
		`disableInteractive` instead, as that toggles the interactive state, where-as
		this erases it completely.
		
		If you wish to resize a hit area, don't remove and then set it as being
		interactive. Instead, access the hitarea object directly and resize the shape
		being used. I.e.: `sprite.input.hitArea.setSize(width, height)` (assuming the
		shape is a Rectangle, which it is by default.)
	**/
	function removeInteractive():Graphics;
	/**
		Adds this Game Object to the given Display List.
		
		If no Display List is specified, it will default to the Display List owned by the Scene to which
		this Game Object belongs.
		
		A Game Object can only exist on one Display List at any given time, but may move freely between them.
		
		If this Game Object is already on another Display List when this method is called, it will first
		be removed from it, before being added to the new list.
		
		You can query which list it is on by looking at the `Phaser.GameObjects.GameObject#displayList` property.
		
		If a Game Object isn't on any display list, it will not be rendered. If you just wish to temporarly
		disable it from rendering, consider using the `setVisible` method, instead.
	**/
	function addToDisplayList(?displayList:ts.AnyOf2<Layer, DisplayList>):Graphics;
	/**
		Adds this Game Object to the Update List belonging to the Scene.
		
		When a Game Object is added to the Update List it will have its `preUpdate` method called
		every game frame. This method is passed two parameters: `delta` and `time`.
		
		If you wish to run your own logic within `preUpdate` then you should always call
		`super.preUpdate(delta, time)` within it, or it may fail to process required operations,
		such as Sprite animations.
	**/
	function addToUpdateList():Graphics;
	/**
		Removes this Game Object from the Display List it is currently on.
		
		A Game Object can only exist on one Display List at any given time, but may move freely removed
		and added back at a later stage.
		
		You can query which list it is on by looking at the `Phaser.GameObjects.GameObject#displayList` property.
		
		If a Game Object isn't on any Display List, it will not be rendered. If you just wish to temporarly
		disable it from rendering, consider using the `setVisible` method, instead.
	**/
	function removeFromDisplayList():Graphics;
	/**
		Removes this Game Object from the Scene's Update List.
		
		When a Game Object is on the Update List, it will have its `preUpdate` method called
		every game frame. Calling this method will remove it from the list, preventing this.
		
		Removing a Game Object from the Update List will stop most internal functions working.
		For example, removing a Sprite from the Update List will prevent it from being able to
		run animations.
	**/
	function removeFromUpdateList():Graphics;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Graphics;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Graphics;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Graphics;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Graphics;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Graphics;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Graphics;
	static var prototype : Graphics;
	/**
		A Camera used specifically by the Graphics system for rendering to textures.
	**/
	static var TargetCamera : phaser.cameras.scene2d.Camera;
}