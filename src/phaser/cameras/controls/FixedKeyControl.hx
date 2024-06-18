package phaser.cameras.controls;

/**
	A Fixed Key Camera Control.
	
	This allows you to control the movement and zoom of a camera using the defined keys.
	
	```javascript
	var camControl = new FixedKeyControl({
	     camera: this.cameras.main,
	     left: cursors.left,
	     right: cursors.right,
	     speed: float OR { x: 0, y: 0 }
	});
	```
	
	Movement is precise and has no 'smoothing' applied to it.
	
	You must call the `update` method of this controller every frame.
**/
@:native("Phaser.Cameras.Controls.FixedKeyControl") extern class FixedKeyControl {
	function new(config:phaser.types.cameras.controls.FixedKeyControlConfig);
	/**
		The Camera that this Control will update.
	**/
	var camera : Null<phaser.cameras.scene2d.Camera>;
	/**
		The Key to be pressed that will move the Camera left.
	**/
	var left : Null<phaser.input.keyboard.Key>;
	/**
		The Key to be pressed that will move the Camera right.
	**/
	var right : Null<phaser.input.keyboard.Key>;
	/**
		The Key to be pressed that will move the Camera up.
	**/
	var up : Null<phaser.input.keyboard.Key>;
	/**
		The Key to be pressed that will move the Camera down.
	**/
	var down : Null<phaser.input.keyboard.Key>;
	/**
		The Key to be pressed that will zoom the Camera in.
	**/
	var zoomIn : Null<phaser.input.keyboard.Key>;
	/**
		The Key to be pressed that will zoom the Camera out.
	**/
	var zoomOut : Null<phaser.input.keyboard.Key>;
	/**
		The speed at which the camera will zoom if the `zoomIn` or `zoomOut` keys are pressed.
	**/
	var zoomSpeed : Float;
	/**
		The smallest zoom value the camera will reach when zoomed out.
	**/
	var minZoom : Float;
	/**
		The largest zoom value the camera will reach when zoomed in.
	**/
	var maxZoom : Float;
	/**
		The horizontal speed the camera will move.
	**/
	var speedX : Float;
	/**
		The vertical speed the camera will move.
	**/
	var speedY : Float;
	/**
		A flag controlling if the Controls will update the Camera or not.
	**/
	var active : Bool;
	/**
		Starts the Key Control running, providing it has been linked to a camera.
	**/
	function start():FixedKeyControl;
	/**
		Stops this Key Control from running. Call `start` to start it again.
	**/
	function stop():FixedKeyControl;
	/**
		Binds this Key Control to a camera.
	**/
	function setCamera(camera:phaser.cameras.scene2d.Camera):FixedKeyControl;
	/**
		Applies the results of pressing the control keys to the Camera.
		
		You must call this every step, it is not called automatically.
	**/
	function update(delta:Float):Void;
	/**
		Destroys this Key Control.
	**/
	function destroy():Void;
	static var prototype : FixedKeyControl;
}