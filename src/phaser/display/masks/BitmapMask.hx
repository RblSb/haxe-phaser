package phaser.display.masks;

/**
	A Bitmap Mask combines the alpha (opacity) of a masked pixel with the alpha of another pixel.
	Unlike the Geometry Mask, which is a clipping path, a Bitmap Mask behaves like an alpha mask,
	not a clipping path. It is only available when using the WebGL Renderer.
	
	A Bitmap Mask can use any Game Object or Dynamic Texture to determine the alpha of each pixel of the masked Game Object(s).
	For any given point of a masked Game Object's texture, the pixel's alpha will be multiplied by the alpha
	of the pixel at the same position in the Bitmap Mask's Game Object. The color of the pixel from the
	Bitmap Mask doesn't matter.
	
	For example, if a pure blue pixel with an alpha of 0.95 is masked with a pure red pixel with an
	alpha of 0.5, the resulting pixel will be pure blue with an alpha of 0.475. Naturally, this means
	that a pixel in the mask with an alpha of 0 will hide the corresponding pixel in all masked Game Objects.
	A pixel with an alpha of 1 in the masked Game Object will receive the same alpha as the
	corresponding pixel in the mask.
	
	Note: You cannot combine Bitmap Masks and Blend Modes on the same Game Object. You can, however,
	combine Geometry Masks and Blend Modes together.
	
	The Bitmap Mask's location matches the location of its Game Object, not the location of the
	masked objects. Moving or transforming the underlying Game Object will change the mask
	(and affect the visibility of any masked objects), whereas moving or transforming a masked object
	will not affect the mask.
	
	The Bitmap Mask will not render its Game Object by itself. If the Game Object is not in a
	Scene's display list, it will only be used for the mask and its full texture will not be directly
	visible. Adding the underlying Game Object to a Scene will not cause any problems - it will
	render as a normal Game Object and will also serve as a mask.
**/
@:native("Phaser.Display.Masks.BitmapMask") extern class BitmapMask {
	function new(scene:phaser.Scene, ?maskObject:ts.AnyOf2<phaser.gameobjects.GameObject, phaser.textures.DynamicTexture>, ?x:Float, ?y:Float, ?texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf3<String, Float, phaser.textures.Frame>);
	/**
		The Game Object that is used as the mask. Must use a texture, such as a Sprite.
	**/
	var bitmapMask : ts.AnyOf2<phaser.gameobjects.GameObject, phaser.textures.DynamicTexture>;
	/**
		Whether to invert the masks alpha.
		
		If `true`, the alpha of the masking pixel will be inverted before it's multiplied with the masked pixel.
		
		Essentially, this means that a masked area will be visible only if the corresponding area in the mask is invisible.
	**/
	var invertAlpha : Bool;
	/**
		Is this mask a stencil mask? This is false by default and should not be changed.
	**/
	final isStencil : Bool;
	/**
		Sets a new Game Object or Dynamic Texture for this Bitmap Mask to use.
		
		If a Game Object it must have a texture, such as a Sprite.
		
		You can update the source of the mask as often as you like.
	**/
	function setBitmap(maskObject:ts.AnyOf2<phaser.gameobjects.GameObject, phaser.textures.DynamicTexture>):Void;
	/**
		Prepares the WebGL Renderer to render a Game Object with this mask applied.
		
		This renders the masking Game Object to the mask framebuffer and switches to the main framebuffer so that the masked Game Object will be rendered to it instead of being rendered directly to the frame.
	**/
	function preRenderWebGL(renderer:ts.AnyOf2<phaser.renderer.canvas.CanvasRenderer, phaser.renderer.webgl.WebGLRenderer>, maskedObject:phaser.gameobjects.GameObject, camera:phaser.cameras.scene2d.Camera):Void;
	/**
		Finalizes rendering of a masked Game Object.
		
		This resets the previously bound framebuffer and switches the WebGL Renderer to the Bitmap Mask Pipeline, which uses a special fragment shader to apply the masking effect.
	**/
	function postRenderWebGL(renderer:ts.AnyOf2<phaser.renderer.canvas.CanvasRenderer, phaser.renderer.webgl.WebGLRenderer>, camera:phaser.cameras.scene2d.Camera, ?renderTarget:phaser.renderer.webgl.RenderTarget):Void;
	/**
		This is a NOOP method. Bitmap Masks are not supported by the Canvas Renderer.
	**/
	function preRenderCanvas(renderer:ts.AnyOf2<phaser.renderer.canvas.CanvasRenderer, phaser.renderer.webgl.WebGLRenderer>, mask:phaser.gameobjects.GameObject, camera:phaser.cameras.scene2d.Camera):Void;
	/**
		This is a NOOP method. Bitmap Masks are not supported by the Canvas Renderer.
	**/
	function postRenderCanvas(renderer:ts.AnyOf2<phaser.renderer.canvas.CanvasRenderer, phaser.renderer.webgl.WebGLRenderer>):Void;
	/**
		Destroys this BitmapMask and nulls any references it holds.
		
		Note that if a Game Object is currently using this mask it will _not_ automatically detect you have destroyed it,
		so be sure to call `clearMask` on any Game Object using it, before destroying it.
	**/
	function destroy():Void;
	static var prototype : BitmapMask;
}