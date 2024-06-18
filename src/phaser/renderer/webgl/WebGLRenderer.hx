package phaser.renderer.webgl;

/**
	WebGLRenderer is a class that contains the needed functionality to keep the
	WebGLRenderingContext state clean. The main idea of the WebGLRenderer is to keep track of
	any context change that happens for WebGL rendering inside of Phaser. This means
	if raw webgl functions are called outside the WebGLRenderer of the Phaser WebGL
	rendering ecosystem they might pollute the current WebGLRenderingContext state producing
	unexpected behavior. It's recommended that WebGL interaction is done through
	WebGLRenderer and/or WebGLPipeline.
**/
@:native("Phaser.Renderer.WebGL.WebGLRenderer") extern class WebGLRenderer extends phaser.events.EventEmitter {
	function new(game:phaser.Game);
	/**
		Checks to see if the given diffuse and normal map textures are already bound, or not.
	**/
	function isNewNormalMap(texture:phaser.renderer.webgl.wrappers.WebGLTextureWrapper, normalMap:phaser.renderer.webgl.wrappers.WebGLTextureWrapper):Bool;
	/**
		The local configuration settings of this WebGL Renderer.
	**/
	var config : Dynamic;
	/**
		The Game instance which owns this WebGL Renderer.
	**/
	var game : phaser.Game;
	/**
		A constant which allows the renderer to be easily identified as a WebGL Renderer.
	**/
	var type : Float;
	/**
		An instance of the Pipeline Manager class, that handles all WebGL Pipelines.
		
		Use this to manage all of your interactions with pipelines, such as adding, getting,
		setting and rendering them.
		
		The Pipeline Manager class is created in the `init` method and then populated
		with pipelines during the `boot` method.
		
		Prior to Phaser v3.50.0 this was just a plain JavaScript object, not a class.
	**/
	var pipelines : PipelineManager;
	/**
		The width of the canvas being rendered to.
		This is populated in the onResize event handler.
	**/
	var width : Float;
	/**
		The height of the canvas being rendered to.
		This is populated in the onResize event handler.
	**/
	var height : Float;
	/**
		The canvas which this WebGL Renderer draws to.
	**/
	var canvas : js.html.CanvasElement;
	/**
		An array of blend modes supported by the WebGL Renderer.
		
		This array includes the default blend modes as well as any custom blend modes added through {@link #addBlendMode}.
	**/
	var blendModes : Array<Dynamic>;
	/**
		This property is set to `true` if the WebGL context of the renderer is lost.
	**/
	var contextLost : Bool;
	/**
		Details about the currently scheduled snapshot.
		
		If a non-null `callback` is set in this object, a snapshot of the canvas will be taken after the current frame is fully rendered.
	**/
	var snapshotState : phaser.types.renderer.snapshot.SnapshotState;
	/**
		The maximum number of textures the GPU can handle. The minimum under the WebGL1 spec is 8.
		This is set via the Game Config `maxTextures` property and should never be changed after boot.
	**/
	var maxTextures : Float;
	/**
		An array of the available WebGL texture units, used to populate the uSampler uniforms.
		
		This array is populated during the init phase and should never be changed after boot.
	**/
	var textureIndexes : Array<Dynamic>;
	/**
		A list of all WebGLBufferWrappers that have been created by this renderer.
	**/
	var glBufferWrappers : Array<phaser.renderer.webgl.wrappers.WebGLBufferWrapper>;
	/**
		A list of all WebGLProgramWrappers that have been created by this renderer.
	**/
	var glProgramWrappers : Array<phaser.renderer.webgl.wrappers.WebGLProgramWrapper>;
	/**
		A list of all WebGLTextureWrappers that have been created by this renderer.
	**/
	var glTextureWrappers : Array<phaser.renderer.webgl.wrappers.WebGLTextureWrapper>;
	/**
		A list of all WebGLFramebufferWrappers that have been created by this renderer.
	**/
	var glFramebufferWrappers : Array<phaser.renderer.webgl.wrappers.WebGLFramebufferWrapper>;
	/**
		A list of all WebGLAttribLocationWrappers that have been created by this renderer.
	**/
	var glAttribLocationWrappers : Array<phaser.renderer.webgl.wrappers.WebGLAttribLocationWrapper>;
	/**
		A list of all WebGLUniformLocationWrappers that have been created by this renderer.
	**/
	var glUniformLocationWrappers : Array<phaser.renderer.webgl.wrappers.WebGLUniformLocationWrapper>;
	/**
		The currently bound framebuffer in use.
	**/
	var currentFramebuffer : phaser.renderer.webgl.wrappers.WebGLFramebufferWrapper;
	/**
		A stack into which the frame buffer objects are pushed and popped.
	**/
	var fboStack : Array<phaser.renderer.webgl.wrappers.WebGLFramebufferWrapper>;
	/**
		Current WebGLProgram in use.
	**/
	var currentProgram : phaser.renderer.webgl.wrappers.WebGLProgramWrapper;
	/**
		Current blend mode in use
	**/
	var currentBlendMode : Float;
	/**
		Indicates if the the scissor state is enabled in WebGLRenderingContext
	**/
	var currentScissorEnabled : Bool;
	/**
		Stores the current scissor data
	**/
	var currentScissor : js.lib.Uint32Array;
	/**
		Stack of scissor data
	**/
	var scissorStack : js.lib.Uint32Array;
	/**
		The handler to invoke when the context is lost.
		This should not be changed and is set in the boot method.
	**/
	var contextLostHandler : haxe.Constraints.Function;
	/**
		The handler to invoke when the context is restored.
		This should not be changed and is set in the boot method.
	**/
	var contextRestoredHandler : haxe.Constraints.Function;
	/**
		The underlying WebGL context of the renderer.
	**/
	var gl : js.html.webgl.RenderingContext;
	/**
		Array of strings that indicate which WebGL extensions are supported by the browser.
		This is populated in the `boot` method.
	**/
	var supportedExtensions : Array<String>;
	/**
		If the browser supports the `ANGLE_instanced_arrays` extension, this property will hold
		a reference to the glExtension for it.
	**/
	var instancedArraysExtension : js.html.webgl.extension.ANGLEInstancedArrays;
	/**
		If the browser supports the `OES_vertex_array_object` extension, this property will hold
		a reference to the glExtension for it.
	**/
	var vaoExtension : js.html.webgl.extension.OESVertexArrayObject;
	/**
		The WebGL Extensions loaded into the current context.
	**/
	var extensions : Dynamic;
	/**
		Stores the current WebGL component formats for further use.
		
		This array is populated in the `init` method.
	**/
	var glFormats : Array<Dynamic>;
	/**
		Stores the WebGL texture compression formats that this device and browser supports.
		
		Support for using compressed texture formats was added in Phaser version 3.60.
	**/
	var compression : phaser.types.renderer.webgl.WebGLTextureCompression;
	/**
		Cached drawing buffer height to reduce gl calls.
	**/
	final drawingBufferHeight : Float;
	/**
		A blank 32x32 transparent texture, as used by the Graphics system where needed.
		This is set in the `boot` method.
	**/
	final blankTexture : phaser.renderer.webgl.wrappers.WebGLTextureWrapper;
	/**
		A blank 1x1 #7f7fff texture, a flat normal map,
		as used by the Graphics system where needed.
		This is set in the `boot` method.
	**/
	final normalTexture : phaser.renderer.webgl.wrappers.WebGLTextureWrapper;
	/**
		A pure white 4x4 texture, as used by the Graphics system where needed.
		This is set in the `boot` method.
	**/
	final whiteTexture : phaser.renderer.webgl.wrappers.WebGLTextureWrapper;
	/**
		The total number of masks currently stacked.
	**/
	var maskCount : Float;
	/**
		The mask stack.
	**/
	var maskStack : Array<phaser.display.masks.GeometryMask>;
	/**
		Internal property that tracks the currently set mask.
	**/
	var currentMask : Dynamic;
	/**
		Internal property that tracks the currently set camera mask.
	**/
	var currentCameraMask : Dynamic;
	/**
		Internal gl function mapping for uniform look-up.
		https://developer.mozilla.org/en-US/docs/Web/API/WebGLRenderingContext/uniform
	**/
	var glFuncMap : Dynamic;
	/**
		The `type` of the Game Object being currently rendered.
		This can be used by advanced render functions for batching look-ahead.
	**/
	var currentType : String;
	/**
		Is the `type` of the Game Object being currently rendered different than the
		type of the object before it in the display list? I.e. it's a 'new' type.
	**/
	var newType : Bool;
	/**
		Does the `type` of the next Game Object in the display list match that
		of the object being currently rendered?
	**/
	var nextTypeMatch : Bool;
	/**
		Is the Game Object being currently rendered the final one in the list?
	**/
	var finalType : Bool;
	/**
		The mipmap magFilter to be used when creating textures.
		
		You can specify this as a string in the game config, i.e.:
		
		`render: { mipmapFilter: 'NEAREST_MIPMAP_LINEAR' }`
		
		The 6 options for WebGL1 are, in order from least to most computationally expensive:
		
		NEAREST (for pixel art)
		LINEAR (the default)
		NEAREST_MIPMAP_NEAREST
		LINEAR_MIPMAP_NEAREST
		NEAREST_MIPMAP_LINEAR
		LINEAR_MIPMAP_LINEAR
		
		Mipmaps only work with textures that are fully power-of-two in size.
		
		For more details see https://webglfundamentals.org/webgl/lessons/webgl-3d-textures.html
		
		As of v3.60 no mipmaps will be generated unless a string is given in
		the game config. This saves on VRAM use when it may not be required.
		To obtain the previous result set the property to `LINEAR` in the config.
	**/
	var mipmapFilter : Float;
	/**
		Has this renderer fully booted yet?
	**/
	var isBooted : Bool;
	/**
		A Render Target you can use to capture the current state of the Renderer.
		
		A Render Target encapsulates a framebuffer and texture for the WebGL Renderer.
	**/
	var renderTarget : RenderTarget;
	/**
		The global game Projection matrix, used by shaders as 'uProjectionMatrix' uniform.
	**/
	var projectionMatrix : phaser.math.Matrix4;
	/**
		The cached width of the Projection matrix.
	**/
	var projectionWidth : Float;
	/**
		The cached height of the Projection matrix.
	**/
	var projectionHeight : Float;
	/**
		A RenderTarget used by the BitmapMask Pipeline.
		
		This is the source, i.e. the masked Game Object itself.
	**/
	var maskSource : RenderTarget;
	/**
		A RenderTarget used by the BitmapMask Pipeline.
		
		This is the target, i.e. the framebuffer the masked objects are drawn to.
	**/
	var maskTarget : RenderTarget;
	/**
		An instance of SpectorJS used for WebGL Debugging.
		
		Only available in the Phaser Debug build.
	**/
	var spector : haxe.Constraints.Function;
	/**
		Creates a new WebGLRenderingContext and initializes all internal state.
	**/
	function init(config:Dynamic):WebGLRenderer;
	/**
		This method is only available in the Debug Build of Phaser, or a build with the
		`WEBGL_DEBUG` flag set in the Webpack Config.
		
		Phaser v3.60 Debug has a build of Spector.js embedded in it, which is a WebGL inspector
		that allows for live inspection of your WebGL calls. Although it's easy to add the Spector
		extension to a desktop browsr, by embedding it in Phaser we can make it available in mobile
		browsers too, making it a powerful tool for debugging WebGL games on mobile devices where
		extensions are not permitted.
		
		See https://github.com/BabylonJS/Spector.js for more details.
		
		This method will capture the current WebGL frame and send it to the Spector.js tool for inspection.
	**/
	function captureFrame(?quickCapture:Bool, ?fullCapture:Bool):Void;
	/**
		This method is only available in the Debug Build of Phaser, or a build with the
		`WEBGL_DEBUG` flag set in the Webpack Config.
		
		Phaser v3.60 Debug has a build of Spector.js embedded in it, which is a WebGL inspector
		that allows for live inspection of your WebGL calls. Although it's easy to add the Spector
		extension to a desktop browsr, by embedding it in Phaser we can make it available in mobile
		browsers too, making it a powerful tool for debugging WebGL games on mobile devices where
		extensions are not permitted.
		
		See https://github.com/BabylonJS/Spector.js for more details.
		
		This method will capture the next WebGL frame and send it to the Spector.js tool for inspection.
	**/
	function captureNextFrame():Void;
	/**
		This method is only available in the Debug Build of Phaser, or a build with the
		`WEBGL_DEBUG` flag set in the Webpack Config.
		
		Phaser v3.60 Debug has a build of Spector.js embedded in it, which is a WebGL inspector
		that allows for live inspection of your WebGL calls. Although it's easy to add the Spector
		extension to a desktop browsr, by embedding it in Phaser we can make it available in mobile
		browsers too, making it a powerful tool for debugging WebGL games on mobile devices where
		extensions are not permitted.
		
		See https://github.com/BabylonJS/Spector.js for more details.
		
		This method will return the current FPS of the WebGL canvas.
	**/
	function getFps():Float;
	/**
		This method is only available in the Debug Build of Phaser, or a build with the
		`WEBGL_DEBUG` flag set in the Webpack Config.
		
		Phaser v3.60 Debug has a build of Spector.js embedded in it, which is a WebGL inspector
		that allows for live inspection of your WebGL calls. Although it's easy to add the Spector
		extension to a desktop browsr, by embedding it in Phaser we can make it available in mobile
		browsers too, making it a powerful tool for debugging WebGL games on mobile devices where
		extensions are not permitted.
		
		See https://github.com/BabylonJS/Spector.js for more details.
		
		This method adds a command with the name value in the list. This can be filtered in the search.
		All logs can be filtered searching for "LOG".
	**/
	function log(arguments:haxe.extern.Rest<Dynamic>):String;
	/**
		This method is only available in the Debug Build of Phaser, or a build with the
		`WEBGL_DEBUG` flag set in the Webpack Config.
		
		Phaser v3.60 Debug has a build of Spector.js embedded in it, which is a WebGL inspector
		that allows for live inspection of your WebGL calls. Although it's easy to add the Spector
		extension to a desktop browsr, by embedding it in Phaser we can make it available in mobile
		browsers too, making it a powerful tool for debugging WebGL games on mobile devices where
		extensions are not permitted.
		
		See https://github.com/BabylonJS/Spector.js for more details.
		
		This method will start a capture on the Phaser canvas. The capture will stop once it reaches
		the number of commands specified as a parameter, or after 10 seconds. If quick capture is true,
		the thumbnails are not captured in order to speed up the capture.
	**/
	function startCapture(?commandCount:Float, ?quickCapture:Bool, ?fullCapture:Bool):Void;
	/**
		This method is only available in the Debug Build of Phaser, or a build with the
		`WEBGL_DEBUG` flag set in the Webpack Config.
		
		Phaser v3.60 Debug has a build of Spector.js embedded in it, which is a WebGL inspector
		that allows for live inspection of your WebGL calls. Although it's easy to add the Spector
		extension to a desktop browsr, by embedding it in Phaser we can make it available in mobile
		browsers too, making it a powerful tool for debugging WebGL games on mobile devices where
		extensions are not permitted.
		
		See https://github.com/BabylonJS/Spector.js for more details.
		
		This method will stop the current capture and returns the result in JSON. It displays the
		result if the UI has been displayed. This returns undefined if the capture has not been completed
		or did not find any commands.
	**/
	function stopCapture():Dynamic;
	/**
		The event handler that manages the `resize` event dispatched by the Scale Manager.
	**/
	function onResize(gameSize:phaser.structs.Size, baseSize:phaser.structs.Size):Void;
	/**
		Binds the WebGL Renderers Render Target, so all drawn content is now redirected to it.
		
		Make sure to call `endCapture` when you are finished.
	**/
	function beginCapture(?width:Float, ?height:Float):Void;
	/**
		Unbinds the WebGL Renderers Render Target and returns it, stopping any further content being drawn to it.
		
		If the viewport or scissors were modified during the capture, you should reset them by calling
		`resetViewport` and `resetScissor` accordingly.
	**/
	function endCapture():RenderTarget;
	/**
		Resizes the drawing buffer to match that required by the Scale Manager.
	**/
	function resize(?width:Float, ?height:Float):WebGLRenderer;
	/**
		Determines which compressed texture formats this browser and device supports.
		
		Called automatically as part of the WebGL Renderer init process. If you need to investigate
		which formats it supports, see the `Phaser.Renderer.WebGL.WebGLRenderer#compression` property instead.
	**/
	function getCompressedTextures():phaser.types.renderer.webgl.WebGLTextureCompression;
	/**
		Returns a compressed texture format GLenum name based on the given format.
	**/
	function getCompressedTextureName(baseFormat:String, ?format:Float):String;
	/**
		Checks if the given compressed texture format is supported, or not.
	**/
	function supportsCompressedTexture(baseFormat:String, ?format:Float):Bool;
	/**
		Gets the aspect ratio of the WebGLRenderer dimensions.
	**/
	function getAspectRatio():Float;
	/**
		Sets the Projection Matrix of this renderer to the given dimensions.
	**/
	function setProjectionMatrix(width:Float, height:Float):WebGLRenderer;
	/**
		Resets the Projection Matrix back to this renderers width and height.
		
		This is called during `endCapture`, should the matrix have been changed
		as a result of the capture process.
	**/
	function resetProjectionMatrix():WebGLRenderer;
	/**
		Checks if a WebGL extension is supported
	**/
	function hasExtension(extensionName:String):Bool;
	/**
		Loads a WebGL extension
	**/
	function getExtension(extensionName:String):Dynamic;
	/**
		Flushes the current pipeline if the pipeline is bound
	**/
	function flush():Void;
	/**
		Pushes a new scissor state. This is used to set nested scissor states.
	**/
	function pushScissor(x:Float, y:Float, width:Float, height:Float, ?drawingBufferHeight:Float):Array<Float>;
	/**
		Sets the current scissor state.
	**/
	function setScissor(x:Float, y:Float, width:Float, height:Float, ?drawingBufferHeight:Float):Void;
	/**
		Resets the gl scissor state to be whatever the current scissor is, if there is one, without
		modifying the scissor stack.
	**/
	function resetScissor():Void;
	/**
		Pops the last scissor state and sets it.
	**/
	function popScissor():Void;
	/**
		Is there an active stencil mask?
	**/
	function hasActiveStencilMask():Bool;
	/**
		Resets the gl viewport to the current renderer dimensions.
	**/
	function resetViewport():Void;
	/**
		Sets the blend mode to the value given.
		
		If the current blend mode is different from the one given, the pipeline is flushed and the new
		blend mode is enabled.
	**/
	function setBlendMode(blendModeId:Float, ?force:Bool):Bool;
	/**
		Creates a new custom blend mode for the renderer.
		
		See https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Constants#Blending_modes
	**/
	function addBlendMode(func:Array<Float>, equation:Float):Float;
	/**
		Updates the function bound to a given custom blend mode.
	**/
	function updateBlendMode(index:Float, func:haxe.Constraints.Function, equation:haxe.Constraints.Function):WebGLRenderer;
	/**
		Removes a custom blend mode from the renderer.
		Any Game Objects still using this blend mode will error, so be sure to clear them first.
	**/
	function removeBlendMode(index:Float):WebGLRenderer;
	/**
		Pushes a new framebuffer onto the FBO stack and makes it the currently bound framebuffer.
		
		If there was another framebuffer already bound it will force a pipeline flush.
		
		Call `popFramebuffer` to remove it again.
	**/
	function pushFramebuffer(framebuffer:phaser.renderer.webgl.wrappers.WebGLFramebufferWrapper, ?updateScissor:Bool, ?setViewport:Bool, ?texture:phaser.renderer.webgl.wrappers.WebGLTextureWrapper, ?clear:Bool):WebGLRenderer;
	/**
		Sets the given framebuffer as the active and currently bound framebuffer.
		
		If there was another framebuffer already bound it will force a pipeline flush.
		
		Typically, you should call `pushFramebuffer` instead of this method.
	**/
	function setFramebuffer(framebuffer:Null<phaser.renderer.webgl.wrappers.WebGLFramebufferWrapper>, ?updateScissor:Bool, ?setViewport:Bool, ?texture:phaser.renderer.webgl.wrappers.WebGLTextureWrapper, ?clear:Bool):WebGLRenderer;
	/**
		Pops the previous framebuffer from the fbo stack and sets it.
	**/
	function popFramebuffer(?updateScissor:Bool, ?setViewport:Bool):phaser.renderer.webgl.wrappers.WebGLFramebufferWrapper;
	/**
		Restores the previous framebuffer from the fbo stack and sets it.
	**/
	function restoreFramebuffer(?updateScissor:Bool, ?setViewport:Bool):Void;
	/**
		Binds a shader program.
		
		If there was a different program already bound it will force a pipeline flush first.
		
		If the same program given to this method is already set as the current program, no change
		will take place and this method will return `false`.
	**/
	function setProgram(program:phaser.renderer.webgl.wrappers.WebGLProgramWrapper):Bool;
	/**
		Rebinds whatever program `WebGLRenderer.currentProgram` is set as, without
		changing anything, or flushing.
	**/
	function resetProgram():WebGLRenderer;
	/**
		Creates a texture from an image source. If the source is not valid it creates an empty texture.
	**/
	function createTextureFromSource(source:Dynamic, width:Float, height:Float, scaleMode:Float, ?forceClamp:Bool):Null<phaser.renderer.webgl.wrappers.WebGLTextureWrapper>;
	/**
		A wrapper for creating a WebGLTextureWrapper. If no pixel data is passed it will create an empty texture.
	**/
	function createTexture2D(mipLevel:Float, minFilter:Float, magFilter:Float, wrapT:Float, wrapS:Float, format:Float, pixels:Null<Dynamic>, width:Null<Float>, height:Null<Float>, ?pma:Bool, ?forceSize:Bool, ?flipY:Bool):phaser.renderer.webgl.wrappers.WebGLTextureWrapper;
	/**
		Creates a WebGL Framebuffer object and optionally binds a depth stencil render buffer.
		
		This will unbind any currently bound framebuffer.
	**/
	function createFramebuffer(width:Float, height:Float, renderTexture:phaser.renderer.webgl.wrappers.WebGLTextureWrapper, ?addDepthStencilBuffer:Bool):phaser.renderer.webgl.wrappers.WebGLFramebufferWrapper;
	/**
		Binds necessary resources and renders the mask to a separated framebuffer.
		The framebuffer for the masked object is also bound for further use.
	**/
	function beginBitmapMask(mask:phaser.display.masks.BitmapMask, camera:phaser.cameras.scene2d.Camera):Void;
	/**
		Binds necessary resources and renders the mask to a separated framebuffer.
		The framebuffer for the masked object is also bound for further use.
	**/
	function drawBitmapMask(mask:phaser.display.masks.BitmapMask, camera:phaser.cameras.scene2d.Camera, bitmapMaskPipeline:phaser.renderer.webgl.pipelines.BitmapMaskPipeline):Void;
	/**
		Creates a WebGLProgram instance based on the given vertex and fragment shader source.
		
		Then compiles, attaches and links the program before wrapping and returning it.
	**/
	function createProgram(vertexShader:String, fragmentShader:String):phaser.renderer.webgl.wrappers.WebGLProgramWrapper;
	/**
		Wrapper for creating a vertex buffer.
	**/
	function createVertexBuffer(initialDataOrSize:js.lib.ArrayBuffer, bufferUsage:Float):phaser.renderer.webgl.wrappers.WebGLBufferWrapper;
	/**
		Creates a WebGLAttribLocationWrapper instance based on the given WebGLProgramWrapper and attribute name.
	**/
	function createAttribLocation(program:phaser.renderer.webgl.wrappers.WebGLProgramWrapper, name:String):Void;
	/**
		Creates a WebGLUniformLocationWrapper instance based on the given WebGLProgramWrapper and uniform name.
	**/
	function createUniformLocation(program:phaser.renderer.webgl.wrappers.WebGLProgramWrapper, name:String):Void;
	/**
		Wrapper for creating a vertex buffer.
	**/
	function createIndexBuffer(initialDataOrSize:js.lib.ArrayBuffer, bufferUsage:Float):phaser.renderer.webgl.wrappers.WebGLBufferWrapper;
	/**
		Removes a texture from the GPU.
	**/
	function deleteTexture(texture:phaser.renderer.webgl.wrappers.WebGLTextureWrapper):WebGLRenderer;
	/**
		Deletes a Framebuffer from the GL instance.
	**/
	function deleteFramebuffer(framebuffer:Null<phaser.renderer.webgl.wrappers.WebGLFramebufferWrapper>):WebGLRenderer;
	/**
		Deletes a WebGLProgram from the GL instance.
	**/
	function deleteProgram(program:phaser.renderer.webgl.wrappers.WebGLProgramWrapper):WebGLRenderer;
	/**
		Deletes a WebGLAttribLocation from the GL instance.
	**/
	function deleteAttribLocation(attrib:phaser.renderer.webgl.wrappers.WebGLAttribLocationWrapper):Void;
	/**
		Deletes a WebGLUniformLocation from the GL instance.
	**/
	function deleteUniformLocation(uniform:phaser.renderer.webgl.wrappers.WebGLUniformLocationWrapper):Void;
	/**
		Deletes a WebGLBuffer from the GL instance.
	**/
	function deleteBuffer(vertexBuffer:phaser.renderer.webgl.wrappers.WebGLBufferWrapper):WebGLRenderer;
	/**
		Controls the pre-render operations for the given camera.
		Handles any clipping needed by the camera and renders the background color if a color is visible.
	**/
	function preRenderCamera(camera:phaser.cameras.scene2d.Camera):Void;
	/**
		Controls the post-render operations for the given camera.
		
		Renders the foreground camera effects like flash and fading, then resets the current scissor state.
	**/
	function postRenderCamera(camera:phaser.cameras.scene2d.Camera):Void;
	/**
		Clears the current vertex buffer and updates pipelines.
	**/
	function preRender():Void;
	/**
		The core render step for a Scene Camera.
		
		Iterates through the given array of Game Objects and renders them with the given Camera.
		
		This is called by the `CameraManager.render` method. The Camera Manager instance belongs to a Scene, and is invoked
		by the Scene Systems.render method.
		
		This method is not called if `Camera.visible` is `false`, or `Camera.alpha` is zero.
	**/
	function render(scene:phaser.Scene, children:Array<phaser.gameobjects.GameObject>, camera:phaser.cameras.scene2d.Camera):Void;
	/**
		The post-render step happens after all Cameras in all Scenes have been rendered.
	**/
	function postRender():Void;
	/**
		Disables the STENCIL_TEST but does not change the status
		of the current stencil mask.
	**/
	function clearStencilMask():Void;
	/**
		Restores the current stencil function to the one that was in place
		before `clearStencilMask` was called.
	**/
	function restoreStencilMask():Void;
	/**
		Schedules a snapshot of the entire game viewport to be taken after the current frame is rendered.
		
		To capture a specific area see the `snapshotArea` method. To capture a specific pixel, see `snapshotPixel`.
		
		Only one snapshot can be active _per frame_. If you have already called `snapshotPixel`, for example, then
		calling this method will override it.
		
		Snapshots work by using the WebGL `readPixels` feature to grab every pixel from the frame buffer into an ArrayBufferView.
		It then parses this, copying the contents to a temporary Canvas and finally creating an Image object from it,
		which is the image returned to the callback provided. All in all, this is a computationally expensive and blocking process,
		which gets more expensive the larger the canvas size gets, so please be careful how you employ this in your game.
	**/
	function snapshot(callback:phaser.types.renderer.snapshot.SnapshotCallback, ?type:String, ?encoderOptions:Float):WebGLRenderer;
	/**
		Schedules a snapshot of the given area of the game viewport to be taken after the current frame is rendered.
		
		To capture the whole game viewport see the `snapshot` method. To capture a specific pixel, see `snapshotPixel`.
		
		Only one snapshot can be active _per frame_. If you have already called `snapshotPixel`, for example, then
		calling this method will override it.
		
		Snapshots work by using the WebGL `readPixels` feature to grab every pixel from the frame buffer into an ArrayBufferView.
		It then parses this, copying the contents to a temporary Canvas and finally creating an Image object from it,
		which is the image returned to the callback provided. All in all, this is a computationally expensive and blocking process,
		which gets more expensive the larger the canvas size gets, so please be careful how you employ this in your game.
	**/
	function snapshotArea(x:Float, y:Float, width:Float, height:Float, callback:phaser.types.renderer.snapshot.SnapshotCallback, ?type:String, ?encoderOptions:Float):WebGLRenderer;
	/**
		Schedules a snapshot of the given pixel from the game viewport to be taken after the current frame is rendered.
		
		To capture the whole game viewport see the `snapshot` method. To capture a specific area, see `snapshotArea`.
		
		Only one snapshot can be active _per frame_. If you have already called `snapshotArea`, for example, then
		calling this method will override it.
		
		Unlike the other two snapshot methods, this one will return a `Color` object containing the color data for
		the requested pixel. It doesn't need to create an internal Canvas or Image object, so is a lot faster to execute,
		using less memory.
	**/
	function snapshotPixel(x:Float, y:Float, callback:phaser.types.renderer.snapshot.SnapshotCallback):WebGLRenderer;
	/**
		Takes a snapshot of the given area of the given frame buffer.
		
		Unlike the other snapshot methods, this one is processed immediately and doesn't wait for the next render.
		
		Snapshots work by using the WebGL `readPixels` feature to grab every pixel from the frame buffer into an ArrayBufferView.
		It then parses this, copying the contents to a temporary Canvas and finally creating an Image object from it,
		which is the image returned to the callback provided. All in all, this is a computationally expensive and blocking process,
		which gets more expensive the larger the canvas size gets, so please be careful how you employ this in your game.
	**/
	function snapshotFramebuffer(framebuffer:phaser.renderer.webgl.wrappers.WebGLFramebufferWrapper, bufferWidth:Float, bufferHeight:Float, callback:phaser.types.renderer.snapshot.SnapshotCallback, ?getPixel:Bool, ?x:Float, ?y:Float, ?width:Float, ?height:Float, ?type:String, ?encoderOptions:Float):WebGLRenderer;
	/**
		Creates a new WebGL Texture based on the given Canvas Element.
		
		If the `dstTexture` parameter is given, the WebGL Texture is updated, rather than created fresh.
	**/
	function canvasToTexture(srcCanvas:js.html.CanvasElement, ?dstTexture:phaser.renderer.webgl.wrappers.WebGLTextureWrapper, ?noRepeat:Bool, ?flipY:Bool):phaser.renderer.webgl.wrappers.WebGLTextureWrapper;
	/**
		Creates a new WebGL Texture based on the given Canvas Element.
	**/
	function createCanvasTexture(srcCanvas:js.html.CanvasElement, ?noRepeat:Bool, ?flipY:Bool):phaser.renderer.webgl.wrappers.WebGLTextureWrapper;
	/**
		Updates a WebGL Texture based on the given Canvas Element.
	**/
	function updateCanvasTexture(srcCanvas:js.html.CanvasElement, dstTexture:phaser.renderer.webgl.wrappers.WebGLTextureWrapper, ?flipY:Bool, ?noRepeat:Bool):phaser.renderer.webgl.wrappers.WebGLTextureWrapper;
	/**
		Creates or updates a WebGL Texture based on the given HTML Video Element.
		
		If the `dstTexture` parameter is given, the WebGL Texture is updated, rather than created fresh.
	**/
	function videoToTexture(srcVideo:js.html.VideoElement, ?dstTexture:phaser.renderer.webgl.wrappers.WebGLTextureWrapper, ?noRepeat:Bool, ?flipY:Bool):phaser.renderer.webgl.wrappers.WebGLTextureWrapper;
	/**
		Creates a new WebGL Texture based on the given HTML Video Element.
	**/
	function createVideoTexture(srcVideo:js.html.VideoElement, ?noRepeat:Bool, ?flipY:Bool):phaser.renderer.webgl.wrappers.WebGLTextureWrapper;
	/**
		Updates a WebGL Texture based on the given HTML Video Element.
	**/
	function updateVideoTexture(srcVideo:js.html.VideoElement, dstTexture:phaser.renderer.webgl.wrappers.WebGLTextureWrapper, ?flipY:Bool, ?noRepeat:Bool):phaser.renderer.webgl.wrappers.WebGLTextureWrapper;
	/**
		Create a WebGLTexture from a Uint8Array.
		
		The Uint8Array is assumed to be RGBA values, one byte per color component.
		
		The texture will be filtered with `gl.NEAREST` and will not be mipped.
	**/
	function createUint8ArrayTexture(data:js.lib.Uint8Array, width:Float, height:Float):phaser.renderer.webgl.wrappers.WebGLTextureWrapper;
	/**
		Sets the minification and magnification filter for a texture.
	**/
	function setTextureFilter(texture:phaser.renderer.webgl.wrappers.WebGLTextureWrapper, filter:Float):WebGLRenderer;
	/**
		Returns the largest texture size (either width or height) that can be created.
		Note that VRAM may not allow a texture of any given size, it just expresses
		hardware / driver support for a given size.
	**/
	function getMaxTextureSize():Float;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebGLRenderer;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebGLRenderer;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebGLRenderer;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):WebGLRenderer;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):WebGLRenderer;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):WebGLRenderer;
	static var prototype : WebGLRenderer;
}