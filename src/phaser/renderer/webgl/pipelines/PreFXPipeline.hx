package phaser.renderer.webgl.pipelines;

/**
	The Pre FX Pipeline is a special kind of pipeline designed specifically for applying
	special effects to Game Objects before they are rendered. Where-as the Post FX Pipeline applies an effect _after_ the
	object has been rendered, the Pre FX Pipeline allows you to control the rendering of
	the object itself - passing it off to its own texture, where multi-buffer compositing
	can take place.
	
	You can only use the PreFX Pipeline on the following types of Game Objects, or those
	that extend from them:
	
	Sprite
	Image
	Text
	TileSprite
	RenderTexture
	Video
**/
@:native("Phaser.Renderer.WebGL.Pipelines.PreFXPipeline") extern class PreFXPipeline extends phaser.renderer.webgl.WebGLPipeline {
	function new(config:phaser.types.renderer.webgl.WebGLPipelineConfig);
	/**
		A reference to the Draw Sprite Shader belonging to this Pipeline.
		
		This shader is used when the sprite is drawn to this fbo (or to the game if drawToFrame is false)
		
		This property is set during the `boot` method.
	**/
	var drawSpriteShader : phaser.renderer.webgl.WebGLShader;
	/**
		A reference to the Copy Shader belonging to this Pipeline.
		
		This shader is used when you call the `copySprite` method.
		
		This property is set during the `boot` method.
	**/
	var copyShader : phaser.renderer.webgl.WebGLShader;
	/**
		A reference to the Game Draw Shader belonging to this Pipeline.
		
		This shader draws the fbo to the game.
		
		This property is set during the `boot` method.
	**/
	var gameShader : phaser.renderer.webgl.WebGLShader;
	/**
		A reference to the Color Matrix Shader belonging to this Pipeline.
		
		This property is set during the `boot` method.
	**/
	var colorMatrixShader : phaser.renderer.webgl.WebGLShader;
	/**
		Raw byte buffer of vertices used specifically during the copySprite method.
	**/
	final quadVertexData : js.lib.ArrayBuffer;
	/**
		The WebGLBuffer that holds the quadVertexData.
	**/
	final quadVertexBuffer : phaser.renderer.webgl.wrappers.WebGLBufferWrapper;
	/**
		Float32 view of the quad array buffer.
	**/
	var quadVertexViewF32 : js.lib.Float32Array;
	/**
		The full-screen Render Target that the sprite is first drawn to.
	**/
	var fsTarget : phaser.renderer.webgl.RenderTarget;
	/**
		Adds the vertices data into the batch and flushes if full.
		
		Assumes 6 vertices in the following arrangement:
		
		```
		0----3
		|\  B|
		| \  |
		|  \ |
		| A \|
		|    \
		1----2
		```
		
		Where x0 / y0 = 0, x1 / y1 = 1, x2 / y2 = 2 and x3 / y3 = 3
	**/
	function batchQuad(gameObject:Null<phaser.gameobjects.GameObject>, x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float, u0:Float, v0:Float, u1:Float, v1:Float, tintTL:Float, tintTR:Float, tintBL:Float, tintBR:Float, tintEffect:ts.AnyOf2<Float, Bool>, ?texture:phaser.renderer.webgl.wrappers.WebGLTextureWrapper):Bool;
	/**
		This callback is invoked when a sprite is drawn by this pipeline.
		
		It will fire after the shader has been set, but before the sprite has been drawn,
		so use it to set any additional uniforms you may need.
		
		Note: Manipulating the Sprite during this callback will _not_ change how it is drawn to the Render Target.
	**/
	function onDrawSprite(gameObject:phaser.gameobjects.Sprite, target:phaser.renderer.webgl.RenderTarget):Void;
	/**
		This callback is invoked when you call the `copySprite` method.
		
		It will fire after the shader has been set, but before the source target has been copied,
		so use it to set any additional uniforms you may need.
		
		Note: Manipulating the Sprite during this callback will _not_ change the Render Targets.
	**/
	function onCopySprite(source:phaser.renderer.webgl.RenderTarget, target:phaser.renderer.webgl.RenderTarget, gameObject:phaser.gameobjects.Sprite):Void;
	/**
		Copy the `source` Render Target to the `target` Render Target.
		
		No target resizing takes place. If the `source` Render Target is larger than the `target`,
		then only a portion the same size as the `target` dimensions is copied across.
		
		Calling this method will invoke the `onCopySprite` handler and will also call
		the `onFXCopy` callback on the Sprite. Both of these happen prior to the copy, allowing you
		to use them to set shader uniforms and other values.
		
		You can optionally pass in a ColorMatrix. If so, it will use the ColorMatrix shader
		during the copy, allowing you to manipulate the colors to a fine degree.
		See the `ColorMatrix` class for more details.
	**/
	function copySprite(source:phaser.renderer.webgl.RenderTarget, target:phaser.renderer.webgl.RenderTarget, ?clear:Bool, ?clearAlpha:Bool, ?eraseMode:Bool, ?colorMatrix:phaser.display.ColorMatrix, ?shader:phaser.renderer.webgl.WebGLShader):Void;
	/**
		Draws the `source` Render Target to the `target` Render Target.
		
		This is done using whatever the currently bound shader is. This method does
		not set a shader. All it does is bind the source texture, set the viewport and UVs
		then bind the target framebuffer, clears it and draws the source to it.
		
		At the end a null framebuffer is bound. No other clearing-up takes place, so
		use this method carefully.
	**/
	function copy(source:phaser.renderer.webgl.RenderTarget, target:phaser.renderer.webgl.RenderTarget):Void;
	/**
		Draws the `source1` and `source2` Render Targets to the `target` Render Target
		using a linear blend effect, which is controlled by the `strength` parameter.
	**/
	function blendFrames(source1:phaser.renderer.webgl.RenderTarget, source2:phaser.renderer.webgl.RenderTarget, ?target:phaser.renderer.webgl.RenderTarget, ?strength:Float, ?clearAlpha:Bool):Void;
	/**
		Draws the `source1` and `source2` Render Targets to the `target` Render Target
		using an additive blend effect, which is controlled by the `strength` parameter.
	**/
	function blendFramesAdditive(source1:phaser.renderer.webgl.RenderTarget, source2:phaser.renderer.webgl.RenderTarget, ?target:phaser.renderer.webgl.RenderTarget, ?strength:Float, ?clearAlpha:Bool):Void;
	/**
		This method will copy the given Render Target to the game canvas using the `copyShader`.
		
		This applies the results of the copy shader during the draw.
		
		If you wish to copy the target without any effects see the `copyToGame` method instead.
		
		This method should be the final thing called in your pipeline.
	**/
	function drawToGame(source:phaser.renderer.webgl.RenderTarget):Void;
	/**
		This method will copy the given Render Target to the game canvas using the `gameShader`.
		
		Unless you've changed it, the `gameShader` copies the target without modifying it, just
		ensuring it is placed in the correct location on the canvas.
		
		If you wish to draw the target with and apply the fragment shader at the same time,
		see the `drawToGame` method instead.
		
		This method should be the final thing called in your pipeline.
	**/
	function copyToGame(source:phaser.renderer.webgl.RenderTarget):Void;
	/**
		This method is called by `drawToGame` and `copyToGame`. It takes the source Render Target
		and copies it back to the game canvas, or the next frame buffer in the stack, and should
		be considered the very last thing this pipeline does.
		
		You don't normally need to call this method, or override it, however it is left public
		should you wish to do so.
		
		Note that it does _not_ set a shader. You should do this yourself if invoking this.
	**/
	function bindAndDraw(source:phaser.renderer.webgl.RenderTarget):Void;
	/**
		This method is called every time the `batchSprite` method is called and is passed a
		reference to the current render target.
		
		If you override this method, then it should make sure it calls either the
		`drawToGame` or `copyToGame` methods as the final thing it does. However, you can do as
		much additional processing as you like prior to this.
	**/
	function onDraw(target:phaser.renderer.webgl.RenderTarget, ?swapTarget:phaser.renderer.webgl.RenderTarget, ?altSwapTarget:phaser.renderer.webgl.RenderTarget):Void;
	/**
		Set the UV values for the 6 vertices that make up the quad used by the copy shader.
		
		Be sure to call `resetUVs` once you have finished manipulating the UV coordinates.
	**/
	function setUVs(uA:Float, vA:Float, uB:Float, vB:Float, uC:Float, vC:Float, uD:Float, vD:Float):Void;
	/**
		Sets the vertex UV coordinates of the quad used by the copy shaders
		so that they correctly adjust the texture coordinates for a blit frame effect.
		
		Be sure to call `resetUVs` once you have finished manipulating the UV coordinates.
	**/
	function setTargetUVs(source:phaser.renderer.webgl.RenderTarget, target:phaser.renderer.webgl.RenderTarget):Void;
	/**
		Resets the quad vertice UV values to their default settings.
		
		The quad is used by the copy shader in this pipeline.
	**/
	function resetUVs():Void;
	/**
		Destroys all shader instances, removes all object references and nulls all external references.
	**/
	function destroy():PreFXPipeline;
	/**
		Sets the currently active shader within this pipeline.
	**/
	function setShader(shader:phaser.renderer.webgl.WebGLShader, ?setAttributes:Bool, ?vertexBuffer:phaser.renderer.webgl.wrappers.WebGLBufferWrapper):PreFXPipeline;
	/**
		Destroys all shaders currently set in the `WebGLPipeline.shaders` array and then parses the given
		`config` object, extracting the shaders from it, creating `WebGLShader` instances and finally
		setting them into the `shaders` array of this pipeline.
		
		This is a destructive process. Be very careful when you call it, should you need to.
	**/
	function setShadersFromConfig(config:phaser.types.renderer.webgl.WebGLPipelineConfig):PreFXPipeline;
	/**
		Resizes the properties used to describe the viewport.
		
		This method is called automatically by the renderer during its resize handler.
	**/
	function resize(width:Float, height:Float):PreFXPipeline;
	/**
		Adjusts this pipelines ortho Projection Matrix to use the given dimensions
		and resets the `uProjectionMatrix` uniform on all bound shaders.
		
		This method is called automatically by the renderer during its resize handler.
	**/
	function setProjectionMatrix(width:Float, height:Float):PreFXPipeline;
	/**
		This method is called every time the Pipeline Manager makes this pipeline the currently active one.
		
		It binds the resources and shader needed for this pipeline, including setting the vertex buffer
		and attribute pointers.
	**/
	function bind(?currentShader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		This method is called every time the Pipeline Manager rebinds this pipeline.
		
		It resets all shaders this pipeline uses, setting their attributes again.
	**/
	function rebind(?currentShader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		This method is called as a result of the `WebGLPipeline.batchQuad` method, right before a quad
		belonging to a Game Object is about to be added to the batch. When this is called, the
		renderer has just performed a flush. It will bind the current render target, if any are set
		and finally call the `onPreBatch` hook.
		
		It is also called as part of the `PipelineManager.preBatch` method when processing Post FX Pipelines.
	**/
	function preBatch(?gameObject:ts.AnyOf2<phaser.cameras.scene2d.Camera, phaser.gameobjects.GameObject>):PreFXPipeline;
	/**
		This method is called as a result of the `WebGLPipeline.batchQuad` method, right after a quad
		belonging to a Game Object has been added to the batch. When this is called, the
		renderer has just performed a flush.
		
		It calls the `onDraw` hook followed by the `onPostBatch` hook, which can be used to perform
		additional Post FX Pipeline processing.
		
		It is also called as part of the `PipelineManager.postBatch` method when processing Post FX Pipelines.
	**/
	function postBatch(?gameObject:ts.AnyOf2<phaser.cameras.scene2d.Camera, phaser.gameobjects.GameObject>):PreFXPipeline;
	/**
		Uploads the vertex data and emits a draw call for the current batch of vertices.
	**/
	function flush(?isPostFlush:Bool):PreFXPipeline;
	/**
		Activates the given WebGL Texture and binds it to the requested texture slot.
	**/
	function bindTexture(?target:phaser.renderer.webgl.wrappers.WebGLTextureWrapper, ?unit:Float):PreFXPipeline;
	/**
		Activates the given Render Target texture and binds it to the
		requested WebGL texture slot.
	**/
	function bindRenderTarget(?target:phaser.renderer.webgl.RenderTarget, ?unit:Float):PreFXPipeline;
	/**
		Sets the current duration into a 1f uniform value based on the given name.
		
		This can be used for mapping time uniform values, such as `iTime`.
	**/
	function setTime(name:String, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a boolean uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setBoolean(name:String, value:Bool, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 1f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1f(name:String, x:Float, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 2f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2f(name:String, x:Float, y:Float, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 3f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3f(name:String, x:Float, y:Float, z:Float, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 4f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4f(name:String, x:Float, y:Float, z:Float, w:Float, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 1fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 2fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 3fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 4fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 1iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 2iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 3iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 4iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 1i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1i(name:String, x:Float, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 2i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2i(name:String, x:Float, y:Float, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 3i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3i(name:String, x:Float, y:Float, z:Float, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a 4i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4i(name:String, x:Float, y:Float, z:Float, w:Float, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a matrix 2fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix2fv(name:String, transpose:Bool, matrix:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a matrix 3fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix3fv(name:String, transpose:Bool, matrix:js.lib.Float32Array, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Sets a matrix 4fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix4fv(name:String, transpose:Bool, matrix:js.lib.Float32Array, ?shader:phaser.renderer.webgl.WebGLShader):PreFXPipeline;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):PreFXPipeline;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):PreFXPipeline;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):PreFXPipeline;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):PreFXPipeline;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):PreFXPipeline;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):PreFXPipeline;
	static var prototype : PreFXPipeline;
}