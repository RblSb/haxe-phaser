package phaser.cameras.scene2d;

@:native("Phaser.Cameras.Scene2D.Events") @valueModuleOnly extern class Events {
	/**
		The Destroy Camera Event.
		
		This event is dispatched by a Camera instance when it is destroyed by the Camera Manager.
		
		Listen for it via either of the following:
		
		```js
		this.cameras.main.on('cameradestroy', () => {});
		```
		
		or use the constant, to avoid having to remember the correct event string:
		
		```js
		this.cameras.main.on(Phaser.Cameras.Scene2D.Events.DESTROY, () => {});
		```
	**/
	static final DESTROY : String;
	/**
		The Camera Fade In Complete Event.
		
		This event is dispatched by a Camera instance when the Fade In Effect completes.
		
		Listen to it from a Camera instance using `Camera.on('camerafadeincomplete', listener)`.
	**/
	static final FADE_IN_COMPLETE : String;
	/**
		The Camera Fade In Start Event.
		
		This event is dispatched by a Camera instance when the Fade In Effect starts.
		
		Listen to it from a Camera instance using `Camera.on('camerafadeinstart', listener)`.
	**/
	static final FADE_IN_START : String;
	/**
		The Camera Fade Out Complete Event.
		
		This event is dispatched by a Camera instance when the Fade Out Effect completes.
		
		Listen to it from a Camera instance using `Camera.on('camerafadeoutcomplete', listener)`.
	**/
	static final FADE_OUT_COMPLETE : String;
	/**
		The Camera Fade Out Start Event.
		
		This event is dispatched by a Camera instance when the Fade Out Effect starts.
		
		Listen to it from a Camera instance using `Camera.on('camerafadeoutstart', listener)`.
	**/
	static final FADE_OUT_START : String;
	/**
		The Camera Flash Complete Event.
		
		This event is dispatched by a Camera instance when the Flash Effect completes.
		
		Listen for it via either of the following:
		
		```js
		this.cameras.main.on('cameraflashcomplete', () => {});
		```
		
		or use the constant, to avoid having to remember the correct event string:
		
		```js
		this.cameras.main.on(Phaser.Cameras.Scene2D.Events.FLASH_COMPLETE, () => {});
		```
	**/
	static final FLASH_COMPLETE : String;
	/**
		The Camera Flash Start Event.
		
		This event is dispatched by a Camera instance when the Flash Effect starts.
		
		Listen for it via either of the following:
		
		```js
		this.cameras.main.on('cameraflashstart', () => {});
		```
		
		or use the constant, to avoid having to remember the correct event string:
		
		```js
		this.cameras.main.on(Phaser.Cameras.Scene2D.Events.FLASH_START, () => {});
		```
	**/
	static final FLASH_START : String;
	/**
		The Camera Follower Update Event.
		
		This event is dispatched by a Camera instance when it is following a
		Game Object and the Camera position has been updated as a result of
		that following.
		
		Listen to it from a Camera instance using: `camera.on('followupdate', listener)`.
	**/
	static final FOLLOW_UPDATE : String;
	/**
		The Camera Pan Complete Event.
		
		This event is dispatched by a Camera instance when the Pan Effect completes.
		
		Listen for it via either of the following:
		
		```js
		this.cameras.main.on('camerapancomplete', () => {});
		```
		
		or use the constant, to avoid having to remember the correct event string:
		
		```js
		this.cameras.main.on(Phaser.Cameras.Scene2D.Events.PAN_COMPLETE, () => {});
		```
	**/
	static final PAN_COMPLETE : String;
	/**
		The Camera Pan Start Event.
		
		This event is dispatched by a Camera instance when the Pan Effect starts.
		
		Listen for it via either of the following:
		
		```js
		this.cameras.main.on('camerapanstart', () => {});
		```
		
		or use the constant, to avoid having to remember the correct event string:
		
		```js
		this.cameras.main.on(Phaser.Cameras.Scene2D.Events.PAN_START, () => {});
		```
	**/
	static final PAN_START : String;
	/**
		The Camera Post-Render Event.
		
		This event is dispatched by a Camera instance after is has finished rendering.
		It is only dispatched if the Camera is rendering to a texture.
		
		Listen to it from a Camera instance using: `camera.on('postrender', listener)`.
	**/
	static final POST_RENDER : String;
	/**
		The Camera Pre-Render Event.
		
		This event is dispatched by a Camera instance when it is about to render.
		It is only dispatched if the Camera is rendering to a texture.
		
		Listen to it from a Camera instance using: `camera.on('prerender', listener)`.
	**/
	static final PRE_RENDER : String;
	/**
		The Camera Rotate Complete Event.
		
		This event is dispatched by a Camera instance when the Rotate Effect completes.
		
		Listen for it via either of the following:
		
		```js
		this.cameras.main.on('camerarotatecomplete', () => {});
		```
		
		or use the constant, to avoid having to remember the correct event string:
		
		```js
		this.cameras.main.on(Phaser.Cameras.Scene2D.Events.ROTATE_COMPLETE, () => {});
		```
	**/
	static final ROTATE_COMPLETE : String;
	/**
		The Camera Rotate Start Event.
		
		This event is dispatched by a Camera instance when the Rotate Effect starts.
		
		Listen for it via either of the following:
		
		```js
		this.cameras.main.on('camerarotatestart', () => {});
		```
		
		or use the constant, to avoid having to remember the correct event string:
		
		```js
		this.cameras.main.on(Phaser.Cameras.Scene2D.Events.ROTATE_START, () => {});
		```
	**/
	static final ROTATE_START : String;
	/**
		The Camera Shake Complete Event.
		
		This event is dispatched by a Camera instance when the Shake Effect completes.
		
		Listen for it via either of the following:
		
		```js
		this.cameras.main.on('camerashakecomplete', () => {});
		```
		
		or use the constant, to avoid having to remember the correct event string:
		
		```js
		this.cameras.main.on(Phaser.Cameras.Scene2D.Events.SHAKE_COMPLETE, () => {});
		```
	**/
	static final SHAKE_COMPLETE : String;
	/**
		The Camera Shake Start Event.
		
		This event is dispatched by a Camera instance when the Shake Effect starts.
		
		Listen for it via either of the following:
		
		```js
		this.cameras.main.on('camerashakestart', () => {});
		```
		
		or use the constant, to avoid having to remember the correct event string:
		
		```js
		this.cameras.main.on(Phaser.Cameras.Scene2D.Events.SHAKE_START, () => {});
		```
	**/
	static final SHAKE_START : String;
	/**
		The Camera Zoom Complete Event.
		
		This event is dispatched by a Camera instance when the Zoom Effect completes.
		
		Listen for it via either of the following:
		
		```js
		this.cameras.main.on('camerazoomcomplete', () => {});
		```
		
		or use the constant, to avoid having to remember the correct event string:
		
		```js
		this.cameras.main.on(Phaser.Cameras.Scene2D.Events.ZOOM_COMPLETE, () => {});
		```
	**/
	static final ZOOM_COMPLETE : String;
	/**
		The Camera Zoom Start Event.
		
		This event is dispatched by a Camera instance when the Zoom Effect starts.
		
		Listen for it via either of the following:
		
		```js
		this.cameras.main.on('camerazoomstart', () => {});
		```
		
		or use the constant, to avoid having to remember the correct event string:
		
		```js
		this.cameras.main.on(Phaser.Cameras.Scene2D.Events.ZOOM_START, () => {});
		```
	**/
	static final ZOOM_START : String;
}