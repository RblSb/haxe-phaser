package phaser.time;

@:native("Phaser.Time.Events") @valueModuleOnly extern class Events {
	/**
		The Timeline Complete Event.
		
		This event is dispatched by timeline when all timeline events complete.
		
		Listen to it from a Timeline instance using `Timeline.on('complete', listener)`, i.e.:
		
		```javascript
		const timeline = this.add.timeline();
		timeline.on('complete', listener);
		timeline.play();
		```
	**/
	static final COMPLETE : String;
}