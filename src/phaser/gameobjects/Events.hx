package phaser.gameobjects;

@:native("Phaser.GameObjects.Events") @valueModuleOnly extern class Events {
	/**
		The Game Object Added to Scene Event.
		
		This event is dispatched when a Game Object is added to a Scene.
		
		Listen for it on a Game Object instance using `GameObject.on('addedtoscene', listener)`.
	**/
	static final ADDED_TO_SCENE : String;
	/**
		The Game Object Destroy Event.
		
		This event is dispatched when a Game Object instance is being destroyed.
		
		Listen for it on a Game Object instance using `GameObject.on('destroy', listener)`.
	**/
	static final DESTROY : String;
	/**
		The Game Object Removed from Scene Event.
		
		This event is dispatched when a Game Object is removed from a Scene.
		
		Listen for it on a Game Object instance using `GameObject.on('removedfromscene', listener)`.
	**/
	static final REMOVED_FROM_SCENE : String;
	/**
		The Video Game Object Complete Event.
		
		This event is dispatched when a Video finishes playback by reaching the end of its duration. It
		is also dispatched if a video marker sequence is being played and reaches the end.
		
		Note that not all videos can fire this event. Live streams, for example, have no fixed duration,
		so never technically 'complete'.
		
		If a video is stopped from playback, via the `Video.stop` method, it will emit the
		`VIDEO_STOP` event instead of this one.
		
		Listen for it from a Video Game Object instance using `Video.on('complete', listener)`.
	**/
	static final VIDEO_COMPLETE : String;
	/**
		The Video Game Object Created Event.
		
		This event is dispatched when the texture for a Video has been created. This happens
		when enough of the video source has been loaded that the browser is able to render a
		frame from it.
		
		Listen for it from a Video Game Object instance using `Video.on('created', listener)`.
	**/
	static final VIDEO_CREATED : String;
	/**
		The Video Game Object Error Event.
		
		This event is dispatched when a Video tries to play a source that does not exist, or is the wrong file type.
		
		Listen for it from a Video Game Object instance using `Video.on('error', listener)`.
	**/
	static final VIDEO_ERROR : String;
	/**
		The Video Game Object Locked Event.
		
		This event is dispatched when a Video was attempted to be played, but the browser prevented it
		from doing so due to the Media Engagement Interaction policy.
		
		If you get this event you will need to wait for the user to interact with the browser before
		the video will play. This is a browser security measure to prevent autoplaying videos with
		audio. An interaction includes a mouse click, a touch, or a key press.
		
		Listen for it from a Video Game Object instance using `Video.on('locked', listener)`.
	**/
	static final VIDEO_LOCKED : String;
	/**
		The Video Game Object Loop Event.
		
		This event is dispatched when a Video that is currently playing has looped. This only
		happens if the `loop` parameter was specified, or the `setLoop` method was called,
		and if the video has a fixed duration. Video streams, for example, cannot loop, as
		they have no duration.
		
		Looping is based on the result of the Video `timeupdate` event. This event is not
		frame-accurate, due to the way browsers work, so please do not rely on this loop
		event to be time or frame precise.
		
		Listen for it from a Video Game Object instance using `Video.on('loop', listener)`.
	**/
	static final VIDEO_LOOP : String;
	/**
		The Video Game Object Metadata Event.
		
		This event is dispatched when a Video has access to the metadata.
		
		Listen for it from a Video Game Object instance using `Video.on('metadata', listener)`.
	**/
	static final VIDEO_METADATA : String;
	/**
		The Video Game Object Playing Event.
		
		The playing event is fired after playback is first started,
		and whenever it is restarted. For example it is fired when playback
		resumes after having been paused or delayed due to lack of data.
		
		Listen for it from a Video Game Object instance using `Video.on('playing', listener)`.
	**/
	static final VIDEO_PLAYING : String;
	/**
		The Video Game Object Play Event.
		
		This event is dispatched when a Video begins playback. For videos that do not require
		interaction unlocking, this is usually as soon as the `Video.play` method is called.
		However, for videos that require unlocking, it is fired once playback begins after
		they've been unlocked.
		
		Listen for it from a Video Game Object instance using `Video.on('play', listener)`.
	**/
	static final VIDEO_PLAY : String;
	/**
		The Video Game Object Seeked Event.
		
		This event is dispatched when a Video completes seeking to a new point in its timeline.
		
		Listen for it from a Video Game Object instance using `Video.on('seeked', listener)`.
	**/
	static final VIDEO_SEEKED : String;
	/**
		The Video Game Object Seeking Event.
		
		This event is dispatched when a Video _begins_ seeking to a new point in its timeline.
		When the seek is complete, it will dispatch the `VIDEO_SEEKED` event to conclude.
		
		Listen for it from a Video Game Object instance using `Video.on('seeking', listener)`.
	**/
	static final VIDEO_SEEKING : String;
	/**
		The Video Game Object Stalled Event.
		
		This event is dispatched by a Video Game Object when the video playback stalls.
		
		This can happen if the video is buffering.
		
		If will fire for any of the following native DOM events:
		
		`stalled`
		`suspend`
		`waiting`
		
		Listen for it from a Video Game Object instance using `Video.on('stalled', listener)`.
		
		Note that being stalled isn't always a negative thing. A video can be stalled if it
		has downloaded enough data in to its buffer to not need to download any more until
		the current batch of frames have rendered.
	**/
	static final VIDEO_STALLED : String;
	/**
		The Video Game Object Stopped Event.
		
		This event is dispatched when a Video is stopped from playback via a call to the `Video.stop` method,
		either directly via game code, or indirectly as the result of changing a video source or destroying it.
		
		Listen for it from a Video Game Object instance using `Video.on('stop', listener)`.
	**/
	static final VIDEO_STOP : String;
	/**
		The Video Game Object Texture Ready Event.
		
		This event is dispatched by a Video Game Object when it has finished creating its texture.
		
		This happens when the video has finished loading enough data for its first frame.
		
		If you wish to use the Video texture elsewhere in your game, such as as a Sprite texture,
		then you should listen for this event first, before creating the Sprites that use it.
		
		Listen for it from a Video Game Object instance using `Video.on('textureready', listener)`.
	**/
	static final VIDEO_TEXTURE : String;
	/**
		The Video Game Object Unlocked Event.
		
		This event is dispatched when a Video that was prevented from playback due to the browsers
		Media Engagement Interaction policy, is unlocked by a user gesture.
		
		Listen for it from a Video Game Object instance using `Video.on('unlocked', listener)`.
	**/
	static final VIDEO_UNLOCKED : String;
	/**
		The Video Game Object Unsupported Event.
		
		This event is dispatched by a Video Game Object if the media source
		(which may be specified as a MediaStream, MediaSource, Blob, or File,
		for example) doesn't represent a supported media format.
		
		Listen for it from a Video Game Object instance using `Video.on('unsupported', listener)`.
	**/
	static final VIDEO_UNSUPPORTED : String;
}