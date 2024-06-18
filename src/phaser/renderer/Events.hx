package phaser.renderer;

@:native("Phaser.Renderer.Events") @valueModuleOnly extern class Events {
	/**
		The Lose WebGL Event.
		
		This event is dispatched by the WebGLRenderer when the WebGL context
		is lost.
		
		Context can be lost for a variety of reasons, like leaving the browser tab.
		The game canvas DOM object will dispatch `webglcontextlost`.
		All WebGL resources get wiped, and the context is reset.
		
		While WebGL is lost, the game will continue to run, but all WebGL resources
		are lost, and new ones cannot be created.
		
		Once the context is restored and the renderer has automatically restored
		the state, the renderer will emit a `RESTORE_WEBGL` event. At that point,
		it is safe to continue.
	**/
	static final LOSE_WEBGL : String;
	/**
		The Post-Render Event.
		
		This event is dispatched by the Renderer when all rendering, for all cameras in all Scenes,
		has completed, but before any pending snap shots have been taken.
	**/
	static final POST_RENDER : String;
	/**
		The Pre-Render Event.
		
		This event is dispatched by the Phaser Renderer. This happens right at the start of the render
		process, after the context has been cleared, the scissors enabled (WebGL only) and everything has been
		reset ready for the render.
	**/
	static final PRE_RENDER : String;
	/**
		The Render Event.
		
		This event is dispatched by the Phaser Renderer for every camera in every Scene.
		
		It is dispatched before any of the children in the Scene have been rendered.
	**/
	static final RENDER : String;
	/**
		The Renderer Resize Event.
		
		This event is dispatched by the Phaser Renderer when it is resized, usually as a result
		of the Scale Manager resizing.
	**/
	static final RESIZE : String;
	/**
		The Restore WebGL Event.
		
		This event is dispatched by the WebGLRenderer when the WebGL context
		is restored.
		
		It is dispatched after all WebGL resources have been recreated.
		Most resources should come back automatically, but you will need to redraw
		dynamic textures that were GPU bound.
		Listen to this event to know when you can safely do that.
		
		Context can be lost for a variety of reasons, like leaving the browser tab.
		The game canvas DOM object will dispatch `webglcontextlost`.
		All WebGL resources get wiped, and the context is reset.
		
		Once the context is restored, the canvas will dispatch
		`webglcontextrestored`. Phaser uses this to re-create necessary resources.
		Please wait for Phaser to dispatch the `RESTORE_WEBGL` event before
		re-creating any resources of your own.
	**/
	static final RESTORE_WEBGL : String;
}