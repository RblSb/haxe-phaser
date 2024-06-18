package phaser.gameobjects;

/**
	A Render Texture is a combination of Dynamic Texture and an Image Game Object, that uses the
	Dynamic Texture to display itself with.
	
	A Dynamic Texture is a special texture that allows you to draw textures, frames and most kind of
	Game Objects directly to it.
	
	You can take many complex objects and draw them to this one texture, which can then be used as the
	base texture for other Game Objects, such as Sprites. Should you then update this texture, all
	Game Objects using it will instantly be updated as well, reflecting the changes immediately.
	
	It's a powerful way to generate dynamic textures at run-time that are WebGL friendly and don't invoke
	expensive GPU uploads on each change.
	
	In versions of Phaser before 3.60 a Render Texture was the only way you could create a texture
	like this, that had the ability to be drawn on. But in 3.60 we split the core functions out to
	the Dynamic Texture class as it made a lot more sense for them to reside in there. As a result,
	the Render Texture is now a light-weight shim that sits on-top of an Image Game Object and offers
	proxy methods to the features available from a Dynamic Texture.
	
	**When should you use a Render Texture vs. a Dynamic Texture?**
	
	You should use a Dynamic Texture if the texture is going to be used by multiple Game Objects,
	or you want to use it across multiple Scenes, because textures are globally stored.
	
	You should use a Dynamic Texture if the texture isn't going to be displayed in-game, but is
	instead going to be used for something like a mask or shader.
	
	You should use a Render Texture if you need to display the texture in-game on a single Game Object,
	as it provides the convenience of wrapping an Image and Dynamic Texture together for you.
	
	Under WebGL1, a FrameBuffer, which is what this Dynamic Texture uses internally, cannot be anti-aliased.
	This means that when drawing objects such as Shapes or Graphics instances to this texture, they may appear
	to be drawn with no aliasing around the edges. This is a technical limitation of WebGL1. To get around it,
	create your shape as a texture in an art package, then draw that to this texture.
**/
@:native("Phaser.GameObjects.RenderTexture") extern class RenderTexture extends Image {
	function new(scene:phaser.Scene, ?x:Float, ?y:Float, ?width:Float, ?height:Float);
	/**
		An internal Camera that can be used to move around this Render Texture.
		
		Control it just like you would any Scene Camera. The difference is that it only impacts
		the placement of Game Objects that you then draw to this texture.
		
		You can scroll, zoom and rotate this Camera.
		
		This property is a reference to `RenderTexture.texture.camera`.
	**/
	var camera : phaser.cameras.scene2d.BaseCamera;
	/**
		Sets the internal size of this Render Texture, as used for frame or physics body creation.
		
		This will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or call the
		`setDisplaySize` method, which is the same thing as changing the scale but allows you
		to do so by giving pixel values.
		
		If you have enabled this Game Object for input, changing the size will _not_ change the
		size of the hit area. To do this you should adjust the `input.hitArea` object directly.
	**/
	function setSize(width:Float, height:Float):RenderTexture;
	/**
		Resizes the Render Texture to the new dimensions given.
		
		In WebGL it will destroy and then re-create the frame buffer being used by the Render Texture.
		In Canvas it will resize the underlying canvas element.
		
		Both approaches will erase everything currently drawn to the Render Texture.
		
		If the dimensions given are the same as those already being used, calling this method will do nothing.
	**/
	function resize(width:Float, ?height:Float):RenderTexture;
	/**
		Stores a copy of this Render Texture in the Texture Manager using the given key.
		
		After doing this, any texture based Game Object, such as a Sprite, can use the contents of this
		Render Texture by using the texture key:
		
		```javascript
		var rt = this.add.renderTexture(0, 0, 128, 128);
		
		// Draw something to the Render Texture
		
		rt.saveTexture('doodle');
		
		this.add.image(400, 300, 'doodle');
		```
		
		Updating the contents of this Render Texture will automatically update _any_ Game Object
		that is using it as a texture. Calling `saveTexture` again will not save another copy
		of the same texture, it will just rename the key of the existing copy.
		
		By default it will create a single base texture. You can add frames to the texture
		by using the `Texture.add` method. After doing this, you can then allow Game Objects
		to use a specific frame from a Render Texture.
		
		If you destroy this Render Texture, any Game Object using it via the Texture Manager will
		stop rendering. Ensure you remove the texture from the Texture Manager and any Game Objects
		using it first, before destroying this Render Texture.
	**/
	function saveTexture(key:String):phaser.textures.DynamicTexture;
	/**
		Fills this Render Texture with the given color.
		
		By default it will fill the entire texture, however you can set it to fill a specific
		rectangular area by using the x, y, width and height arguments.
		
		The color should be given in hex format, i.e. 0xff0000 for red, 0x00ff00 for green, etc.
	**/
	function fill(rgb:Float, ?alpha:Float, ?x:Float, ?y:Float, ?width:Float, ?height:Float):RenderTexture;
	/**
		Fully clears this Render Texture, erasing everything from it and resetting it back to
		a blank, transparent, texture.
	**/
	function clear():RenderTexture;
	/**
		Takes the given texture key and frame and then stamps it at the given
		x and y coordinates. You can use the optional 'config' argument to provide
		lots more options about how the stamp is applied, including the alpha,
		tint, angle, scale and origin.
		
		By default, the frame will stamp on the x/y coordinates based on its center.
		
		If you wish to stamp from the top-left, set the config `originX` and
		`originY` properties both to zero.
	**/
	function stamp(key:String, ?frame:ts.AnyOf2<String, Float>, ?x:Float, ?y:Float, ?config:phaser.types.textures.StampConfig):RenderTexture;
	/**
		Draws the given object, or an array of objects, to this Render Texture using a blend mode of ERASE.
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
		
		Note: You cannot erase a Render Texture from itself.
		
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
	**/
	function erase(entries:Dynamic, ?x:Float, ?y:Float):RenderTexture;
	/**
		Draws the given object, or an array of objects, to this Render Texture.
		
		It can accept any of the following:
		
		* Any renderable Game Object, such as a Sprite, Text, Graphics or TileSprite.
		* Tilemap Layers.
		* A Group. The contents of which will be iterated and drawn in turn.
		* A Container. The contents of which will be iterated fully, and drawn in turn.
		* A Scene Display List. Pass in `Scene.children` to draw the whole list.
		* Another Dynamic Texture, or a Render Texture.
		* A Texture Frame instance.
		* A string. This is used to look-up the texture from the Texture Manager.
		
		Note 1: You cannot draw a Render Texture to itself.
		
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
	**/
	function draw(entries:Dynamic, ?x:Float, ?y:Float, ?alpha:Float, ?tint:Float):RenderTexture;
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
	**/
	function drawFrame(key:String, ?frame:ts.AnyOf2<String, Float>, ?x:Float, ?y:Float, ?alpha:Float, ?tint:Float):RenderTexture;
	/**
		Takes the given Texture Frame and draws it to this Render Texture as a fill pattern,
		i.e. in a grid-layout based on the frame dimensions.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
		
		You can optionally provide a position, width, height, alpha and tint value to apply to
		the frames before they are drawn. The position controls the top-left where the repeating
		fill will start from. The width and height control the size of the filled area.
		
		The position can be negative if required, but the dimensions cannot.
		
		Calling this method will cause a batch flush by default. Use the `skipBatch` argument
		to disable this if this call is part of a larger batch draw.
	**/
	function repeat(key:String, ?frame:ts.AnyOf2<String, Float>, ?x:Float, ?y:Float, ?width:Float, ?height:Float, ?alpha:Float, ?tint:Float, ?skipBatch:Bool):RenderTexture;
	/**
		Use this method if you need to batch draw a large number of Game Objects to
		this Render Texture in a single pass, or on a frequent basis. This is especially
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
		RenderTexture.beginDraw();
		
		// repeat n times:
		RenderTexture.batchDraw();
		// or
		RenderTexture.batchDrawFrame();
		
		// Call once:
		RenderTexture.endDraw();
		```
		
		Do not call any methods other than `batchDraw`, `batchDrawFrame`, or `endDraw` once you
		have started a batch. Also, be very careful not to destroy this Render Texture while the
		batch is still open. Doing so will cause a run-time error in the WebGL Renderer.
		
		You can use the `RenderTexture.texture.isDrawing` boolean property to tell if a batch is
		currently open, or not.
	**/
	function beginDraw():RenderTexture;
	/**
		Use this method if you have already called `beginDraw` and need to batch
		draw a large number of objects to this Render Texture.
		
		This method batches the drawing of the given objects to this texture,
		without causing a WebGL bind or batch flush for each one.
		
		It is faster than calling `draw`, but you must be careful to manage the
		flow of code and remember to call `endDraw()`. If you don't need to draw large
		numbers of objects it's much safer and easier to use the `draw` method instead.
		
		The flow should be:
		
		```javascript
		// Call once:
		RenderTexture.beginDraw();
		
		// repeat n times:
		RenderTexture.batchDraw();
		// or
		RenderTexture.batchDrawFrame();
		
		// Call once:
		RenderTexture.endDraw();
		```
		
		Do not call any methods other than `batchDraw`, `batchDrawFrame`, or `endDraw` once you
		have started a batch. Also, be very careful not to destroy this Render Texture while the
		batch is still open. Doing so will cause a run-time error in the WebGL Renderer.
		
		You can use the `RenderTexture.texture.isDrawing` boolean property to tell if a batch is
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
		
		Note: You cannot draw a Render Texture to itself.
		
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
	function batchDraw(entries:Dynamic, ?x:Float, ?y:Float, ?alpha:Float, ?tint:Float):RenderTexture;
	/**
		Use this method if you have already called `beginDraw` and need to batch
		draw a large number of texture frames to this Render Texture.
		
		This method batches the drawing of the given frames to this Render Texture,
		without causing a WebGL bind or batch flush for each one.
		
		It is faster than calling `drawFrame`, but you must be careful to manage the
		flow of code and remember to call `endDraw()`. If you don't need to draw large
		numbers of frames it's much safer and easier to use the `drawFrame` method instead.
		
		The flow should be:
		
		```javascript
		// Call once:
		RenderTexture.beginDraw();
		
		// repeat n times:
		RenderTexture.batchDraw();
		// or
		RenderTexture.batchDrawFrame();
		
		// Call once:
		RenderTexture.endDraw();
		```
		
		Do not call any methods other than `batchDraw`, `batchDrawFrame`, or `endDraw` once you
		have started a batch. Also, be very careful not to destroy this Render Texture while the
		batch is still open. Doing so will cause a run-time error in the WebGL Renderer.
		
		You can use the `RenderTexture.texture.isDrawing` boolean property to tell if a batch is
		currently open, or not.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
		
		You can optionally provide a position, alpha and tint value to apply to the frame
		before it is drawn.
	**/
	function batchDrawFrame(key:String, ?frame:ts.AnyOf2<String, Float>, ?x:Float, ?y:Float, ?alpha:Float, ?tint:Float):RenderTexture;
	/**
		Use this method to finish batch drawing to this Render Texture.
		
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
		RenderTexture.beginDraw();
		
		// repeat n times:
		RenderTexture.batchDraw();
		// or
		RenderTexture.batchDrawFrame();
		
		// Call once:
		RenderTexture.endDraw();
		```
		
		Do not call any methods other than `batchDraw`, `batchDrawFrame`, or `endDraw` once you
		have started a batch. Also, be very careful not to destroy this Render Texture while the
		batch is still open. Doing so will cause a run-time error in the WebGL Renderer.
		
		You can use the `RenderTexture.texture.isDrawing` boolean property to tell if a batch is
		currently open, or not.
	**/
	function endDraw(?erase:Bool):RenderTexture;
	/**
		Takes a snapshot of the given area of this Render Texture.
		
		The snapshot is taken immediately, but the results are returned via the given callback.
		
		To capture the whole Render Texture see the `snapshot` method.
		To capture just a specific pixel, see the `snapshotPixel` method.
		
		Snapshots work by using the WebGL `readPixels` feature to grab every pixel from the frame buffer
		into an ArrayBufferView. It then parses this, copying the contents to a temporary Canvas and finally
		creating an Image object from it, which is the image returned to the callback provided.
		
		All in all, this is a computationally expensive and blocking process, which gets more expensive
		the larger the resolution this Render Texture has, so please be careful how you employ this in your game.
	**/
	function snapshotArea(x:Float, y:Float, width:Float, height:Float, callback:phaser.types.renderer.snapshot.SnapshotCallback, ?type:String, ?encoderOptions:Float):RenderTexture;
	/**
		Takes a snapshot of the whole of this Render Texture.
		
		The snapshot is taken immediately, but the results are returned via the given callback.
		
		To capture a portion of this Render Texture see the `snapshotArea` method.
		To capture just a specific pixel, see the `snapshotPixel` method.
		
		Snapshots work by using the WebGL `readPixels` feature to grab every pixel from the frame buffer
		into an ArrayBufferView. It then parses this, copying the contents to a temporary Canvas and finally
		creating an Image object from it, which is the image returned to the callback provided.
		
		All in all, this is a computationally expensive and blocking process, which gets more expensive
		the larger the resolution this Render Texture has, so please be careful how you employ this in your game.
	**/
	function snapshot(callback:phaser.types.renderer.snapshot.SnapshotCallback, ?type:String, ?encoderOptions:Float):RenderTexture;
	/**
		Takes a snapshot of the given pixel from this Render Texture.
		
		The snapshot is taken immediately, but the results are returned via the given callback.
		
		To capture the whole Render Texture see the `snapshot` method.
		To capture a portion of this Render Texture see the `snapshotArea` method.
		
		Unlike the two other snapshot methods, this one will send your callback a `Color` object
		containing the color data for the requested pixel. It doesn't need to create an internal
		Canvas or Image object, so is a lot faster to execute, using less memory than the other snapshot methods.
	**/
	function snapshotPixel(x:Float, y:Float, callback:phaser.types.renderer.snapshot.SnapshotCallback):RenderTexture;
	/**
		Internal destroy handler, called as part of the destroy process.
	**/
	private function preDestroy():Void;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():RenderTexture;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
		
		If your game is running under WebGL you can optionally specify four different alpha values, each of which
		correspond to the four corners of the Game Object. Under Canvas only the `topLeft` value given is used.
	**/
	function setAlpha(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):RenderTexture;
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
	function setBlendMode(value:ts.AnyOf3<String, Float, phaser.BlendModes>):RenderTexture;
	/**
		The depth of this Game Object within the Scene.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	function setDepth(value:Float):RenderTexture;
	/**
		Toggles the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function toggleFlipX():RenderTexture;
	/**
		Toggles the vertical flipped state of this Game Object.
	**/
	function toggleFlipY():RenderTexture;
	/**
		Sets the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlipX(value:Bool):RenderTexture;
	/**
		Sets the vertical flipped state of this Game Object.
	**/
	function setFlipY(value:Bool):RenderTexture;
	/**
		Sets the horizontal and vertical flipped state of this Game Object.
		
		A Game Object that is flipped will render inversed on the flipped axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlip(x:Bool, y:Bool):RenderTexture;
	/**
		Resets the horizontal and vertical flipped state of this Game Object back to their default un-flipped state.
	**/
	function resetFlip():RenderTexture;
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
	function setMask(mask:ts.AnyOf2<phaser.display.masks.BitmapMask, phaser.display.masks.GeometryMask>):RenderTexture;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):RenderTexture;
	/**
		Sets the origin of this Game Object.
		
		The values are given in the range 0 to 1.
	**/
	function setOrigin(?x:Float, ?y:Float):RenderTexture;
	/**
		Sets the origin of this Game Object based on the Pivot values in its Frame.
	**/
	function setOriginFromFrame():RenderTexture;
	/**
		Sets the display origin of this Game Object.
		The difference between this and setting the origin is that you can use pixel values for setting the display origin.
	**/
	function setDisplayOrigin(?x:Float, ?y:Float):RenderTexture;
	/**
		Updates the Display Origin cached values internally stored on this Game Object.
		You don't usually call this directly, but it is exposed for edge-cases where you may.
	**/
	function updateDisplayOrigin():RenderTexture;
	/**
		Sets the main WebGL Pipeline of this Game Object.
		
		Also sets the `pipelineData` property, if the parameter is given.
	**/
	function setPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.WebGLPipeline>, ?pipelineData:Dynamic, ?copyData:Bool):RenderTexture;
	/**
		Adds an entry to the `pipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPipelineData(key:String, ?value:Dynamic):RenderTexture;
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
	function setPostPipeline(pipelines:ts.AnyOf6<String, haxe.Constraints.Function, Array<String>, Array<haxe.Constraints.Function>, phaser.renderer.webgl.pipelines.PostFXPipeline, Array<phaser.renderer.webgl.pipelines.PostFXPipeline>>, ?pipelineData:Dynamic, ?copyData:Bool):RenderTexture;
	/**
		Adds an entry to the `postPipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPostPipelineData(key:String, ?value:Dynamic):RenderTexture;
	/**
		Removes a type of Post Pipeline instances from this Game Object, based on the given name, and destroys them.
		
		If you wish to remove all Post Pipelines use the `resetPostPipeline` method instead.
	**/
	function removePostPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.pipelines.PostFXPipeline>):RenderTexture;
	/**
		Removes all Pre and Post FX Controllers from this Game Object.
		
		If you wish to remove a single controller, use the `preFX.remove(fx)` or `postFX.remove(fx)` methods instead.
		
		If you wish to clear a single controller, use the `preFX.clear()` or `postFX.clear()` methods instead.
	**/
	function clearFX():RenderTexture;
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
	function setScrollFactor(x:Float, ?y:Float):RenderTexture;
	/**
		Sets the size of this Game Object to be that of the given Frame.
		
		This will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or call the
		`setDisplaySize` method, which is the same thing as changing the scale but allows you
		to do so by giving pixel values.
		
		If you have enabled this Game Object for input, changing the size will _not_ change the
		size of the hit area. To do this you should adjust the `input.hitArea` object directly.
	**/
	function setSizeToFrame(?frame:ts.AnyOf2<Bool, phaser.textures.Frame>):RenderTexture;
	/**
		Sets the display size of this Game Object.
		
		Calling this will adjust the scale.
	**/
	function setDisplaySize(width:Float, height:Float):RenderTexture;
	/**
		Applies a crop to a texture based Game Object, such as a Sprite or Image.
		
		The crop is a rectangle that limits the area of the texture frame that is visible during rendering.
		
		Cropping a Game Object does not change its size, dimensions, physics body or hit area, it just
		changes what is shown when rendered.
		
		The crop size as well as coordinates can not exceed the the size of the texture frame.
		
		The crop coordinates are relative to the texture frame, not the Game Object, meaning 0 x 0 is the top-left.
		
		Therefore, if you had a Game Object that had an 800x600 sized texture, and you wanted to show only the left
		half of it, you could call `setCrop(0, 0, 400, 600)`.
		
		It is also scaled to match the Game Object scale automatically. Therefore a crop rectangle of 100x50 would crop
		an area of 200x100 when applied to a Game Object that had a scale factor of 2.
		
		You can either pass in numeric values directly, or you can provide a single Rectangle object as the first argument.
		
		Call this method with no arguments at all to reset the crop, or toggle the property `isCropped` to `false`.
		
		You should do this if the crop rectangle becomes the same size as the frame itself, as it will allow
		the renderer to skip several internal calculations.
	**/
	function setCrop(?x:ts.AnyOf2<Float, phaser.geom.Rectangle>, ?y:Float, ?width:Float, ?height:Float):RenderTexture;
	/**
		Sets the texture and frame this Game Object will use to render with.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
	**/
	function setTexture(key:String, ?frame:ts.AnyOf2<String, Float>):RenderTexture;
	/**
		Sets the frame this Game Object will use to render with.
		
		If you pass a string or index then the Frame has to belong to the current Texture being used
		by this Game Object.
		
		If you pass a Frame instance, then the Texture being used by this Game Object will also be updated.
		
		Calling `setFrame` will modify the `width` and `height` properties of your Game Object.
		
		It will also change the `origin` if the Frame has a custom pivot point, as exported from packages like Texture Packer.
	**/
	function setFrame(frame:ts.AnyOf3<String, Float, phaser.textures.Frame>, ?updateSize:Bool, ?updateOrigin:Bool):RenderTexture;
	/**
		Clears all tint values associated with this Game Object.
		
		Immediately sets the color values back to 0xffffff and the tint type to 'additive',
		which results in no visible change to the texture.
	**/
	function clearTint():RenderTexture;
	/**
		Sets an additive tint on this Game Object.
		
		The tint works by taking the pixel color values from the Game Objects texture, and then
		multiplying it by the color value of the tint. You can provide either one color value,
		in which case the whole Game Object will be tinted in that color. Or you can provide a color
		per corner. The colors are blended together across the extent of the Game Object.
		
		To modify the tint color once set, either call this method again with new values or use the
		`tint` property to set all colors at once. Or, use the properties `tintTopLeft`, `tintTopRight,
		`tintBottomLeft` and `tintBottomRight` to set the corner color values independently.
		
		To remove a tint call `clearTint`.
		
		To swap this from being an additive tint to a fill based tint set the property `tintFill` to `true`.
	**/
	function setTint(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):RenderTexture;
	/**
		Sets a fill-based tint on this Game Object.
		
		Unlike an additive tint, a fill-tint literally replaces the pixel colors from the texture
		with those in the tint. You can use this for effects such as making a player flash 'white'
		if hit by something. You can provide either one color value, in which case the whole
		Game Object will be rendered in that color. Or you can provide a color per corner. The colors
		are blended together across the extent of the Game Object.
		
		To modify the tint color once set, either call this method again with new values or use the
		`tint` property to set all colors at once. Or, use the properties `tintTopLeft`, `tintTopRight,
		`tintBottomLeft` and `tintBottomRight` to set the corner color values independently.
		
		To remove a tint call `clearTint`.
		
		To swap this from being a fill-tint to an additive tint set the property `tintFill` to `false`.
	**/
	function setTintFill(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):RenderTexture;
	/**
		Sets the position of this Game Object.
	**/
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):RenderTexture;
	/**
		Copies an object's coordinates to this Game Object's position.
	**/
	function copyPosition(source:ts.AnyOf3<phaser.types.math.Vector2Like, phaser.types.math.Vector3Like, phaser.types.math.Vector4Like>):RenderTexture;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):RenderTexture;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):RenderTexture;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):RenderTexture;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(?x:Float, ?y:Float):RenderTexture;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):RenderTexture;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):RenderTexture;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):RenderTexture;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):RenderTexture;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):RenderTexture;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):RenderTexture;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):RenderTexture;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):RenderTexture;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():RenderTexture;
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
	function setData<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):RenderTexture;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:String, ?amount:Float):RenderTexture;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:String):RenderTexture;
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
	function setInteractive(?hitArea:Dynamic, ?callback:phaser.types.input.HitAreaCallback, ?dropZone:Bool):RenderTexture;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():RenderTexture;
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
	function removeInteractive():RenderTexture;
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
	function addToDisplayList(?displayList:ts.AnyOf2<Layer, DisplayList>):RenderTexture;
	/**
		Adds this Game Object to the Update List belonging to the Scene.
		
		When a Game Object is added to the Update List it will have its `preUpdate` method called
		every game frame. This method is passed two parameters: `delta` and `time`.
		
		If you wish to run your own logic within `preUpdate` then you should always call
		`super.preUpdate(delta, time)` within it, or it may fail to process required operations,
		such as Sprite animations.
	**/
	function addToUpdateList():RenderTexture;
	/**
		Removes this Game Object from the Display List it is currently on.
		
		A Game Object can only exist on one Display List at any given time, but may move freely removed
		and added back at a later stage.
		
		You can query which list it is on by looking at the `Phaser.GameObjects.GameObject#displayList` property.
		
		If a Game Object isn't on any Display List, it will not be rendered. If you just wish to temporarly
		disable it from rendering, consider using the `setVisible` method, instead.
	**/
	function removeFromDisplayList():RenderTexture;
	/**
		Removes this Game Object from the Scene's Update List.
		
		When a Game Object is on the Update List, it will have its `preUpdate` method called
		every game frame. Calling this method will remove it from the list, preventing this.
		
		Removing a Game Object from the Update List will stop most internal functions working.
		For example, removing a Sprite from the Update List will prevent it from being able to
		run animations.
	**/
	function removeFromUpdateList():RenderTexture;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):RenderTexture;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):RenderTexture;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):RenderTexture;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):RenderTexture;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):RenderTexture;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):RenderTexture;
	static var prototype : RenderTexture;
}