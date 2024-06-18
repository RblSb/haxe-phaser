package phaser.gameobjects;

/**
	A Nine Slice Game Object allows you to display a texture-based object that
	can be stretched both horizontally and vertically, but that retains
	fixed-sized corners. The dimensions of the corners are set via the
	parameters to this class.
	
	This is extremely useful for UI and button like elements, where you need
	them to expand to accommodate the content without distorting the texture.
	
	The texture you provide for this Game Object should be based on the
	following layout structure:
	
	```
	      A                          B
	    +---+----------------------+---+
	  C | 1 |          2           | 3 |
	    +---+----------------------+---+
	    |   |                      |   |
	    | 4 |          5           | 6 |
	    |   |                      |   |
	    +---+----------------------+---+
	  D | 7 |          8           | 9 |
	    +---+----------------------+---+
	```
	
	When changing this objects width and / or height:
	
	     areas 1, 3, 7 and 9 (the corners) will remain unscaled
	     areas 2 and 8 will be stretched horizontally only
	     areas 4 and 6 will be stretched vertically only
	     area 5 will be stretched both horizontally and vertically
	
	You can also create a 3 slice Game Object:
	
	This works in a similar way, except you can only stretch it horizontally.
	Therefore, it requires less configuration:
	
	```
	      A                          B
	    +---+----------------------+---+
	    |   |                      |   |
	  C | 1 |          2           | 3 |
	    |   |                      |   |
	    +---+----------------------+---+
	```
	
	When changing this objects width (you cannot change its height)
	
	     areas 1 and 3 will remain unscaled
	     area 2 will be stretched horizontally
	
	The above configuration concept is adapted from the Pixi NineSlicePlane.
	
	To specify a 3 slice object instead of a 9 slice you should only
	provide the `leftWidth` and `rightWidth` parameters. To create a 9 slice
	you must supply all parameters.
	
	The _minimum_ width this Game Object can be is the total of
	`leftWidth` + `rightWidth`.  The _minimum_ height this Game Object
	can be is the total of `topHeight` + `bottomHeight`.
	If you need to display this object at a smaller size, you can scale it.
	
	In terms of performance, using a 3 slice Game Object is the equivalent of
	having 3 Sprites in a row. Using a 9 slice Game Object is the equivalent
	of having 9 Sprites in a row. The vertices of this object are all batched
	together and can co-exist with other Sprites and graphics on the display
	list, without incurring any additional overhead.
	
	As of Phaser 3.60 this Game Object is WebGL only.
	
	As of Phaser 3.70 this Game Object can now populate its values automatically
	if they have been set within Texture Packer 7.1.0 or above and exported with
	the atlas json. If this is the case, you can just call this method without
	specifying anything more than the texture key and frame and it will pull the
	area data from the atlas.
**/
@:native("Phaser.GameObjects.NineSlice") extern class NineSlice extends GameObject {
	function new(scene:phaser.Scene, x:Float, y:Float, texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>, ?width:Float, ?height:Float, ?leftWidth:Float, ?rightWidth:Float, ?topHeight:Float, ?bottomHeight:Float);
	/**
		An array of Vertex objects that correspond to the quads that make-up
		this Nine Slice Game Object. They are stored in the following order:
		
		Top Left - Indexes 0 - 5
		Top Center - Indexes 6 - 11
		Top Right - Indexes 12 - 17
		Center Left - Indexes 18 - 23
		Center - Indexes 24 - 29
		Center Right - Indexes 30 - 35
		Bottom Left - Indexes 36 - 41
		Bottom Center - Indexes 42 - 47
		Bottom Right - Indexes 48 - 53
		
		Each quad is represented by 6 Vertex instances.
		
		This array will contain 18 elements for a 3 slice object
		and 54 for a nine slice object.
		
		You should never modify this array once it has been populated.
	**/
	var vertices : Array<phaser.geom.mesh.Vertex>;
	/**
		The size of the left vertical bar (A).
	**/
	final leftWidth : Float;
	/**
		The size of the right vertical bar (B).
	**/
	final rightWidth : Float;
	/**
		The size of the top horizontal bar (C).
		
		If this is a 3 slice object this property will be set to the
		height of the texture being used.
	**/
	final topHeight : Float;
	/**
		The size of the bottom horizontal bar (D).
		
		If this is a 3 slice object this property will be set to zero.
	**/
	final bottomHeight : Float;
	/**
		The tint value being applied to the top-left vertice of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
		The value should be set as a hex number, i.e. 0xff0000 for red, or 0xff00ff for purple.
	**/
	var tint : Float;
	/**
		The tint fill mode.
		
		`false` = An additive tint (the default), where vertices colors are blended with the texture.
		`true` = A fill tint, where the vertices colors replace the texture, but respects texture alpha.
	**/
	var tintFill : Bool;
	/**
		This property is `true` if this Nine Slice Game Object was configured
		with just `leftWidth` and `rightWidth` values, making it a 3-slice
		instead of a 9-slice object.
	**/
	var is3Slice : Bool;
	/**
		Resets the width, height and slices for this NineSlice Game Object.
		
		This allows you to modify the texture being used by this object and then reset the slice configuration,
		to avoid having to destroy this Game Object in order to use it for a different game element.
		
		Please note that you cannot change a 9-slice to a 3-slice or vice versa.
	**/
	function setSlices(?width:Float, ?height:Float, ?leftWidth:Float, ?rightWidth:Float, ?topHeight:Float, ?bottomHeight:Float, ?skipScale9:Bool):NineSlice;
	/**
		Updates all of the vertice UV coordinates. This is called automatically
		when the NineSlice Game Object is created, or if the texture frame changes.
		
		Unlike with the `updateVertice` method, you do not need to call this
		method if the Nine Slice changes size. Only if it changes texture frame.
	**/
	function updateUVs():Void;
	/**
		Recalculates all of the vertices in this Nine Slice Game Object
		based on the `leftWidth`, `rightWidth`, `topHeight` and `bottomHeight`
		properties, combined with the Game Object size.
		
		This method is called automatically when this object is created
		or if it's origin is changed.
		
		You should not typically need to call this method directly, but it
		is left public should you find a need to modify one of those properties
		after creation.
	**/
	function updateVertices():Void;
	/**
		Internally updates the position coordinates across all vertices of the
		given quad offset.
		
		You should not typically need to call this method directly, but it
		is left public should an extended class require it.
	**/
	function updateQuad(offset:Float, x1:Float, y1:Float, x2:Float, y2:Float):Void;
	/**
		Internally updates the UV coordinates across all vertices of the
		given quad offset, based on the frame size.
		
		You should not typically need to call this method directly, but it
		is left public should an extended class require it.
	**/
	function updateQuadUVs(offset:Float, u1:Float, v1:Float, u2:Float, v2:Float):Void;
	/**
		Clears all tint values associated with this Game Object.
		
		Immediately sets the color values back to 0xffffff and the tint type to 'additive',
		which results in no visible change to the texture.
	**/
	function clearTint():NineSlice;
	/**
		Sets an additive tint on this Game Object.
		
		The tint works by taking the pixel color values from the Game Objects texture, and then
		multiplying it by the color value of the tint.
		
		To modify the tint color once set, either call this method again with new values or use the
		`tint` property.
		
		To remove a tint call `clearTint`, or call this method with no parameters.
		
		To swap this from being an additive tint to a fill based tint set the property `tintFill` to `true`.
	**/
	function setTint(?color:Float):NineSlice;
	/**
		Sets a fill-based tint on this Game Object.
		
		Unlike an additive tint, a fill-tint literally replaces the pixel colors from the texture
		with those in the tint. You can use this for effects such as making a player flash 'white'
		if hit by something. The whole Game Object will be rendered in the given color.
		
		To modify the tint color once set, either call this method again with new values or use the
		`tint` property.
		
		To remove a tint call `clearTint`, or call this method with no parameters.
		
		To swap this from being a fill-tint to an additive tint set the property `tintFill` to `false`.
	**/
	function setTintFill(?color:Float):NineSlice;
	/**
		Does this Game Object have a tint applied?
		
		It checks to see if the tint property is set to a value other than 0xffffff.
		This indicates that a Game Object is tinted.
	**/
	final isTinted : Bool;
	/**
		The displayed width of this Game Object.
		
		Setting this value will adjust the way in which this Nine Slice
		object scales horizontally, if configured to do so.
		
		The _minimum_ width this Game Object can be is the total of
		`leftWidth` + `rightWidth`. If you need to display this object
		at a smaller size, you can also scale it.
	**/
	var width : Float;
	/**
		The displayed height of this Game Object.
		
		Setting this value will adjust the way in which this Nine Slice
		object scales vertically, if configured to do so.
		
		The _minimum_ height this Game Object can be is the total of
		`topHeight` + `bottomHeight`. If you need to display this object
		at a smaller size, you can also scale it.
		
		If this is a 3-slice object, you can only stretch it horizontally
		and changing the height will be ignored.
	**/
	var height : Float;
	/**
		The displayed width of this Game Object.
		
		This value takes into account the scale factor.
		
		Setting this value will adjust the Game Object's scale property.
	**/
	var displayWidth : Float;
	/**
		The displayed height of this Game Object.
		
		This value takes into account the scale factor.
		
		Setting this value will adjust the Game Object's scale property.
	**/
	var displayHeight : Float;
	/**
		Sets the size of this Game Object.
		
		For a Nine Slice Game Object this means it will be stretched (or shrunk) horizontally
		and vertically depending on the dimensions given to this method, in accordance with
		how it has been configured for the various corner sizes.
		
		If this is a 3-slice object, you can only stretch it horizontally
		and changing the height will be ignored.
		
		If you have enabled this Game Object for input, changing the size will also change the
		size of the hit area.
	**/
	function setSize(width:Float, height:Float):NineSlice;
	/**
		Sets the display size of this Game Object.
		
		Calling this will adjust the scale.
	**/
	function setDisplaySize(width:Float, height:Float):NineSlice;
	/**
		The horizontal origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the left of the Game Object.
	**/
	var originX : Float;
	/**
		The vertical origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the top of the Game Object.
	**/
	var originY : Float;
	/**
		Sets the origin of this Game Object.
		
		The values are given in the range 0 to 1.
	**/
	function setOrigin(?x:Float, ?y:Float):NineSlice;
	/**
		This method is included but does nothing for the Nine Slice Game Object,
		because the size of the object isn't based on the texture frame.
		
		You should not call this method.
	**/
	function setSizeToFrame():NineSlice;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():NineSlice;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
	**/
	function setAlpha(?value:Float):NineSlice;
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
	function setBlendMode(value:ts.AnyOf3<String, Float, phaser.BlendModes>):NineSlice;
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
	function setDepth(value:Float):NineSlice;
	/**
		Gets the center coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-left corner coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getTopLeft<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-center coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getTopCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-right corner coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getTopRight<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the left-center coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getLeftCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the right-center coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getRightCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-left corner coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getBottomLeft<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-center coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getBottomCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-right corner coordinate of this Game Object, regardless of origin.
		
		The returned point is calculated in local space and does not factor in any parent Containers,
		unless the `includeParent` argument is set to `true`.
	**/
	function getBottomRight<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bounds of this Game Object, regardless of origin.
		
		The values are stored and returned in a Rectangle, or Rectangle-like, object.
	**/
	function getBounds<O>(?output:O):O;
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
	function setMask(mask:ts.AnyOf2<phaser.display.masks.BitmapMask, phaser.display.masks.GeometryMask>):NineSlice;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):NineSlice;
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
		The horizontal display origin of this Game Object.
		The origin is a normalized value between 0 and 1.
		The displayOrigin is a pixel value, based on the size of the Game Object combined with the origin.
	**/
	var displayOriginX : Float;
	/**
		The vertical display origin of this Game Object.
		The origin is a normalized value between 0 and 1.
		The displayOrigin is a pixel value, based on the size of the Game Object combined with the origin.
	**/
	var displayOriginY : Float;
	/**
		Sets the origin of this Game Object based on the Pivot values in its Frame.
	**/
	function setOriginFromFrame():NineSlice;
	/**
		Sets the display origin of this Game Object.
		The difference between this and setting the origin is that you can use pixel values for setting the display origin.
	**/
	function setDisplayOrigin(?x:Float, ?y:Float):NineSlice;
	/**
		Updates the Display Origin cached values internally stored on this Game Object.
		You don't usually call this directly, but it is exposed for edge-cases where you may.
	**/
	function updateDisplayOrigin():NineSlice;
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
	function setPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.WebGLPipeline>, ?pipelineData:Dynamic, ?copyData:Bool):NineSlice;
	/**
		Adds an entry to the `pipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPipelineData(key:String, ?value:Dynamic):NineSlice;
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
	function setPostPipeline(pipelines:ts.AnyOf6<String, haxe.Constraints.Function, Array<String>, Array<haxe.Constraints.Function>, phaser.renderer.webgl.pipelines.PostFXPipeline, Array<phaser.renderer.webgl.pipelines.PostFXPipeline>>, ?pipelineData:Dynamic, ?copyData:Bool):NineSlice;
	/**
		Adds an entry to the `postPipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPostPipelineData(key:String, ?value:Dynamic):NineSlice;
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
	function removePostPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.pipelines.PostFXPipeline>):NineSlice;
	/**
		Removes all Pre and Post FX Controllers from this Game Object.
		
		If you wish to remove a single controller, use the `preFX.remove(fx)` or `postFX.remove(fx)` methods instead.
		
		If you wish to clear a single controller, use the `preFX.clear()` or `postFX.clear()` methods instead.
	**/
	function clearFX():NineSlice;
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
	function setScrollFactor(x:Float, ?y:Float):NineSlice;
	/**
		The Texture this Game Object is using to render with.
	**/
	var texture : ts.AnyOf2<phaser.textures.Texture, phaser.textures.CanvasTexture>;
	/**
		The Texture Frame this Game Object is using to render with.
	**/
	var frame : phaser.textures.Frame;
	/**
		Sets the texture and frame this Game Object will use to render with.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
		
		Calling this method will modify the `width` and `height` properties of your Game Object.
		
		It will also change the `origin` if the Frame has a custom pivot point, as exported from packages like Texture Packer.
	**/
	function setTexture(key:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>, ?updateSize:Bool, ?updateOrigin:Bool):NineSlice;
	/**
		Sets the frame this Game Object will use to render with.
		
		If you pass a string or index then the Frame has to belong to the current Texture being used
		by this Game Object.
		
		If you pass a Frame instance, then the Texture being used by this Game Object will also be updated.
		
		Calling `setFrame` will modify the `width` and `height` properties of your Game Object.
		
		It will also change the `origin` if the Frame has a custom pivot point, as exported from packages like Texture Packer.
	**/
	function setFrame(frame:ts.AnyOf3<String, Float, phaser.textures.Frame>, ?updateSize:Bool, ?updateOrigin:Bool):NineSlice;
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
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):NineSlice;
	/**
		Copies an object's coordinates to this Game Object's position.
	**/
	function copyPosition(source:ts.AnyOf3<phaser.types.math.Vector2Like, phaser.types.math.Vector3Like, phaser.types.math.Vector4Like>):NineSlice;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):NineSlice;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):NineSlice;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):NineSlice;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(?x:Float, ?y:Float):NineSlice;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):NineSlice;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):NineSlice;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):NineSlice;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):NineSlice;
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
	function setVisible(value:Bool):NineSlice;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):NineSlice;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):NineSlice;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):NineSlice;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():NineSlice;
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
	function setData<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):NineSlice;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:String, ?amount:Float):NineSlice;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:String):NineSlice;
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
	function setInteractive(?hitArea:Dynamic, ?callback:phaser.types.input.HitAreaCallback, ?dropZone:Bool):NineSlice;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():NineSlice;
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
	function removeInteractive():NineSlice;
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
	function addToDisplayList(?displayList:ts.AnyOf2<Layer, DisplayList>):NineSlice;
	/**
		Adds this Game Object to the Update List belonging to the Scene.
		
		When a Game Object is added to the Update List it will have its `preUpdate` method called
		every game frame. This method is passed two parameters: `delta` and `time`.
		
		If you wish to run your own logic within `preUpdate` then you should always call
		`super.preUpdate(delta, time)` within it, or it may fail to process required operations,
		such as Sprite animations.
	**/
	function addToUpdateList():NineSlice;
	/**
		Removes this Game Object from the Display List it is currently on.
		
		A Game Object can only exist on one Display List at any given time, but may move freely removed
		and added back at a later stage.
		
		You can query which list it is on by looking at the `Phaser.GameObjects.GameObject#displayList` property.
		
		If a Game Object isn't on any Display List, it will not be rendered. If you just wish to temporarly
		disable it from rendering, consider using the `setVisible` method, instead.
	**/
	function removeFromDisplayList():NineSlice;
	/**
		Removes this Game Object from the Scene's Update List.
		
		When a Game Object is on the Update List, it will have its `preUpdate` method called
		every game frame. Calling this method will remove it from the list, preventing this.
		
		Removing a Game Object from the Update List will stop most internal functions working.
		For example, removing a Sprite from the Update List will prevent it from being able to
		run animations.
	**/
	function removeFromUpdateList():NineSlice;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):NineSlice;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):NineSlice;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):NineSlice;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):NineSlice;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):NineSlice;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):NineSlice;
	static var prototype : NineSlice;
}