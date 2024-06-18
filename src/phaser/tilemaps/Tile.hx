package phaser.tilemaps;

/**
	A Tile is a representation of a single tile within the Tilemap. This is a lightweight data
	representation, so its position information is stored without factoring in scroll, layer
	scale or layer position.
**/
@:native("Phaser.Tilemaps.Tile") extern class Tile {
	function new(layer:LayerData, index:Float, x:Float, y:Float, width:Float, height:Float, baseWidth:Float, baseHeight:Float);
	/**
		The LayerData in the Tilemap data that this tile belongs to.
	**/
	var layer : LayerData;
	/**
		The index of this tile within the map data corresponding to the tileset, or -1 if this
		represents a blank tile.
	**/
	var index : Float;
	/**
		The x map coordinate of this tile in tile units.
	**/
	var x : Float;
	/**
		The y map coordinate of this tile in tile units.
	**/
	var y : Float;
	/**
		The width of the tile in pixels.
	**/
	var width : Float;
	/**
		The height of the tile in pixels.
	**/
	var height : Float;
	/**
		The right of the tile in pixels.
		
		Set in the `updatePixelXY` method.
	**/
	var right : Float;
	/**
		The bottom of the tile in pixels.
		
		Set in the `updatePixelXY` method.
	**/
	var bottom : Float;
	/**
		The maps base width of a tile in pixels. Tiled maps support multiple tileset sizes
		within one map, but they are still placed at intervals of the base tile size.
	**/
	var baseWidth : Float;
	/**
		The maps base height of a tile in pixels. Tiled maps support multiple tileset sizes
		within one map, but they are still placed at intervals of the base tile size.
	**/
	var baseHeight : Float;
	/**
		The x coordinate of the top left of this tile in pixels. This is relative to the top left
		of the layer this tile is being rendered within. This property does NOT factor in camera
		scroll, layer scale or layer position.
	**/
	var pixelX : Float;
	/**
		The y coordinate of the top left of this tile in pixels. This is relative to the top left
		of the layer this tile is being rendered within. This property does NOT factor in camera
		scroll, layer scale or layer position.
	**/
	var pixelY : Float;
	/**
		Tile specific properties. These usually come from Tiled.
	**/
	var properties : Dynamic;
	/**
		The rotation angle of this tile.
	**/
	var rotation : Float;
	/**
		Whether the tile should collide with any object on the left side.
		
		This property is used by Arcade Physics only, however, you can also use it
		in your own checks.
	**/
	var collideLeft : Bool;
	/**
		Whether the tile should collide with any object on the right side.
		
		This property is used by Arcade Physics only, however, you can also use it
		in your own checks.
	**/
	var collideRight : Bool;
	/**
		Whether the tile should collide with any object on the top side.
		
		This property is used by Arcade Physics only, however, you can also use it
		in your own checks.
	**/
	var collideUp : Bool;
	/**
		Whether the tile should collide with any object on the bottom side.
		
		This property is used by Arcade Physics only, however, you can also use it
		in your own checks.
	**/
	var collideDown : Bool;
	/**
		Whether the tiles left edge is interesting for collisions.
	**/
	var faceLeft : Bool;
	/**
		Whether the tiles right edge is interesting for collisions.
	**/
	var faceRight : Bool;
	/**
		Whether the tiles top edge is interesting for collisions.
	**/
	var faceTop : Bool;
	/**
		Whether the tiles bottom edge is interesting for collisions.
	**/
	var faceBottom : Bool;
	/**
		Tile collision callback.
	**/
	var collisionCallback : haxe.Constraints.Function;
	/**
		The context in which the collision callback will be called.
	**/
	var collisionCallbackContext : Dynamic;
	/**
		The tint to apply to this tile. Note: tint is currently a single color value instead of
		the 4 corner tint component on other GameObjects.
	**/
	var tint : Float;
	/**
		The tint fill mode.
		
		`false` = An additive tint (the default), where vertices colors are blended with the texture.
		`true` = A fill tint, where the vertices colors replace the texture, but respects texture alpha.
	**/
	var tintFill : Bool;
	/**
		An empty object where physics-engine specific information (e.g. bodies) may be stored.
	**/
	var physics : Dynamic;
	/**
		Check if the given x and y world coordinates are within this Tile. This does not factor in
		camera scroll, layer scale or layer position.
	**/
	function containsPoint(x:Float, y:Float):Bool;
	/**
		Copies the tile data and properties from the given Tile to this Tile. This copies everything
		except for position and interesting face calculations.
	**/
	function copy(tile:Tile):Tile;
	/**
		The collision group for this Tile, defined within the Tileset. This returns a reference to
		the collision group stored within the Tileset, so any modification of the returned object
		will impact all tiles that have the same index as this tile.
	**/
	function getCollisionGroup():Null<Dynamic>;
	/**
		The tile data for this Tile, defined within the Tileset. This typically contains Tiled
		collision data, tile animations and terrain information. This returns a reference to the tile
		data stored within the Tileset, so any modification of the returned object will impact all
		tiles that have the same index as this tile.
	**/
	function getTileData():Null<Dynamic>;
	/**
		Gets the world X position of the left side of the tile, factoring in the layers position,
		scale and scroll.
	**/
	function getLeft(?camera:phaser.cameras.scene2d.Camera):Float;
	/**
		Gets the world X position of the right side of the tile, factoring in the layer's position,
		scale and scroll.
	**/
	function getRight(?camera:phaser.cameras.scene2d.Camera):Float;
	/**
		Gets the world Y position of the top side of the tile, factoring in the layer's position,
		scale and scroll.
	**/
	function getTop(?camera:phaser.cameras.scene2d.Camera):Float;
	/**
		Gets the world Y position of the bottom side of the tile, factoring in the layer's position,
		scale and scroll.
	**/
	function getBottom(?camera:phaser.cameras.scene2d.Camera):Float;
	/**
		Gets the world rectangle bounding box for the tile, factoring in the layers position,
		scale and scroll.
	**/
	function getBounds(?camera:phaser.cameras.scene2d.Camera, ?output:phaser.geom.Rectangle):ts.AnyOf2<Dynamic, phaser.geom.Rectangle>;
	/**
		Gets the world X position of the center of the tile, factoring in the layer's position,
		scale and scroll.
	**/
	function getCenterX(?camera:phaser.cameras.scene2d.Camera):Float;
	/**
		Gets the world Y position of the center of the tile, factoring in the layer's position,
		scale and scroll.
	**/
	function getCenterY(?camera:phaser.cameras.scene2d.Camera):Float;
	/**
		Check for intersection with this tile. This does not factor in camera scroll, layer scale or
		layer position.
	**/
	function intersects(x:Float, y:Float, right:Float, bottom:Float):Bool;
	/**
		Checks if the tile is interesting.
	**/
	function isInteresting(collides:Bool, faces:Bool):Bool;
	/**
		Reset collision status flags.
	**/
	function resetCollision(?recalculateFaces:Bool):Tile;
	/**
		Reset faces.
	**/
	function resetFaces():Tile;
	/**
		Sets the collision flags for each side of this tile and updates the interesting faces list.
	**/
	function setCollision(left:Bool, ?right:Bool, ?up:Bool, ?down:Bool, ?recalculateFaces:Bool):Tile;
	/**
		Set a callback to be called when this tile is hit by an object. The callback must true for
		collision processing to take place.
	**/
	function setCollisionCallback(callback:haxe.Constraints.Function, context:Dynamic):Tile;
	/**
		Sets the size of the tile and updates its pixelX and pixelY.
	**/
	function setSize(tileWidth:Float, tileHeight:Float, baseWidth:Float, baseHeight:Float):Tile;
	/**
		Used internally. Updates the tiles world XY position based on the current tile size.
	**/
	function updatePixelXY():Tile;
	/**
		Clean up memory.
	**/
	function destroy():Void;
	/**
		True if this tile can collide on any of its faces or has a collision callback set.
	**/
	final canCollide : Bool;
	/**
		True if this tile can collide on any of its faces.
	**/
	final collides : Bool;
	/**
		True if this tile has any interesting faces.
	**/
	final hasInterestingFace : Bool;
	/**
		The tileset that contains this Tile. This is null if accessed from a LayerData instance
		before the tile is placed in a TilemapLayer, or if the tile has an index that doesn't correspond
		to any of the maps tilesets.
	**/
	final tileset : Null<Tileset>;
	/**
		The tilemap layer that contains this Tile. This will only return null if accessed from a
		LayerData instance before the tile is placed within a TilemapLayer.
	**/
	final tilemapLayer : Null<TilemapLayer>;
	/**
		The tilemap that contains this Tile. This will only return null if accessed from a LayerData
		instance before the tile is placed within a TilemapLayer.
	**/
	final tilemap : Null<Tilemap>;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():Tile;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
	**/
	function setAlpha(?value:Float):Tile;
	/**
		The alpha value of the Game Object.
		
		This is a global value, impacting the entire Game Object, not just a region of it.
	**/
	var alpha : Float;
	/**
		The horizontally flipped state of the Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	var flipX : Bool;
	/**
		The vertically flipped state of the Game Object.
		
		A Game Object that is flipped vertically will render inversed on the vertical axis (i.e. upside down)
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	var flipY : Bool;
	/**
		Toggles the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function toggleFlipX():Tile;
	/**
		Toggles the vertical flipped state of this Game Object.
	**/
	function toggleFlipY():Tile;
	/**
		Sets the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlipX(value:Bool):Tile;
	/**
		Sets the vertical flipped state of this Game Object.
	**/
	function setFlipY(value:Bool):Tile;
	/**
		Sets the horizontal and vertical flipped state of this Game Object.
		
		A Game Object that is flipped will render inversed on the flipped axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlip(x:Bool, y:Bool):Tile;
	/**
		Resets the horizontal and vertical flipped state of this Game Object back to their default un-flipped state.
	**/
	function resetFlip():Tile;
	/**
		The visible state of the Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	var visible : Bool;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):Tile;
	static var prototype : Tile;
}