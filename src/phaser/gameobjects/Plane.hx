package phaser.gameobjects;

/**
	A Plane Game Object.
	
	The Plane Game Object is a helper class that takes the Mesh Game Object and extends it,
	allowing for fast and easy creation of Planes. A Plane is a one-sided grid of cells,
	where you specify the number of cells in each dimension. The Plane can have a texture
	that is either repeated (tiled) across each cell, or applied to the full Plane.
	
	The Plane can then be manipulated in 3D space, with rotation across all 3 axis.
	
	This allows you to create effects not possible with regular Sprites, such as perspective
	distortion. You can also adjust the vertices on a per-vertex basis. Plane data becomes
	part of the WebGL batch, just like standard Sprites, so doesn't introduce any additional
	shader overhead. Because the Plane just generates vertices into the WebGL batch, like any
	other Sprite, you can use all of the common Game Object components on a Plane too,
	such as a custom pipeline, mask, blend mode or texture.
	
	You can use the `uvScroll` and `uvScale` methods to adjust the placement and scaling
	of the texture if this Plane is using a single texture, and not a frame from a texture
	atlas or sprite sheet.
	
	The Plane Game Object also has the Animation component, allowing you to play animations
	across the Plane just as you would with a Sprite. The animation frame size must be fixed
	as the first frame will be the size of the entire animation, for example use a `SpriteSheet`.
	
	Note that the Plane object is WebGL only and does not have a Canvas counterpart.
	
	The Plane origin is always 0.5 x 0.5 and cannot be changed.
**/
@:native("Phaser.GameObjects.Plane") extern class Plane extends Mesh {
	function new(scene:phaser.Scene, ?x:Float, ?y:Float, ?texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>, ?width:Float, ?height:Float, ?tile:Bool);
	/**
		The Animation State component of this Sprite.
		
		This component provides features to apply animations to this Sprite.
		It is responsible for playing, loading, queuing animations for later playback,
		mixing between animations and setting the current animation frame to this Sprite.
	**/
	var anims : phaser.animations.AnimationState;
	/**
		The width of this Plane in cells, not pixels.
		
		This value is read-only. To adjust it, see the `setGridSize` method.
	**/
	final gridWidth : Float;
	/**
		The height of this Plane in cells, not pixels.
		
		This value is read-only. To adjust it, see the `setGridSize` method.
	**/
	final gridHeight : Float;
	/**
		Is the texture of this Plane tiled across all cells, or not?
		
		This value is read-only. To adjust it, see the `setGridSize` method.
	**/
	final isTiled : Bool;
	/**
		Do not change this value. It has no effect other than to break things.
	**/
	final originX : Float;
	/**
		Do not change this value. It has no effect other than to break things.
	**/
	final originY : Float;
	/**
		Modifies the layout of this Plane by adjusting the grid dimensions to the
		given width and height. The values are given in cells, not pixels.
		
		The `tile` parameter allows you to control if the texture is tiled, or
		applied across the entire Plane? A tiled texture will repeat with one
		iteration per cell. A non-tiled texture will be applied across the whole
		Plane.
		
		Note that if this Plane is using a single texture, not from a texture atlas
		or sprite sheet, then you can use the `Plane.uvScale` method to have much
		more fine-grained control over the texture tiling.
	**/
	function preDestroy(?width:Float, ?height:Float, ?tile:Bool):Void;
	/**
		Sets the height of this Plane to match the given value, in pixels.
		
		This adjusts the `Plane.viewPosition.z` value to achieve this.
		
		If no `value` parameter is given, it will set the view height to match
		that of the current texture frame the Plane is using.
	**/
	function setViewHeight(?value:Float):Void;
	/**
		Creates a checkerboard style texture, based on the given colors and alpha
		values and applies it to this Plane, replacing any current texture it may
		have.
		
		The colors are used in an alternating pattern, like a chess board.
		
		Calling this method generates a brand new 16x16 pixel WebGLTexture internally
		and applies it to this Plane. While quite fast to do, you should still be
		mindful of calling this method either extensively, or in tight parts of
		your game.
	**/
	function createCheckerboard(?color1:Float, ?color2:Float, ?alpha1:Float, ?alpha2:Float, ?height:Float):Void;
	/**
		If this Plane has a Checkerboard Texture, this method will destroy it
		and reset the internal flag for it.
	**/
	function removeCheckerboard():Void;
	/**
		Start playing the given animation on this Plane.
		
		Animations in Phaser can either belong to the global Animation Manager, or specifically to this Plane.
		
		The benefit of a global animation is that multiple Game Objects can all play the same animation, without
		having to duplicate the data. You can just create it once and then play it on any animating Game Object.
		
		The following code shows how to create a global repeating animation. The animation will be created
		from all of the frames within the sprite sheet that was loaded with the key 'muybridge':
		
		```javascript
		var config = {
		     key: 'run',
		     frames: 'muybridge',
		     frameRate: 15,
		     repeat: -1
		};
		
		//  This code should be run from within a Scene:
		this.anims.create(config);
		```
		
		However, if you wish to create an animation that is unique to this Plane, and this Plane alone,
		you can call the `Animation.create` method instead. It accepts the exact same parameters as when
		creating a global animation, however the resulting data is kept locally in this Plane.
		
		With the animation created, either globally or locally, you can now play it on this Plane:
		
		```javascript
		const plane = this.add.plane(...);
		plane.play('run');
		```
		
		Alternatively, if you wish to run it at a different frame rate for example, you can pass a config
		object instead:
		
		```javascript
		const plane = this.add.plane(...);
		plane.play({ key: 'run', frameRate: 24 });
		```
		
		When playing an animation on a Plane it will first check to see if it can find a matching key
		locally within the Plane. If it can, it will play the local animation. If not, it will then
		search the global Animation Manager and look for it there.
		
		If you need a Plane to be able to play both local and global animations, make sure they don't
		have conflicting keys.
		
		See the documentation for the `PlayAnimationConfig` config object for more details about this.
		
		Also, see the documentation in the Animation Manager for further details on creating animations.
	**/
	function play(key:ts.AnyOf3<String, phaser.animations.Animation, phaser.types.animations.PlayAnimationConfig>, ?ignoreIfPlaying:Bool):Plane;
	/**
		Start playing the given animation on this Plane, in reverse.
		
		Animations in Phaser can either belong to the global Animation Manager, or specifically to a Game Object.
		
		The benefit of a global animation is that multiple Game Objects can all play the same animation, without
		having to duplicate the data. You can just create it once and then play it on any animating Game Object.
		
		The following code shows how to create a global repeating animation. The animation will be created
		from all of the frames within the sprite sheet that was loaded with the key 'muybridge':
		
		```javascript
		var config = {
		     key: 'run',
		     frames: 'muybridge',
		     frameRate: 15,
		     repeat: -1
		};
		
		//  This code should be run from within a Scene:
		this.anims.create(config);
		```
		
		However, if you wish to create an animation that is unique to this Game Object, and this Game Object alone,
		you can call the `Animation.create` method instead. It accepts the exact same parameters as when
		creating a global animation, however the resulting data is kept locally in this Game Object.
		
		With the animation created, either globally or locally, you can now play it on this Game Object:
		
		```javascript
		const plane = this.add.plane(...);
		plane.playReverse('run');
		```
		
		Alternatively, if you wish to run it at a different frame rate, for example, you can pass a config
		object instead:
		
		```javascript
		const plane = this.add.plane(...);
		plane.playReverse({ key: 'run', frameRate: 24 });
		```
		
		When playing an animation on a Game Object it will first check to see if it can find a matching key
		locally within the Game Object. If it can, it will play the local animation. If not, it will then
		search the global Animation Manager and look for it there.
		
		If you need a Game Object to be able to play both local and global animations, make sure they don't
		have conflicting keys.
		
		See the documentation for the `PlayAnimationConfig` config object for more details about this.
		
		Also, see the documentation in the Animation Manager for further details on creating animations.
	**/
	function playReverse(key:ts.AnyOf3<String, phaser.animations.Animation, phaser.types.animations.PlayAnimationConfig>, ?ignoreIfPlaying:Bool):Plane;
	/**
		Waits for the specified delay, in milliseconds, then starts playback of the given animation.
		
		If the animation _also_ has a delay value set in its config, it will be **added** to the delay given here.
		
		If an animation is already running and a new animation is given to this method, it will wait for
		the given delay before starting the new animation.
		
		If no animation is currently running, the given one begins after the delay.
		
		When playing an animation on a Game Object it will first check to see if it can find a matching key
		locally within the Game Object. If it can, it will play the local animation. If not, it will then
		search the global Animation Manager and look for it there.
	**/
	function playAfterDelay(key:ts.AnyOf3<String, phaser.animations.Animation, phaser.types.animations.PlayAnimationConfig>, delay:Float):Plane;
	/**
		Waits for the current animation to complete the `repeatCount` number of repeat cycles, then starts playback
		of the given animation.
		
		You can use this to ensure there are no harsh jumps between two sets of animations, i.e. going from an
		idle animation to a walking animation, by making them blend smoothly into each other.
		
		If no animation is currently running, the given one will start immediately.
		
		When playing an animation on a Game Object it will first check to see if it can find a matching key
		locally within the Game Object. If it can, it will play the local animation. If not, it will then
		search the global Animation Manager and look for it there.
	**/
	function playAfterRepeat(key:ts.AnyOf3<String, phaser.animations.Animation, phaser.types.animations.PlayAnimationConfig>, ?repeatCount:Float):Plane;
	/**
		Immediately stops the current animation from playing and dispatches the `ANIMATION_STOP` events.
		
		If no animation is playing, no event will be dispatched.
		
		If there is another animation queued (via the `chain` method) then it will start playing immediately.
	**/
	function stop():Plane;
	/**
		Stops the current animation from playing after the specified time delay, given in milliseconds.
		
		It then dispatches the `ANIMATION_STOP` event.
		
		If no animation is running, no events will be dispatched.
		
		If there is another animation in the queue (set via the `chain` method) then it will start playing,
		when the current one stops.
	**/
	function stopAfterDelay(delay:Float):Plane;
	/**
		Stops the current animation from playing after the given number of repeats.
		
		It then dispatches the `ANIMATION_STOP` event.
		
		If no animation is running, no events will be dispatched.
		
		If there is another animation in the queue (set via the `chain` method) then it will start playing,
		when the current one stops.
	**/
	function stopAfterRepeat(?repeatCount:Float):Plane;
	/**
		Stops the current animation from playing when it next sets the given frame.
		If this frame doesn't exist within the animation it will not stop it from playing.
		
		It then dispatches the `ANIMATION_STOP` event.
		
		If no animation is running, no events will be dispatched.
		
		If there is another animation in the queue (set via the `chain` method) then it will start playing,
		when the current one stops.
	**/
	function stopOnFrame(frame:phaser.animations.AnimationFrame):Plane;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():Plane;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
	**/
	function setAlpha(?value:Float):Plane;
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
	function setBlendMode(value:ts.AnyOf3<String, Float, phaser.BlendModes>):Plane;
	/**
		The depth of this Game Object within the Scene.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	function setDepth(value:Float):Plane;
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
	function setMask(mask:ts.AnyOf2<phaser.display.masks.BitmapMask, phaser.display.masks.GeometryMask>):Plane;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):Plane;
	/**
		Sets the main WebGL Pipeline of this Game Object.
		
		Also sets the `pipelineData` property, if the parameter is given.
	**/
	function setPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.WebGLPipeline>, ?pipelineData:Dynamic, ?copyData:Bool):Plane;
	/**
		Adds an entry to the `pipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPipelineData(key:String, ?value:Dynamic):Plane;
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
	function setPostPipeline(pipelines:ts.AnyOf6<String, haxe.Constraints.Function, Array<String>, Array<haxe.Constraints.Function>, phaser.renderer.webgl.pipelines.PostFXPipeline, Array<phaser.renderer.webgl.pipelines.PostFXPipeline>>, ?pipelineData:Dynamic, ?copyData:Bool):Plane;
	/**
		Adds an entry to the `postPipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPostPipelineData(key:String, ?value:Dynamic):Plane;
	/**
		Removes a type of Post Pipeline instances from this Game Object, based on the given name, and destroys them.
		
		If you wish to remove all Post Pipelines use the `resetPostPipeline` method instead.
	**/
	function removePostPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.pipelines.PostFXPipeline>):Plane;
	/**
		Removes all Pre and Post FX Controllers from this Game Object.
		
		If you wish to remove a single controller, use the `preFX.remove(fx)` or `postFX.remove(fx)` methods instead.
		
		If you wish to clear a single controller, use the `preFX.clear()` or `postFX.clear()` methods instead.
	**/
	function clearFX():Plane;
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
	function setScrollFactor(x:Float, ?y:Float):Plane;
	/**
		An internal method that resets the perspective projection for this Plane
		when it changes texture or frame, and also resets the cell UV coordinates,
		if required.
	**/
	function setSizeToFrame(?resetUV:Bool):Plane;
	/**
		Sets the internal size of this Game Object, as used for frame or physics body creation.
		
		This will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or call the
		`setDisplaySize` method, which is the same thing as changing the scale but allows you
		to do so by giving pixel values.
		
		If you have enabled this Game Object for input, changing the size will _not_ change the
		size of the hit area. To do this you should adjust the `input.hitArea` object directly.
	**/
	function setSize(width:Float, height:Float):Plane;
	/**
		Sets the display size of this Game Object.
		
		Calling this will adjust the scale.
	**/
	function setDisplaySize(width:Float, height:Float):Plane;
	/**
		Sets the texture and frame this Game Object will use to render with.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
		
		Calling this method will modify the `width` and `height` properties of your Game Object.
		
		It will also change the `origin` if the Frame has a custom pivot point, as exported from packages like Texture Packer.
	**/
	function setTexture(key:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>, ?updateSize:Bool, ?updateOrigin:Bool):Plane;
	/**
		Sets the frame this Game Object will use to render with.
		
		If you pass a string or index then the Frame has to belong to the current Texture being used
		by this Game Object.
		
		If you pass a Frame instance, then the Texture being used by this Game Object will also be updated.
		
		Calling `setFrame` will modify the `width` and `height` properties of your Game Object.
		
		It will also change the `origin` if the Frame has a custom pivot point, as exported from packages like Texture Packer.
	**/
	function setFrame(frame:ts.AnyOf3<String, Float, phaser.textures.Frame>, ?updateSize:Bool, ?updateOrigin:Bool):Plane;
	/**
		Sets the position of this Game Object.
	**/
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):Plane;
	/**
		Copies an object's coordinates to this Game Object's position.
	**/
	function copyPosition(source:ts.AnyOf3<phaser.types.math.Vector2Like, phaser.types.math.Vector3Like, phaser.types.math.Vector4Like>):Plane;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):Plane;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):Plane;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):Plane;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(?x:Float, ?y:Float):Plane;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):Plane;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):Plane;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):Plane;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):Plane;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):Plane;
	/**
		Iterates and destroys all current Faces in this Mesh, then resets the
		`faces` and `vertices` arrays.
	**/
	function clear():Plane;
	/**
		This method will add the data from a triangulated Wavefront OBJ model file to this Mesh.
		
		The data should have been loaded via the OBJFile:
		
		```javascript
		this.load.obj(key, url);
		```
		
		Then use the same `key` as the first parameter to this method.
		
		Multiple Mesh Game Objects can use the same model data without impacting on each other.
		
		Make sure your 3D package has triangulated the model data prior to exporting it.
		
		You can add multiple models to a single Mesh, although they will act as one when
		moved or rotated. You can scale the model data, should it be too small, or too large, to see.
		You can also offset the vertices of the model via the `x`, `y` and `z` parameters.
	**/
	function addVerticesFromObj(key:String, ?scale:Float, ?x:Float, ?y:Float, ?z:Float, ?rotateX:Float, ?rotateY:Float, ?rotateZ:Float, ?zIsUp:Bool):Plane;
	/**
		Runs a depth sort across all Faces in this Mesh, comparing their averaged depth.
		
		This is called automatically if you use any of the `rotate` methods, but you can
		also invoke it to sort the Faces should you manually position them.
	**/
	function depthSort():Plane;
	/**
		Adds a new Vertex into the vertices array of this Mesh.
		
		Just adding a vertex isn't enough to render it. You need to also
		make it part of a Face, with 3 Vertex instances per Face.
	**/
	function addVertex(x:Float, y:Float, z:Float, u:Float, v:Float, ?color:Float, ?alpha:Float):Plane;
	/**
		Adds a new Face into the faces array of this Mesh.
		
		A Face consists of references to 3 Vertex instances, which must be provided.
	**/
	function addFace(vertex1:phaser.geom.mesh.Vertex, vertex2:phaser.geom.mesh.Vertex, vertex3:phaser.geom.mesh.Vertex):Plane;
	/**
		Adds new vertices to this Mesh by parsing the given data.
		
		This method will take vertex data in one of two formats, based on the `containsZ` parameter.
		
		If your vertex data are `x`, `y` pairs, then `containsZ` should be `false` (this is the default, and will result in `z=0` for each vertex).
		
		If your vertex data is groups of `x`, `y` and `z` values, then the `containsZ` parameter must be true.
		
		The `uvs` parameter is a numeric array consisting of `u` and `v` pairs.
		
		The `normals` parameter is a numeric array consisting of `x`, `y` vertex normal values and, if `containsZ` is true, `z` values as well.
		
		The `indicies` parameter is an optional array that, if given, is an indexed list of vertices to be added.
		
		The `colors` parameter is an optional array, or single value, that if given sets the color of each vertex created.
		
		The `alphas` parameter is an optional array, or single value, that if given sets the alpha of each vertex created.
		
		When providing indexed data it is assumed that _all_ of the arrays are indexed, not just the vertices.
		
		The following example will create a 256 x 256 sized quad using an index array:
		
		```javascript
		let mesh = new Mesh(this);  // Assuming `this` is a scene!
		const vertices = [
		   -128, 128,
		   128, 128,
		   -128, -128,
		   128, -128
		];
		
		const uvs = [
		   0, 1,
		   1, 1,
		   0, 0,
		   1, 0
		];
		
		const indices = [ 0, 2, 1, 2, 3, 1 ];
		
		mesh.addVertices(vertices, uvs, indicies);
		// Note: Otherwise the added points will be "behind" the camera! This value will project vertex `x` & `y` values 1:1 to pixel values.
		mesh.hideCCW = false;
		mesh.setOrtho(mesh.width, mesh.height);
		```
		
		If the data is not indexed, it's assumed that the arrays all contain sequential data.
	**/
	function addVertices(vertices:Array<Float>, uvs:Array<Float>, ?indicies:Array<Float>, ?containsZ:Bool, ?normals:Array<Float>, ?colors:ts.AnyOf2<Float, Array<Float>>, ?alphas:ts.AnyOf2<Float, Array<Float>>):Plane;
	/**
		This method enables rendering of the Mesh vertices to the given Graphics instance.
		
		If you enable this feature, you **must** call `Graphics.clear()` in your Scene `update`,
		otherwise the Graphics instance you provide to debug will fill-up with draw calls,
		eventually crashing the browser. This is not done automatically to allow you to debug
		draw multiple Mesh objects to a single Graphics instance.
		
		The Mesh class has a built-in debug rendering callback `Mesh.renderDebug`, however
		you can also provide your own callback to be used instead. Do this by setting the `callback` parameter.
		
		The callback is invoked _once per render_ and sent the following parameters:
		
		`callback(src, faces)`
		
		`src` is the Mesh instance being debugged.
		`faces` is an array of the Faces that were rendered.
		
		You can get the final drawn vertex position from a Face object like this:
		
		```javascript
		let face = faces[i];
		
		let x0 = face.vertex1.tx;
		let y0 = face.vertex1.ty;
		let x1 = face.vertex2.tx;
		let y1 = face.vertex2.ty;
		let x2 = face.vertex3.tx;
		let y2 = face.vertex3.ty;
		
		graphic.strokeTriangle(x0, y0, x1, y1, x2, y2);
		```
		
		If using your own callback you do not have to provide a Graphics instance to this method.
		
		To disable debug rendering, to either your own callback or the built-in one, call this method
		with no arguments.
	**/
	function setDebug(?graphic:Graphics, ?callback:haxe.Constraints.Function):Plane;
	/**
		Clears all tint values associated with this Game Object.
		
		Immediately sets the color values back to 0xffffff on all vertices,
		which results in no visible change to the texture.
	**/
	function clearTint():Plane;
	/**
		Pass this Mesh Game Object to the Input Manager to enable it for Input.
		
		Unlike other Game Objects, the Mesh Game Object uses its own special hit area callback, which you cannot override.
	**/
	function setInteractive(?config:phaser.types.input.InputConfiguration):Plane;
	/**
		Sets an additive tint on all vertices of this Mesh Game Object.
		
		The tint works by taking the pixel color values from the Game Objects texture, and then
		multiplying it by the color value of the tint.
		
		To modify the tint color once set, either call this method again with new values or use the
		`tint` property to set all colors at once.
		
		To remove a tint call `clearTint`.
	**/
	function setTint(?tint:Float):Plane;
	/**
		Scrolls the UV texture coordinates of all faces in this Mesh by
		adding the given x/y amounts to them.
		
		If you only wish to scroll one coordinate, pass a value of zero
		to the other.
		
		Use small values for scrolling. UVs are set from the range 0
		to 1, so you should increment (or decrement) them by suitably
		small values, such as 0.01.
		
		Due to a limitation in WebGL1 you can only UV scroll textures
		that are a power-of-two in size. Scrolling NPOT textures will
		work but will result in clamping the pixels to the edges.
		
		Note that if this Mesh is using a _frame_ from a texture atlas
		then you will be unable to UV scroll its texture.
	**/
	function uvScroll(x:Float, y:Float):Plane;
	/**
		Scales the UV texture coordinates of all faces in this Mesh by
		the exact given amounts.
		
		If you only wish to scale one coordinate, pass a value of one
		to the other.
		
		Due to a limitation in WebGL1 you can only UV scale textures
		that are a power-of-two in size. Scaling NPOT textures will
		work but will result in clamping the pixels to the edges if
		you scale beyond a value of 1. Scaling below 1 will work
		regardless of texture size.
		
		Note that if this Mesh is using a _frame_ from a texture atlas
		then you will be unable to UV scale its texture.
	**/
	function uvScale(x:Float, y:Float):Plane;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):Plane;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):Plane;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):Plane;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():Plane;
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
	function setData<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):Plane;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:String, ?amount:Float):Plane;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:String):Plane;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():Plane;
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
	function removeInteractive():Plane;
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
	function addToDisplayList(?displayList:ts.AnyOf2<Layer, DisplayList>):Plane;
	/**
		Adds this Game Object to the Update List belonging to the Scene.
		
		When a Game Object is added to the Update List it will have its `preUpdate` method called
		every game frame. This method is passed two parameters: `delta` and `time`.
		
		If you wish to run your own logic within `preUpdate` then you should always call
		`super.preUpdate(delta, time)` within it, or it may fail to process required operations,
		such as Sprite animations.
	**/
	function addToUpdateList():Plane;
	/**
		Removes this Game Object from the Display List it is currently on.
		
		A Game Object can only exist on one Display List at any given time, but may move freely removed
		and added back at a later stage.
		
		You can query which list it is on by looking at the `Phaser.GameObjects.GameObject#displayList` property.
		
		If a Game Object isn't on any Display List, it will not be rendered. If you just wish to temporarly
		disable it from rendering, consider using the `setVisible` method, instead.
	**/
	function removeFromDisplayList():Plane;
	/**
		Removes this Game Object from the Scene's Update List.
		
		When a Game Object is on the Update List, it will have its `preUpdate` method called
		every game frame. Calling this method will remove it from the list, preventing this.
		
		Removing a Game Object from the Update List will stop most internal functions working.
		For example, removing a Sprite from the Update List will prevent it from being able to
		run animations.
	**/
	function removeFromUpdateList():Plane;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Plane;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Plane;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Plane;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Plane;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Plane;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Plane;
	static var prototype : Plane;
}