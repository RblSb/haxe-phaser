package phaser.gameobjects;

/**
	A Video Game Object.
	
	This Game Object is capable of handling playback of a video file, video stream or media stream.
	
	You can optionally 'preload' the video into the Phaser Video Cache:
	
	```javascript
	preload () {
	   this.load.video('ripley', 'assets/aliens.mp4');
	}
	
	create () {
	   this.add.video(400, 300, 'ripley');
	}
	```
	
	You don't have to 'preload' the video. You can also play it directly from a URL:
	
	```javascript
	create () {
	   this.add.video(400, 300).loadURL('assets/aliens.mp4');
	}
	```
	
	To all intents and purposes, a video is a standard Game Object, just like a Sprite. And as such, you can do
	all the usual things to it, such as scaling, rotating, cropping, tinting, making interactive, giving a
	physics body, etc.
	
	Transparent videos are also possible via the WebM file format. Providing the video file has was encoded with
	an alpha channel, and providing the browser supports WebM playback (not all of them do), then it will render
	in-game with full transparency.
	
	Playback is handled entirely via the Request Video Frame API, which is supported by most modern browsers.
	A polyfill is provided for older browsers.
	
	### Autoplaying Videos
	
	Videos can only autoplay if the browser has been unlocked with an interaction, or satisfies the MEI settings.
	The policies that control autoplaying are vast and vary between browser. You can, and should, read more about
	it here: https://developer.mozilla.org/en-US/docs/Web/Media/Autoplay_guide
	
	If your video doesn't contain any audio, then set the `noAudio` parameter to `true` when the video is _loaded_,
	and it will often allow the video to play immediately:
	
	```javascript
	preload () {
	   this.load.video('pixar', 'nemo.mp4', true);
	}
	```
	
	The 3rd parameter in the load call tells Phaser that the video doesn't contain any audio tracks. Video without
	audio can autoplay without requiring a user interaction. Video with audio cannot do this unless it satisfies
	the browsers MEI settings. See the MDN Autoplay Guide for further details.
	
	Or:
	
	```javascript
	create () {
	   this.add.video(400, 300).loadURL('assets/aliens.mp4', true);
	}
	```
	
	You can set the `noAudio` parameter to `true` even if the video does contain audio. It will still allow the video
	to play immediately, but the audio will not start.
	
	Note that due to a bug in IE11 you cannot play a video texture to a Sprite in WebGL. For IE11 force Canvas mode.
	
	More details about video playback and the supported media formats can be found on MDN:
	
	https://developer.mozilla.org/en-US/docs/Web/API/HTMLVideoElement
	https://developer.mozilla.org/en-US/docs/Web/Media/Formats
**/
@:native("Phaser.GameObjects.Video") extern class Video extends GameObject {
	function new(scene:phaser.Scene, x:Float, y:Float, ?key:String);
	/**
		A reference to the HTML Video Element this Video Game Object is playing.
		
		Will be `undefined` until a video is loaded for playback.
	**/
	var video : Null<js.html.VideoElement>;
	/**
		The Phaser Texture this Game Object is using to render the video to.
		
		Will be `undefined` until a video is loaded for playback.
	**/
	var videoTexture : Null<phaser.textures.Texture>;
	/**
		A reference to the TextureSource backing the `videoTexture` Texture object.
		
		Will be `undefined` until a video is loaded for playback.
	**/
	var videoTextureSource : Null<phaser.textures.TextureSource>;
	/**
		A Phaser `CanvasTexture` instance that holds the most recent snapshot taken from the video.
		
		This will only be set if the `snapshot` or `snapshotArea` methods have been called.
		
		Until those methods are called, this property will be `undefined`.
	**/
	var snapshotTexture : Null<phaser.textures.CanvasTexture>;
	/**
		If you have saved this video to a texture via the `saveTexture` method, this controls if the video
		is rendered with `flipY` in WebGL or not. You often need to set this if you wish to use the video texture
		as the input source for a shader. If you find your video is appearing upside down within a shader or
		custom pipeline, flip this property.
	**/
	var flipY : Bool;
	/**
		An internal flag holding the current state of the video lock, should document interaction be required
		before playback can begin.
	**/
	final touchLocked : Bool;
	/**
		Should the video auto play when document interaction is required and happens?
	**/
	var playWhenUnlocked : Bool;
	/**
		Has the video created its texture and populated it with the first frame of video?
	**/
	var frameReady : Bool;
	/**
		This read-only property returns `true` if the video is currently stalled, i.e. it has stopped
		playing due to a lack of data, or too much data, but hasn't yet reached the end of the video.
		
		This is set if the Video DOM element emits any of the following events:
		
		`stalled`
		`suspend`
		`waiting`
		
		And is cleared if the Video DOM element emits the `playing` event, or handles
		a requestVideoFrame call.
		
		Listen for the Phaser Event `VIDEO_STALLED` to be notified and inspect the event
		to see which DOM event caused it.
		
		Note that being stalled isn't always a negative thing. A video can be stalled if it
		has downloaded enough data in to its buffer to not need to download any more until
		the current batch of frames have rendered.
	**/
	final isStalled : Bool;
	/**
		Records the number of times the video has failed to play,
		typically because the user hasn't interacted with the page yet.
	**/
	var failedPlayAttempts : Float;
	/**
		If the browser supports the Request Video Frame API then this
		property will hold the metadata that is returned from
		the callback each time it is invoked.
		
		See https://wicg.github.io/video-rvfc/#video-frame-metadata-callback
		for a complete list of all properties that will be in this object.
		Likely of most interest is the `mediaTime` property:
		
		The media presentation timestamp (PTS) in seconds of the frame presented
		(e.g. its timestamp on the video.currentTime timeline). MAY have a zero
		value for live-streams or WebRTC applications.
		
		If the browser doesn't support the API then this property will be undefined.
	**/
	var metadata : Dynamic;
	/**
		The current retry elapsed time.
	**/
	var retry : Float;
	/**
		If a video fails to play due to a lack of user interaction, this is the
		amount of time, in ms, that the video will wait before trying again to
		play. The default is 500ms.
	**/
	var retryInterval : Float;
	/**
		An object containing in and out markers for sequence playback.
	**/
	var markers : Dynamic;
	/**
		The key of the current video as stored in the Video cache.
		
		If the video did not come from the cache this will be an empty string.
	**/
	final cacheKey : String;
	/**
		Is the video currently seeking?
		
		This is set to `true` when the `seeking` event is fired,
		and set to `false` when the `seeked` event is fired.
	**/
	final isSeeking : Bool;
	/**
		Loads a Video from the Video Cache, ready for playback with the `Video.play` method.
		
		If a video is already playing, this method allows you to change the source of the current video element.
		It works by first stopping the current video and then starts playback of the new source through the existing video element.
		
		The reason you may wish to do this is because videos that require interaction to unlock, remain in an unlocked
		state, even if you change the source of the video. By changing the source to a new video you avoid having to
		go through the unlock process again.
	**/
	function load(key:String):Video;
	/**
		This method allows you to change the source of the current video element. It works by first stopping the
		current video, if playing. Then deleting the video texture, if one has been created. Finally, it makes a
		new video texture and starts playback of the new source through the existing video element.
		
		The reason you may wish to do this is because videos that require interaction to unlock, remain in an unlocked
		state, even if you change the source of the video. By changing the source to a new video you avoid having to
		go through the unlock process again.
	**/
	function changeSource(key:String, ?autoplay:Bool, ?loop:Bool, ?markerIn:Float, ?markerOut:Float):Video;
	/**
		Returns the key of the currently played video, as stored in the Video Cache.
		
		If the video did not come from the cache this will return an empty string.
	**/
	function getVideoKey():String;
	/**
		Loads a Video from the given URL, ready for playback with the `Video.play` method.
		
		If a video is already playing, this method allows you to change the source of the current video element.
		It works by first stopping the current video and then starts playback of the new source through the existing video element.
		
		The reason you may wish to do this is because videos that require interaction to unlock, remain in an unlocked
		state, even if you change the source of the video. By changing the source to a new video you avoid having to
		go through the unlock process again.
	**/
	function loadURL(?urls:ts.AnyOf4<String, Array<String>, phaser.types.loader.filetypes.VideoFileURLConfig, Array<phaser.types.loader.filetypes.VideoFileURLConfig>>, ?noAudio:Bool, ?crossOrigin:String):Video;
	/**
		Loads a Video from the given MediaStream object, ready for playback with the `Video.play` method.
	**/
	function loadMediaStream(stream:String, ?noAudio:Bool, ?crossOrigin:String):Video;
	/**
		Internal method that loads a Video from the given URL, ready for playback with the
		`Video.play` method.
		
		Normally you don't call this method directly, but instead use the `Video.loadURL` method,
		or the `Video.load` method if you have preloaded the video.
		
		Calling this method will skip checking if the browser supports the given format in
		the URL, where-as the other two methods enforce these checks.
	**/
	function loadHandler(?url:String, ?noAudio:Bool, ?crossOrigin:String, ?stream:String):Video;
	/**
		This method handles the Request Video Frame callback.
		
		It is called by the browser when a new video frame is ready to be displayed.
		
		It's also responsible for the creation of the video texture, if it doesn't
		already exist. If it does, it updates the texture as required.
		
		For more details about the Request Video Frame callback, see:
		https://web.dev/requestvideoframecallback-rvfc
	**/
	function requestVideoFrame(now:Float, metadata:Dynamic):Void;
	/**
		Starts this video playing.
		
		If the video is already playing, or has been queued to play with `changeSource` then this method just returns.
		
		Videos can only autoplay if the browser has been unlocked. This happens if you have interacted with the browser, i.e.
		by clicking on it or pressing a key, or due to server settings. The policies that control autoplaying are vast and
		vary between browser. You can read more here: https://developer.mozilla.org/en-US/docs/Web/Media/Autoplay_guide
		
		If your video doesn't contain any audio, then set the `noAudio` parameter to `true` when the video is loaded,
		and it will often allow the video to play immediately:
		
		```javascript
		preload () {
		   this.load.video('pixar', 'nemo.mp4', true);
		}
		```
		
		The 3rd parameter in the load call tells Phaser that the video doesn't contain any audio tracks. Video without
		audio can autoplay without requiring a user interaction. Video with audio cannot do this unless it satisfies
		the browsers MEI settings. See the MDN Autoplay Guide for details.
		
		If you need audio in your videos, then you'll have to consider the fact that the video cannot start playing until the
		user has interacted with the browser, into your game flow.
	**/
	function play(?loop:Bool, ?markerIn:Float, ?markerOut:Float):Video;
	/**
		Adds the loading specific event handlers to the video element.
	**/
	function addLoadEventHandlers():Void;
	/**
		Removes the loading specific event handlers from the video element.
	**/
	function removeLoadEventHandlers():Void;
	/**
		Adds the playback specific event handlers to the video element.
	**/
	function addEventHandlers():Void;
	/**
		Removes the playback specific event handlers from the video element.
	**/
	function removeEventHandlers():Void;
	/**
		Creates the video.play promise and adds the success and error handlers to it.
		
		Not all browsers support the video.play promise, so this method will fall back to
		the old-school way of handling the video.play call.
		
		See https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/play#browser_compatibility for details.
	**/
	function createPlayPromise(?catchError:Bool):Void;
	/**
		Adds a sequence marker to this video.
		
		Markers allow you to split a video up into sequences, delineated by a start and end time, given in seconds.
		
		You can then play back specific markers via the `playMarker` method.
		
		Note that marker timing is _not_ frame-perfect. You should construct your videos in such a way that you allow for
		plenty of extra padding before and after each sequence to allow for discrepancies in browser seek and currentTime accuracy.
		
		See https://github.com/w3c/media-and-entertainment/issues/4 for more details about this issue.
	**/
	function addMarker(key:String, markerIn:Float, markerOut:Float):Video;
	/**
		Plays a pre-defined sequence in this video.
		
		Markers allow you to split a video up into sequences, delineated by a start and end time, given in seconds and
		specified via the `addMarker` method.
		
		Note that marker timing is _not_ frame-perfect. You should construct your videos in such a way that you allow for
		plenty of extra padding before and after each sequence to allow for discrepancies in browser seek and currentTime accuracy.
		
		See https://github.com/w3c/media-and-entertainment/issues/4 for more details about this issue.
	**/
	function playMarker(key:String, ?loop:Bool):Video;
	/**
		Removes a previously set marker from this video.
		
		If the marker is currently playing it will _not_ stop playback.
	**/
	function removeMarker(key:String):Video;
	/**
		Takes a snapshot of the current frame of the video and renders it to a CanvasTexture object,
		which is then returned. You can optionally resize the grab by passing a width and height.
		
		This method returns a reference to the `Video.snapshotTexture` object. Calling this method
		multiple times will overwrite the previous snapshot with the most recent one.
	**/
	function snapshot(?width:Float, ?height:Float):phaser.textures.CanvasTexture;
	/**
		Takes a snapshot of the specified area of the current frame of the video and renders it to a CanvasTexture object,
		which is then returned. You can optionally resize the grab by passing a different `destWidth` and `destHeight`.
		
		This method returns a reference to the `Video.snapshotTexture` object. Calling this method
		multiple times will overwrite the previous snapshot with the most recent one.
	**/
	function snapshotArea(?x:Float, ?y:Float, ?srcWidth:Float, ?srcHeight:Float, ?destWidth:Float, ?destHeight:Float):phaser.textures.CanvasTexture;
	/**
		Stores a copy of this Videos `snapshotTexture` in the Texture Manager using the given key.
		
		This texture is created when the `snapshot` or `snapshotArea` methods are called.
		
		After doing this, any texture based Game Object, such as a Sprite, can use the contents of the
		snapshot by using the texture key:
		
		```javascript
		var vid = this.add.video(0, 0, 'intro');
		
		vid.snapshot();
		
		vid.saveSnapshotTexture('doodle');
		
		this.add.image(400, 300, 'doodle');
		```
		
		Updating the contents of the `snapshotTexture`, for example by calling `snapshot` again,
		will automatically update _any_ Game Object that is using it as a texture.
		Calling `saveSnapshotTexture` again will not save another copy of the same texture,
		it will just rename the existing one.
		
		By default it will create a single base texture. You can add frames to the texture
		by using the `Texture.add` method. After doing this, you can then allow Game Objects
		to use a specific frame.
	**/
	function saveSnapshotTexture(key:String):phaser.textures.CanvasTexture;
	/**
		This internal method is called automatically if the playback Promise resolves successfully.
	**/
	function playSuccess():Void;
	/**
		This internal method is called automatically if the playback Promise fails to resolve.
	**/
	function playError(error:js.html.DOMException):Void;
	/**
		Called when the video emits a `playing` event.
		
		This is the legacy handler for browsers that don't support Promise based playback.
	**/
	function legacyPlayHandler():Void;
	/**
		Called when the video emits a `playing` event.
	**/
	function playingHandler():Void;
	/**
		This internal method is called automatically if the video fails to load.
	**/
	function loadErrorHandler(event:js.html.Event):Void;
	/**
		This internal method is called automatically when the video metadata is available.
	**/
	function metadataHandler(event:js.html.Event):Void;
	/**
		Sets the size of this Game Object to be that of the given Frame.
		
		This will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or call the
		`setDisplaySize` method, which is the same thing as changing the scale but allows you
		to do so by giving pixel values.
		
		If you have enabled this Game Object for input, changing the size will _not_ change the
		size of the hit area. To do this you should adjust the `input.hitArea` object directly.
	**/
	function setSizeToFrame(?frame:ts.AnyOf2<Bool, phaser.textures.Frame>):Video;
	/**
		This internal method is called automatically if the video stalls, for whatever reason.
	**/
	function stalledHandler(event:js.html.Event):Void;
	/**
		Called when the video completes playback, i.e. reaches an `ended` state.
		
		This will never happen if the video is coming from a live stream, where the duration is `Infinity`.
	**/
	function completeHandler():Void;
	/**
		Seeks to a given point in the video. The value is given as a float between 0 and 1,
		where 0 represents the start of the video and 1 represents the end.
		
		Seeking only works if the video has a duration, so will not work for live streams.
		
		When seeking begins, this video will emit a `seeking` event. When the video completes
		seeking (i.e. reaches its designated timestamp) it will emit a `seeked` event.
		
		If you wish to seek based on time instead, use the `Video.setCurrentTime` method.
		
		Unfortunately, the DOM video element does not guarantee frame-accurate seeking.
		This has been an ongoing subject of discussion: https://github.com/w3c/media-and-entertainment/issues/4
	**/
	function seekTo(value:Float):Video;
	/**
		A double-precision floating-point value indicating the current playback time in seconds.
		
		If the media has not started to play and has not been seeked, this value is the media's initial playback time.
		
		For a more accurate value, use the `Video.metadata.mediaTime` property instead.
	**/
	function getCurrentTime():Float;
	/**
		Seeks to a given playback time in the video. The value is given in _seconds_ or as a string.
		
		Seeking only works if the video has a duration, so will not work for live streams.
		
		When seeking begins, this video will emit a `seeking` event. When the video completes
		seeking (i.e. reaches its designated timestamp) it will emit a `seeked` event.
		
		You can provide a string prefixed with either a `+` or a `-`, such as `+2.5` or `-2.5`.
		In this case it will seek to +/- the value given, relative to the _current time_.
		
		If you wish to seek based on a duration percentage instead, use the `Video.seekTo` method.
	**/
	function setCurrentTime(value:ts.AnyOf2<String, Float>):Video;
	/**
		Returns the current progress of the video as a float.
		
		Progress is defined as a value between 0 (the start) and 1 (the end).
		
		Progress can only be returned if the video has a duration. Some videos,
		such as those coming from a live stream, do not have a duration. In this
		case the method will return -1.
	**/
	function getProgress():Float;
	/**
		A double-precision floating-point value which indicates the duration (total length) of the media in seconds,
		on the media's timeline. If no media is present on the element, or the media is not valid, the returned value is NaN.
		
		If the media has no known end (such as for live streams of unknown duration, web radio, media incoming from WebRTC,
		and so forth), this value is +Infinity.
		
		If no video has been loaded, this method will return 0.
	**/
	function getDuration():Float;
	/**
		Sets the muted state of the currently playing video, if one is loaded.
	**/
	function setMute(?value:Bool):Video;
	/**
		Returns a boolean indicating if this Video is currently muted.
	**/
	function isMuted():Bool;
	/**
		Sets the paused state of the currently loaded video.
		
		If the video is playing, calling this method with `true` will pause playback.
		If the video is paused, calling this method with `false` will resume playback.
		
		If no video is loaded, this method does nothing.
		
		If the video has not yet been played, `Video.play` will be called with no parameters.
		
		If the video has ended, this method will do nothing.
	**/
	function setPaused(?value:Bool):Video;
	/**
		Pauses the current Video, if one is playing.
		
		If no video is loaded, this method does nothing.
		
		Call `Video.resume` to resume playback.
	**/
	function pause():Video;
	/**
		Resumes the current Video, if one was previously playing and has been paused.
		
		If no video is loaded, this method does nothing.
		
		Call `Video.pause` to pause playback.
	**/
	function resume():Video;
	/**
		Returns a double indicating the audio volume, from 0.0 (silent) to 1.0 (loudest).
	**/
	function getVolume():Float;
	/**
		Sets the volume of the currently playing video.
		
		The value given is a double indicating the audio volume, from 0.0 (silent) to 1.0 (loudest).
	**/
	function setVolume(?value:Float):Video;
	/**
		Returns a double that indicates the rate at which the media is being played back.
	**/
	function getPlaybackRate():Float;
	/**
		Sets the playback rate of the current video.
		
		The value given is a double that indicates the rate at which the media is being played back.
	**/
	function setPlaybackRate(?rate:Float):Video;
	/**
		Returns a boolean which indicates whether the media element should start over when it reaches the end.
	**/
	function getLoop():Bool;
	/**
		Sets the loop state of the current video.
		
		The value given is a boolean which indicates whether the media element will start over when it reaches the end.
		
		Not all videos can loop, for example live streams.
		
		Please note that not all browsers support _seamless_ video looping for all encoding formats.
	**/
	function setLoop(?value:Bool):Video;
	/**
		Returns a boolean which indicates whether the video is currently playing.
	**/
	function isPlaying():Bool;
	/**
		Returns a boolean which indicates whether the video is currently paused.
	**/
	function isPaused():Bool;
	/**
		Stores this Video in the Texture Manager using the given key as a dynamic texture,
		which any texture-based Game Object, such as a Sprite, can use as its source:
		
		```javascript
		const vid = this.add.video(0, 0, 'intro');
		
		vid.play();
		
		vid.saveTexture('doodle');
		
		this.add.image(400, 300, 'doodle');
		```
		
		If the video is not yet playing then you need to listen for the `TEXTURE_READY` event before
		you can use this texture on a Game Object:
		
		```javascript
		const vid = this.add.video(0, 0, 'intro');
		
		vid.play();
		
		vid.once('textureready', (video, texture, key) => {
		
		     this.add.image(400, 300, key);
		
		});
		
		vid.saveTexture('doodle');
		```
		
		The saved texture is automatically updated as the video plays. If you pause this video,
		or change its source, then the saved texture updates instantly.
		
		Calling `saveTexture` again will not save another copy of the same texture, it will just rename the existing one.
		
		By default it will create a single base texture. You can add frames to the texture
		by using the `Texture.add` method. After doing this, you can then allow Game Objects
		to use a specific frame.
		
		If you intend to save the texture so you can use it as the input for a Shader, you may need to set the
		`flipY` parameter to `true` if you find the video renders upside down in your shader.
	**/
	function saveTexture(key:String, ?flipY:Bool):Bool;
	/**
		Stops the video playing and clears all internal event listeners.
		
		If you only wish to pause playback of the video, and resume it a later time, use the `Video.pause` method instead.
		
		If the video hasn't finished downloading, calling this method will not abort the download. To do that you need to
		call `destroy` instead.
	**/
	function stop(?emitStopEvent:Bool):Video;
	/**
		Removes the Video element from the DOM by calling parentNode.removeChild on itself.
		
		Also removes the autoplay and src attributes and nulls the `Video.video` reference.
		
		If you loaded an external video via `Video.loadURL` then you should call this function
		to clear up once you are done with the instance, but don't want to destroy this
		Video Game Object.
		
		This method is called automatically by `Video.destroy`.
	**/
	function removeVideoElement():Void;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():Video;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
		
		If your game is running under WebGL you can optionally specify four different alpha values, each of which
		correspond to the four corners of the Game Object. Under Canvas only the `topLeft` value given is used.
	**/
	function setAlpha(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):Video;
	/**
		The alpha value of the Game Object.
		
		This is a global value, impacting the entire Game Object, not just a region of it.
	**/
	var alpha : Float;
	/**
		The alpha value starting from the top-left of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaTopLeft : Float;
	/**
		The alpha value starting from the top-right of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaTopRight : Float;
	/**
		The alpha value starting from the bottom-left of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaBottomLeft : Float;
	/**
		The alpha value starting from the bottom-right of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaBottomRight : Float;
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
	function setBlendMode(value:ts.AnyOf3<String, Float, phaser.BlendModes>):Video;
	/**
		The native (un-scaled) width of this Game Object.
		
		Changing this value will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or use
		the `displayWidth` property.
	**/
	var width : Float;
	/**
		The native (un-scaled) height of this Game Object.
		
		Changing this value will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or use
		the `displayHeight` property.
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
		Sets the internal size of this Game Object, as used for frame or physics body creation.
		
		This will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or call the
		`setDisplaySize` method, which is the same thing as changing the scale but allows you
		to do so by giving pixel values.
		
		If you have enabled this Game Object for input, changing the size will _not_ change the
		size of the hit area. To do this you should adjust the `input.hitArea` object directly.
	**/
	function setSize(width:Float, height:Float):Video;
	/**
		Sets the display size of this Game Object.
		
		Calling this will adjust the scale.
	**/
	function setDisplaySize(width:Float, height:Float):Video;
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
	function setDepth(value:Float):Video;
	/**
		The horizontally flipped state of the Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	var flipX : Bool;
	/**
		Toggles the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function toggleFlipX():Video;
	/**
		Toggles the vertical flipped state of this Game Object.
	**/
	function toggleFlipY():Video;
	/**
		Sets the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlipX(value:Bool):Video;
	/**
		Sets the vertical flipped state of this Game Object.
	**/
	function setFlipY(value:Bool):Video;
	/**
		Sets the horizontal and vertical flipped state of this Game Object.
		
		A Game Object that is flipped will render inversed on the flipped axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlip(x:Bool, y:Bool):Video;
	/**
		Resets the horizontal and vertical flipped state of this Game Object back to their default un-flipped state.
	**/
	function resetFlip():Video;
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
	function setMask(mask:ts.AnyOf2<phaser.display.masks.BitmapMask, phaser.display.masks.GeometryMask>):Video;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):Video;
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
		The horizontal origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the left of the Game Object.
		Set this value with `setOrigin()`.
	**/
	final originX : Float;
	/**
		The vertical origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the top of the Game Object.
		Set this value with `setOrigin()`.
	**/
	final originY : Float;
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
		Sets the origin of this Game Object.
		
		The values are given in the range 0 to 1.
	**/
	function setOrigin(?x:Float, ?y:Float):Video;
	/**
		Sets the origin of this Game Object based on the Pivot values in its Frame.
	**/
	function setOriginFromFrame():Video;
	/**
		Sets the display origin of this Game Object.
		The difference between this and setting the origin is that you can use pixel values for setting the display origin.
	**/
	function setDisplayOrigin(?x:Float, ?y:Float):Video;
	/**
		Updates the Display Origin cached values internally stored on this Game Object.
		You don't usually call this directly, but it is exposed for edge-cases where you may.
	**/
	function updateDisplayOrigin():Video;
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
	function setPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.WebGLPipeline>, ?pipelineData:Dynamic, ?copyData:Bool):Video;
	/**
		Adds an entry to the `pipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPipelineData(key:String, ?value:Dynamic):Video;
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
	function setPostPipeline(pipelines:ts.AnyOf6<String, haxe.Constraints.Function, Array<String>, Array<haxe.Constraints.Function>, phaser.renderer.webgl.pipelines.PostFXPipeline, Array<phaser.renderer.webgl.pipelines.PostFXPipeline>>, ?pipelineData:Dynamic, ?copyData:Bool):Video;
	/**
		Adds an entry to the `postPipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPostPipelineData(key:String, ?value:Dynamic):Video;
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
	function removePostPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.pipelines.PostFXPipeline>):Video;
	/**
		Removes all Pre and Post FX Controllers from this Game Object.
		
		If you wish to remove a single controller, use the `preFX.remove(fx)` or `postFX.remove(fx)` methods instead.
		
		If you wish to clear a single controller, use the `preFX.clear()` or `postFX.clear()` methods instead.
	**/
	function clearFX():Video;
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
	function setScrollFactor(x:Float, ?y:Float):Video;
	/**
		The Texture this Game Object is using to render with.
	**/
	var texture : ts.AnyOf2<phaser.textures.Texture, phaser.textures.CanvasTexture>;
	/**
		The Texture Frame this Game Object is using to render with.
	**/
	var frame : phaser.textures.Frame;
	/**
		A boolean flag indicating if this Game Object is being cropped or not.
		You can toggle this at any time after `setCrop` has been called, to turn cropping on or off.
		Equally, calling `setCrop` with no arguments will reset the crop and disable it.
	**/
	var isCropped : Bool;
	/**
		Applies a crop to a texture based Game Object, such as a Sprite or Image.
		
		The crop is a rectangle that limits the area of the texture frame that is visible during rendering.
		
		Cropping a Game Object does not change its size, dimensions, physics body or hit area, it just
		changes what is shown when rendered.
		
		The crop size as well as coordinates can not exceed the the size of the texture frame.
		
		The crop coordinates are relative to the texture frame, not the Game Object, meaning 0 x 0 is the top-left.
		
		Therefore, if you had a Game Object that had an 800x600 sized texture, and you wanted to show only the left
		half of it, you could call `setCrop(0, 0, 400, 600)`.
		
		It is also scaled to match the Game Object scale automatically. Therefore a crop rectangle of 100x50 would crop
		an area of 200x100 when applied to a Game Object that had a scale factor of 2.
		
		You can either pass in numeric values directly, or you can provide a single Rectangle object as the first argument.
		
		Call this method with no arguments at all to reset the crop, or toggle the property `isCropped` to `false`.
		
		You should do this if the crop rectangle becomes the same size as the frame itself, as it will allow
		the renderer to skip several internal calculations.
	**/
	function setCrop(?x:ts.AnyOf2<Float, phaser.geom.Rectangle>, ?y:Float, ?width:Float, ?height:Float):Video;
	/**
		Sets the texture and frame this Game Object will use to render with.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
	**/
	function setTexture(key:String, ?frame:ts.AnyOf2<String, Float>):Video;
	/**
		Sets the frame this Game Object will use to render with.
		
		If you pass a string or index then the Frame has to belong to the current Texture being used
		by this Game Object.
		
		If you pass a Frame instance, then the Texture being used by this Game Object will also be updated.
		
		Calling `setFrame` will modify the `width` and `height` properties of your Game Object.
		
		It will also change the `origin` if the Frame has a custom pivot point, as exported from packages like Texture Packer.
	**/
	function setFrame(frame:ts.AnyOf3<String, Float, phaser.textures.Frame>, ?updateSize:Bool, ?updateOrigin:Bool):Video;
	/**
		The tint value being applied to the top-left vertice of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
		The value should be set as a hex number, i.e. 0xff0000 for red, or 0xff00ff for purple.
	**/
	var tintTopLeft : Float;
	/**
		The tint value being applied to the top-right vertice of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
		The value should be set as a hex number, i.e. 0xff0000 for red, or 0xff00ff for purple.
	**/
	var tintTopRight : Float;
	/**
		The tint value being applied to the bottom-left vertice of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
		The value should be set as a hex number, i.e. 0xff0000 for red, or 0xff00ff for purple.
	**/
	var tintBottomLeft : Float;
	/**
		The tint value being applied to the bottom-right vertice of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
		The value should be set as a hex number, i.e. 0xff0000 for red, or 0xff00ff for purple.
	**/
	var tintBottomRight : Float;
	/**
		The tint fill mode.
		
		`false` = An additive tint (the default), where vertices colors are blended with the texture.
		`true` = A fill tint, where the vertices colors replace the texture, but respects texture alpha.
	**/
	var tintFill : Bool;
	/**
		Clears all tint values associated with this Game Object.
		
		Immediately sets the color values back to 0xffffff and the tint type to 'additive',
		which results in no visible change to the texture.
	**/
	function clearTint():Video;
	/**
		Sets an additive tint on this Game Object.
		
		The tint works by taking the pixel color values from the Game Objects texture, and then
		multiplying it by the color value of the tint. You can provide either one color value,
		in which case the whole Game Object will be tinted in that color. Or you can provide a color
		per corner. The colors are blended together across the extent of the Game Object.
		
		To modify the tint color once set, either call this method again with new values or use the
		`tint` property to set all colors at once. Or, use the properties `tintTopLeft`, `tintTopRight,
		`tintBottomLeft` and `tintBottomRight` to set the corner color values independently.
		
		To remove a tint call `clearTint`.
		
		To swap this from being an additive tint to a fill based tint set the property `tintFill` to `true`.
	**/
	function setTint(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):Video;
	/**
		Sets a fill-based tint on this Game Object.
		
		Unlike an additive tint, a fill-tint literally replaces the pixel colors from the texture
		with those in the tint. You can use this for effects such as making a player flash 'white'
		if hit by something. You can provide either one color value, in which case the whole
		Game Object will be rendered in that color. Or you can provide a color per corner. The colors
		are blended together across the extent of the Game Object.
		
		To modify the tint color once set, either call this method again with new values or use the
		`tint` property to set all colors at once. Or, use the properties `tintTopLeft`, `tintTopRight,
		`tintBottomLeft` and `tintBottomRight` to set the corner color values independently.
		
		To remove a tint call `clearTint`.
		
		To swap this from being a fill-tint to an additive tint set the property `tintFill` to `false`.
	**/
	function setTintFill(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):Video;
	/**
		The tint value being applied to the whole of the Game Object.
		Return `tintTopLeft` when read this tint property.
	**/
	var tint : Float;
	/**
		Does this Game Object have a tint applied?
		
		It checks to see if the 4 tint properties are set to the value 0xffffff
		and that the `tintFill` property is `false`. This indicates that a Game Object isn't tinted.
	**/
	final isTinted : Bool;
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
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):Video;
	/**
		Copies an object's coordinates to this Game Object's position.
	**/
	function copyPosition(source:ts.AnyOf3<phaser.types.math.Vector2Like, phaser.types.math.Vector3Like, phaser.types.math.Vector4Like>):Video;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):Video;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):Video;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):Video;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(?x:Float, ?y:Float):Video;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):Video;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):Video;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):Video;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):Video;
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
	function setVisible(value:Bool):Video;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):Video;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):Video;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):Video;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():Video;
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
	function setData<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):Video;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:String, ?amount:Float):Video;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:String):Video;
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
	function setInteractive(?hitArea:Dynamic, ?callback:phaser.types.input.HitAreaCallback, ?dropZone:Bool):Video;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():Video;
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
	function removeInteractive():Video;
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
	function addToDisplayList(?displayList:ts.AnyOf2<Layer, DisplayList>):Video;
	/**
		Adds this Game Object to the Update List belonging to the Scene.
		
		When a Game Object is added to the Update List it will have its `preUpdate` method called
		every game frame. This method is passed two parameters: `delta` and `time`.
		
		If you wish to run your own logic within `preUpdate` then you should always call
		`super.preUpdate(delta, time)` within it, or it may fail to process required operations,
		such as Sprite animations.
	**/
	function addToUpdateList():Video;
	/**
		Removes this Game Object from the Display List it is currently on.
		
		A Game Object can only exist on one Display List at any given time, but may move freely removed
		and added back at a later stage.
		
		You can query which list it is on by looking at the `Phaser.GameObjects.GameObject#displayList` property.
		
		If a Game Object isn't on any Display List, it will not be rendered. If you just wish to temporarly
		disable it from rendering, consider using the `setVisible` method, instead.
	**/
	function removeFromDisplayList():Video;
	/**
		Removes this Game Object from the Scene's Update List.
		
		When a Game Object is on the Update List, it will have its `preUpdate` method called
		every game frame. Calling this method will remove it from the list, preventing this.
		
		Removing a Game Object from the Update List will stop most internal functions working.
		For example, removing a Sprite from the Update List will prevent it from being able to
		run animations.
	**/
	function removeFromUpdateList():Video;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Video;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Video;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Video;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Video;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Video;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Video;
	static var prototype : Video;
}