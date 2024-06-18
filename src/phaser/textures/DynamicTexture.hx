package phaser.textures;

/**
	A Dynamic Texture is a special texture that allows you to draw textures, frames and most kind of
	Game Objects directly to it.
	
	You can take many complex objects and draw them to this one texture, which can then be used as the
	base texture for other Game Objects, such as Sprites. Should you then update this texture, all
	Game Objects using it will instantly be updated as well, reflecting the changes immediately.
	
	It's a powerful way to generate dynamic textures at run-time that are WebGL friendly and don't invoke
	expensive GPU uploads on each change.
	
	```js
	const t = this.textures.addDynamicTexture('player', 64, 128);
	// draw objects to t
	this.add.sprite(x, y, 'player');
	```
	
	Because this is a standard Texture within Phaser, you can add frames to it, meaning you can use it
	to generate sprite sheets, texture atlases or tile sets.
	
	Under WebGL1, a FrameBuffer, which is what this Dynamic Texture uses internally, cannot be anti-aliased.
	This means that when drawing objects such as Shapes or Graphics instances to this texture, they may appear
	to be drawn with no aliasing around the edges. This is a technical limitation of WebGL1. To get around it,
	create your shape as a texture in an art package, then draw that to this texture.
	
	Based on the assumption that you will be using this Dynamic Texture as a source for Sprites, it will
	automatically invert any drawing done to it on the y axis. If you do not require this, please call the
	`setIsSpriteTexture()` method and pass it `false` as its parameter. Do this before you start drawing
	to this texture, otherwise you will get vertically inverted frames under WebGL. This isn't required
	for Canvas.
**/
@:native("Phaser.Textures.DynamicTexture") extern class DynamicTexture extends Texture {
	function new(manager:TextureManager, key:String, ?width:Float, ?height:Float);
	/**
		The internal data type of this object.
	**/
	final type : String;
	/**
		A reference to either the Canvas or WebGL Renderer that the Game instance is using.
	**/
	var renderer : ts.AnyOf2<phaser.renderer.canvas.CanvasRenderer, phaser.renderer.webgl.WebGLRenderer>;
	/**
		The width of this Dynamic Texture.
		
		Treat this property as read-only. Use the `setSize` method to change the size.
	**/
	var width : Float;
	/**
		The height of this Dynamic Texture.
		
		Treat this property as read-only. Use the `setSize` method to change the size.
	**/
	var height : Float;
	/**
		This flag is set to 'true' during `beginDraw` and reset to 'false` in `endDraw`,
		allowing you to determine if this Dynamic Texture is batch drawing, or not.
	**/
	final isDrawing : Bool;
	/**
		A reference to the Rendering Context belonging to the Canvas Element this Dynamic Texture is drawing to.
	**/
	var canvas : js.html.CanvasElement;
	/**
		The 2D Canvas Rendering Context.
	**/
	final context : js.html.CanvasRenderingContext2D;
	/**
		Is this Dynamic Texture dirty or not? If not it won't spend time clearing or filling itself.
	**/
	var dirty : Bool;
	/**
		Is this Dynamic Texture being used as the base texture for a Sprite Game Object?
		
		This is enabled by default, as we expect that will be the core use for Dynamic Textures.
		
		However, to disable it, call `RenderTexture.setIsSpriteTexture(false)`.
		
		You should do this _before_ drawing to this texture, so that it correctly
		inverses the frames for WebGL rendering. Not doing so will result in vertically flipped frames.
		
		This property is used in the `endDraw` method.
	**/
	var isSpriteTexture : Bool;
	/**
		An internal Camera that can be used to move around this Dynamic Texture.
		
		Control it just like you would any Scene Camera. The difference is that it only impacts
		the placement of **Game Objects** (not textures) that you then draw to this texture.
		
		You can scroll, zoom and rotate this Camera.
	**/
	var camera : phaser.cameras.scene2d.BaseCamera;
	/**
		The Render Target that belongs to this Dynamic Texture.
		
		A Render Target encapsulates a framebuffer and texture for the WebGL Renderer.
		
		This property remains `null` under Canvas.
	**/
	var renderTarget : phaser.renderer.webgl.RenderTarget;
	/**
		A reference to the WebGL Single Pipeline.
		
		This property remains `null` under Canvas.
	**/
	var pipeline : phaser.renderer.webgl.pipelines.SinglePipeline;
	/**
		Resizes this Dynamic Texture to the new dimensions given.
		
		In WebGL it will destroy and then re-create the frame buffer being used by this Dynamic Texture.
		In Canvas it will resize the underlying canvas DOM element.
		
		Both approaches will erase everything currently drawn to this texture.
		
		If the dimensions given are the same as those already being used, calling this method will do nothing.
	**/
	function setSize(width:Float, ?height:Float):DynamicTexture;
	/**
		Links the WebGL Textures used by this Dynamic Texture to its Render Target.
		
		This method is called internally by the Dynamic Texture when it is first created,
		or if you change its size.
	**/
	function setFromRenderTarget():DynamicTexture;
	/**
		If you are planning on using this Render Texture as a base texture for Sprite
		Game Objects, then you should call this method with a value of `true` before
		drawing anything to it, otherwise you will get inverted frames in WebGL.
	**/
	function setIsSpriteTexture(value:Bool):DynamicTexture;
	/**
		Fills this Dynamic Texture with the given color.
		
		By default it will fill the entire texture, however you can set it to fill a specific
		rectangular area by using the x, y, width and height arguments.
		
		The color should be given in hex format, i.e. 0xff0000 for red, 0x00ff00 for green, etc.
	**/
	function fill(rgb:Float, ?alpha:Float, ?x:Float, ?y:Float, ?width:Float, ?height:Float):DynamicTexture;
	/**
		Fully clears this Dynamic Texture, erasing everything from it and resetting it back to
		a blank, transparent, texture.
	**/
	function clear():DynamicTexture;
	/**
		Takes the given texture key and frame and then stamps it at the given
		x and y coordinates. You can use the optional 'config' argument to provide
		lots more options about how the stamp is applied, including the alpha,
		tint, angle, scale and origin.
		
		By default, the frame will stamp on the x/y coordinates based on its center.
		
		If you wish to stamp from the top-left, set the config `originX` and
		`originY` properties both to zero.
	**/
	function stamp(key:String, ?frame:ts.AnyOf2<String, Float>, ?x:Float, ?y:Float, ?config:phaser.types.textures.StampConfig):DynamicTexture;
	/**
		Draws the given object, or an array of objects, to this Dynamic Texture using a blend mode of ERASE.
		This has the effect of erasing any filled pixels present in the objects from this texture.
		
		It can accept any of the following:
		
		* Any renderable Game Object, such as a Sprite, Text, Graphics or TileSprite.
		* Tilemap Layers.
		* A Group. The contents of which will be iterated and drawn in turn.
		* A Container. The contents of which will be iterated fully, and drawn in turn.
		* A Scene Display List. Pass in `Scene.children` to draw the whole list.
		* Another Dynamic Texture, or a Render Texture.
		* A Texture Frame instance.
		* A string. This is used to look-up the texture from the Texture Manager.
		
		Note: You cannot erase a Dynamic Texture from itself.
		
		If passing in a Group or Container it will only draw children that return `true`
		when their `willRender()` method is called. I.e. a Container with 10 children,
		5 of which have `visible=false` will only draw the 5 visible ones.
		
		If passing in an array of Game Objects it will draw them all, regardless if
		they pass a `willRender` check or not.
		
		You can pass in a string in which case it will look for a texture in the Texture
		Manager matching that string, and draw the base frame.
		
		You can pass in the `x` and `y` coordinates to draw the objects at. The use of
		the coordinates differ based on what objects are being drawn. If the object is
		a Group, Container or Display List, the coordinates are _added_ to the positions
		of the children. For all other types of object, the coordinates are exact.
		
		Calling this method causes the WebGL batch to flush, so it can write the texture
		data to the framebuffer being used internally. The batch is flushed at the end,
		after the entries have been iterated. So if you've a bunch of objects to draw,
		try and pass them in an array in one single call, rather than making lots of
		separate calls.
		
		If you are not planning on using this Dynamic Texture as a base texture for Sprite
		Game Objects, then you should set `DynamicTexture.isSpriteTexture = false` before
		calling this method, otherwise you will get vertically inverted frames in WebGL.
	**/
	function erase(entries:Dynamic, ?x:Float, ?y:Float):DynamicTexture;
	/**
		Draws the given object, or an array of objects, to this Dynamic Texture.
		
		It can accept any of the following:
		
		* Any renderable Game Object, such as a Sprite, Text, Graphics or TileSprite.
		* Tilemap Layers.
		* A Group. The contents of which will be iterated and drawn in turn.
		* A Container. The contents of which will be iterated fully, and drawn in turn.
		* A Scene Display List. Pass in `Scene.children` to draw the whole list.
		* Another Dynamic Texture, or a Render Texture.
		* A Texture Frame instance.
		* A string. This is used to look-up the texture from the Texture Manager.
		
		Note 1: You cannot draw a Dynamic Texture to itself.
		
		Note 2: For Game Objects that have Post FX Pipelines, the pipeline _cannot_ be
		used when drawn to this texture.
		
		If passing in a Group or Container it will only draw children that return `true`
		when their `willRender()` method is called. I.e. a Container with 10 children,
		5 of which have `visible=false` will only draw the 5 visible ones.
		
		If passing in an array of Game Objects it will draw them all, regardless if
		they pass a `willRender` check or not.
		
		You can pass in a string in which case it will look for a texture in the Texture
		Manager matching that string, and draw the base frame. If you need to specify
		exactly which frame to draw then use the method `drawFrame` instead.
		
		You can pass in the `x` and `y` coordinates to draw the objects at. The use of
		the coordinates differ based on what objects are being drawn. If the object is
		a Group, Container or Display List, the coordinates are _added_ to the positions
		of the children. For all other types of object, the coordinates are exact.
		
		The `alpha` and `tint` values are only used by Texture Frames.
		Game Objects use their own alpha and tint values when being drawn.
		
		Calling this method causes the WebGL batch to flush, so it can write the texture
		data to the framebuffer being used internally. The batch is flushed at the end,
		after the entries have been iterated. So if you've a bunch of objects to draw,
		try and pass them in an array in one single call, rather than making lots of
		separate calls.
		
		If you are not planning on using this Dynamic Texture as a base texture for Sprite
		Game Objects, then you should set `DynamicTexture.isSpriteTexture = false` before
		calling this method, otherwise you will get vertically inverted frames in WebGL.
	**/
	function draw(entries:Dynamic, ?x:Float, ?y:Float, ?alpha:Float, ?tint:Float):DynamicTexture;
	/**
		Draws the Texture Frame to the Render Texture at the given position.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
		
		```javascript
		var rt = this.add.renderTexture(0, 0, 800, 600);
		rt.drawFrame(key, frame);
		```
		
		You can optionally provide a position, alpha and tint value to apply to the frame
		before it is drawn.
		
		Calling this method will cause a batch flush, so if you've got a stack of things to draw
		in a tight loop, try using the `draw` method instead.
		
		If you need to draw a Sprite to this Render Texture, use the `draw` method instead.
		
		If you are not planning on using this Dynamic Texture as a base texture for Sprite
		Game Objects, then you should set `DynamicTexture.isSpriteTexture = false` before
		calling this method, otherwise you will get vertically inverted frames in WebGL.
	**/
	function drawFrame(key:String, ?frame:ts.AnyOf2<String, Float>, ?x:Float, ?y:Float, ?alpha:Float, ?tint:Float):DynamicTexture;
	/**
		Takes the given Texture Frame and draws it to this Dynamic Texture as a fill pattern,
		i.e. in a grid-layout based on the frame dimensions.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
		
		You can optionally provide a position, width, height, alpha and tint value to apply to
		the frames before they are drawn. The position controls the top-left where the repeating
		fill will start from. The width and height control the size of the filled area.
		
		The position can be negative if required, but the dimensions cannot.
		
		Calling this method will cause a batch flush by default. Use the `skipBatch` argument
		to disable this if this call is part of a larger batch draw.
		
		If you are not planning on using this Dynamic Texture as a base texture for Sprite
		Game Objects, then you should set `DynamicTexture.isSpriteTexture = false` before
		calling this method, otherwise you will get vertically inverted frames in WebGL.
	**/
	function repeat(key:String, ?frame:ts.AnyOf2<String, Float>, ?x:Float, ?y:Float, ?width:Float, ?height:Float, ?alpha:Float, ?tint:Float, ?skipBatch:Bool):DynamicTexture;
	/**
		Use this method if you need to batch draw a large number of Game Objects to
		this Dynamic Texture in a single pass, or on a frequent basis. This is especially
		useful under WebGL, however, if your game is using Canvas only, it will not make
		any speed difference in that situation.
		
		This method starts the beginning of a batched draw, unless one is already open.
		
		Batched drawing is faster than calling `draw` in loop, but you must be careful
		to manage the flow of code and remember to call `endDraw()` when you're finished.
		
		If you don't need to draw large numbers of objects it's much safer and easier
		to use the `draw` method instead.
		
		The flow should be:
		
		```javascript
		// Call once:
		DynamicTexture.beginDraw();
		
		// repeat n times:
		DynamicTexture.batchDraw();
		// or
		DynamicTexture.batchDrawFrame();
		
		// Call once:
		DynamicTexture.endDraw();
		```
		
		Do not call any methods other than `batchDraw`, `batchDrawFrame`, or `endDraw` once you
		have started a batch. Also, be very careful not to destroy this Dynamic Texture while the
		batch is still open. Doing so will cause a run-time error in the WebGL Renderer.
		
		You can use the `DynamicTexture.isDrawing` boolean property to tell if a batch is
		currently open, or not.
	**/
	function beginDraw():DynamicTexture;
	/**
		Use this method if you have already called `beginDraw` and need to batch
		draw a large number of objects to this Dynamic Texture.
		
		This method batches the drawing of the given objects to this texture,
		without causing a WebGL bind or batch flush for each one.
		
		It is faster than calling `draw`, but you must be careful to manage the
		flow of code and remember to call `endDraw()`. If you don't need to draw large
		numbers of objects it's much safer and easier to use the `draw` method instead.
		
		The flow should be:
		
		```javascript
		// Call once:
		DynamicTexture.beginDraw();
		
		// repeat n times:
		DynamicTexture.batchDraw();
		// or
		DynamicTexture.batchDrawFrame();
		
		// Call once:
		DynamicTexture.endDraw();
		```
		
		Do not call any methods other than `batchDraw`, `batchDrawFrame`, or `endDraw` once you
		have started a batch. Also, be very careful not to destroy this Dynamic Texture while the
		batch is still open. Doing so will cause a run-time error in the WebGL Renderer.
		
		You can use the `DynamicTexture.isDrawing` boolean property to tell if a batch is
		currently open, or not.
		
		This method can accept any of the following:
		
		* Any renderable Game Object, such as a Sprite, Text, Graphics or TileSprite.
		* Tilemap Layers.
		* A Group. The contents of which will be iterated and drawn in turn.
		* A Container. The contents of which will be iterated fully, and drawn in turn.
		* A Scene's Display List. Pass in `Scene.children` to draw the whole list.
		* Another Dynamic Texture or Render Texture.
		* A Texture Frame instance.
		* A string. This is used to look-up a texture from the Texture Manager.
		
		Note: You cannot draw a Dynamic Texture to itself.
		
		If passing in a Group or Container it will only draw children that return `true`
		when their `willRender()` method is called. I.e. a Container with 10 children,
		5 of which have `visible=false` will only draw the 5 visible ones.
		
		If passing in an array of Game Objects it will draw them all, regardless if
		they pass a `willRender` check or not.
		
		You can pass in a string in which case it will look for a texture in the Texture
		Manager matching that string, and draw the base frame. If you need to specify
		exactly which frame to draw then use the method `drawFrame` instead.
		
		You can pass in the `x` and `y` coordinates to draw the objects at. The use of
		the coordinates differ based on what objects are being drawn. If the object is
		a Group, Container or Display List, the coordinates are _added_ to the positions
		of the children. For all other types of object, the coordinates are exact.
		
		The `alpha` and `tint` values are only used by Texture Frames.
		Game Objects use their own alpha and tint values when being drawn.
	**/
	function batchDraw(entries:Dynamic, ?x:Float, ?y:Float, ?alpha:Float, ?tint:Float):DynamicTexture;
	/**
		Use this method if you have already called `beginDraw` and need to batch
		draw a large number of texture frames to this Dynamic Texture.
		
		This method batches the drawing of the given frames to this Dynamic Texture,
		without causing a WebGL bind or batch flush for each one.
		
		It is faster than calling `drawFrame`, but you must be careful to manage the
		flow of code and remember to call `endDraw()`. If you don't need to draw large
		numbers of frames it's much safer and easier to use the `drawFrame` method instead.
		
		The flow should be:
		
		```javascript
		// Call once:
		DynamicTexture.beginDraw();
		
		// repeat n times:
		DynamicTexture.batchDraw();
		// or
		DynamicTexture.batchDrawFrame();
		
		// Call once:
		DynamicTexture.endDraw();
		```
		
		Do not call any methods other than `batchDraw`, `batchDrawFrame`, or `endDraw` once you
		have started a batch. Also, be very careful not to destroy this Dynamic Texture while the
		batch is still open. Doing so will cause a run-time error in the WebGL Renderer.
		
		You can use the `DynamicTexture.isDrawing` boolean property to tell if a batch is
		currently open, or not.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
		
		You can optionally provide a position, alpha and tint value to apply to the frame
		before it is drawn.
	**/
	function batchDrawFrame(key:String, ?frame:ts.AnyOf2<String, Float>, ?x:Float, ?y:Float, ?alpha:Float, ?tint:Float):DynamicTexture;
	/**
		Use this method to finish batch drawing to this Dynamic Texture.
		
		Doing so will stop the WebGL Renderer from capturing draws and then blit the
		framebuffer to the Render Target owned by this texture.
		
		Calling this method without first calling `beginDraw` will have no effect.
		
		Batch drawing is faster than calling `draw`, but you must be careful to manage the
		flow of code and remember to call `endDraw()` when you're finished.
		
		If you don't need to draw large numbers of objects it's much safer and easier
		to use the `draw` method instead.
		
		The flow should be:
		
		```javascript
		// Call once:
		DynamicTexture.beginDraw();
		
		// repeat n times:
		DynamicTexture.batchDraw();
		// or
		DynamicTexture.batchDrawFrame();
		
		// Call once:
		DynamicTexture.endDraw();
		```
		
		Do not call any methods other than `batchDraw`, `batchDrawFrame`, or `endDraw` once you
		have started a batch. Also, be very careful not to destroy this Dynamic Texture while the
		batch is still open. Doing so will cause a run-time error in the WebGL Renderer.
		
		You can use the `DynamicTexture.isDrawing` boolean property to tell if a batch is
		currently open, or not.
	**/
	function endDraw(?erase:Bool):DynamicTexture;
	/**
		Takes a snapshot of the given area of this Dynamic Texture.
		
		The snapshot is taken immediately, but the results are returned via the given callback.
		
		To capture the whole Dynamic Texture see the `snapshot` method.
		To capture just a specific pixel, see the `snapshotPixel` method.
		
		Snapshots work by using the WebGL `readPixels` feature to grab every pixel from the frame buffer
		into an ArrayBufferView. It then parses this, copying the contents to a temporary Canvas and finally
		creating an Image object from it, which is the image returned to the callback provided.
		
		All in all, this is a computationally expensive and blocking process, which gets more expensive
		the larger the resolution this Dynamic Texture has, so please be careful how you employ this in your game.
	**/
	function snapshotArea(x:Float, y:Float, width:Float, height:Float, callback:phaser.types.renderer.snapshot.SnapshotCallback, ?type:String, ?encoderOptions:Float):DynamicTexture;
	/**
		Takes a snapshot of the whole of this Dynamic Texture.
		
		The snapshot is taken immediately, but the results are returned via the given callback.
		
		To capture a portion of this Dynamic Texture see the `snapshotArea` method.
		To capture just a specific pixel, see the `snapshotPixel` method.
		
		Snapshots work by using the WebGL `readPixels` feature to grab every pixel from the frame buffer
		into an ArrayBufferView. It then parses this, copying the contents to a temporary Canvas and finally
		creating an Image object from it, which is the image returned to the callback provided.
		
		All in all, this is a computationally expensive and blocking process, which gets more expensive
		the larger the resolution this Dynamic Texture has, so please be careful how you employ this in your game.
	**/
	function snapshot(callback:phaser.types.renderer.snapshot.SnapshotCallback, ?type:String, ?encoderOptions:Float):DynamicTexture;
	/**
		Takes a snapshot of the given pixel from this Dynamic Texture.
		
		The snapshot is taken immediately, but the results are returned via the given callback.
		
		To capture the whole Dynamic Texture see the `snapshot` method.
		To capture a portion of this Dynamic Texture see the `snapshotArea` method.
		
		Unlike the two other snapshot methods, this one will send your callback a `Color` object
		containing the color data for the requested pixel. It doesn't need to create an internal
		Canvas or Image object, so is a lot faster to execute, using less memory than the other snapshot methods.
	**/
	function snapshotPixel(x:Float, y:Float, callback:phaser.types.renderer.snapshot.SnapshotCallback):DynamicTexture;
	/**
		Returns the underlying WebGLTextureWrapper, if not running in Canvas mode.
	**/
	function getWebGLTexture():Null<phaser.renderer.webgl.wrappers.WebGLTextureWrapper>;
	/**
		Renders this Dynamic Texture onto the Stamp Game Object as a BitmapMask.
	**/
	function renderWebGL(renderer:phaser.renderer.webgl.WebGLRenderer, src:phaser.gameobjects.Image, camera:phaser.cameras.scene2d.Camera, parentMatrix:phaser.gameobjects.components.TransformMatrix):Void;
	/**
		This is a NOOP method. Bitmap Masks are not supported by the Canvas Renderer.
	**/
	function renderCanvas(renderer:ts.AnyOf2<phaser.renderer.canvas.CanvasRenderer, phaser.renderer.webgl.WebGLRenderer>, mask:phaser.gameobjects.GameObject, camera:phaser.cameras.scene2d.Camera):Void;
	static var prototype : DynamicTexture;
}