package phaser.tweens;

/**
	Phaser Tween States.
**/
@:native("Phaser.Tweens.States") extern enum abstract States(Int) from Int to Int {
	/**
		TweenData state.
	**/
	var CREATED;
	/**
		TweenData state.
	**/
	var DELAY;
	/**
		TweenData state.
	**/
	var PENDING_RENDER;
	/**
		TweenData state.
	**/
	var PLAYING_FORWARD;
	/**
		TweenData state.
	**/
	var PLAYING_BACKWARD;
	/**
		TweenData state.
	**/
	var HOLD_DELAY;
	/**
		TweenData state.
	**/
	var REPEAT_DELAY;
	/**
		TweenData state.
	**/
	var COMPLETE;
	/**
		Tween state. The Tween has been created but has not yet been added to the Tween Manager.
	**/
	var PENDING;
	/**
		Tween state. The Tween is active within the Tween Manager. This means it is either playing,
		or was playing and is currently paused, but in both cases it's still being processed by
		the Tween Manager, so is considered 'active'.
	**/
	var ACTIVE;
	/**
		Tween state. The Tween is waiting for a loop countdown to elapse.
	**/
	var LOOP_DELAY;
	/**
		Tween state. The Tween is waiting for a complete delay to elapse.
	**/
	var COMPLETE_DELAY;
	/**
		Tween state. The Tween is waiting for a starting delay to elapse.
	**/
	var START_DELAY;
	/**
		Tween state. The Tween has finished playback and is waiting to be removed from the Tween Manager.
	**/
	var PENDING_REMOVE;
	/**
		Tween state. The Tween has been removed from the Tween Manager.
	**/
	var REMOVED;
	/**
		Tween state. The Tween has finished playback but was flagged as 'persistent' during creation,
		so will not be automatically removed by the Tween Manager.
	**/
	var FINISHED;
	/**
		Tween state. The Tween has been destroyed and can no longer be played by a Tween Manager.
	**/
	var DESTROYED;
	/**
		A large integer value used for 'infinite' style countdowns.

		Similar use-case to Number.MAX_SAFE_INTEGER but we cannot use that because it's not
		supported on IE.
	**/
	var MAX;
}
