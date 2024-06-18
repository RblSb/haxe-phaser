package phaser.tilemaps;

/**
	A Tilemap Layer is a Game Object that renders LayerData from a Tilemap when used in combination
	with one, or more, Tilesets.
**/
@:native("Phaser.Tilemaps.TilemapLayer") extern class TilemapLayer extends phaser.gameobjects.GameObject {
	function new(scene:phaser.Scene, tilemap:Tilemap, layerIndex:Float, tileset:ts.AnyOf4<String, Array<String>, Tileset, Array<Tileset>>, ?x:Float, ?y:Float);
	/**
		Used internally by physics system to perform fast type checks.
	**/
	final isTilemap : Bool;
	/**
		The Tilemap that this layer is a part of.
	**/
	var tilemap : Tilemap;
	/**
		The index of the LayerData associated with this layer.
	**/
	var layerIndex : Float;
	/**
		The LayerData associated with this layer. LayerData can only be associated with one
		tilemap layer.
	**/
	var layer : LayerData;
	/**
		An array of `Tileset` objects associated with this layer.
	**/
	var tileset : Array<Tileset>;
	/**
		The total number of tiles drawn by the renderer in the last frame.
	**/
	final tilesDrawn : Float;
	/**
		The total number of tiles in this layer. Updated every frame.
	**/
	final tilesTotal : Float;
	/**
		Used internally during rendering. This holds the tiles that are visible within the Camera.
	**/
	var culledTiles : Array<Tile>;
	/**
		You can control if the camera should cull tiles on this layer before rendering them or not.
		
		By default the camera will try to cull the tiles in this layer, to avoid over-drawing to the renderer.
		
		However, there are some instances when you may wish to disable this, and toggling this flag allows
		you to do so. Also see `setSkipCull` for a chainable method that does the same thing.
	**/
	var skipCull : Bool;
	/**
		The amount of extra tiles to add into the cull rectangle when calculating its horizontal size.
		
		See the method `setCullPadding` for more details.
	**/
	var cullPaddingX : Float;
	/**
		The amount of extra tiles to add into the cull rectangle when calculating its vertical size.
		
		See the method `setCullPadding` for more details.
	**/
	var cullPaddingY : Float;
	/**
		The callback that is invoked when the tiles are culled.
		
		It will call a different function based on the map orientation:
		
		Orthogonal (the default) is `TilemapComponents.CullTiles`
		Isometric is `TilemapComponents.IsometricCullTiles`
		Hexagonal is `TilemapComponents.HexagonalCullTiles`
		Staggered is `TilemapComponents.StaggeredCullTiles`
		
		However, you can override this to call any function you like.
		
		It will be sent 4 arguments:
		
		1. The Phaser.Tilemaps.LayerData object for this Layer
		2. The Camera that is culling the layer. You can check its `dirty` property to see if it has changed since the last cull.
		3. A reference to the `culledTiles` array, which should be used to store the tiles you want rendered.
		4. The Render Order constant.
		
		See the `TilemapComponents.CullTiles` source code for details on implementing your own culling system.
	**/
	var cullCallback : haxe.Constraints.Function;
	/**
		An array holding the mapping between the tile indexes and the tileset they belong to.
	**/
	var gidMap : Array<Tileset>;
	/**
		The Tilemap Layer Collision Category.
		
		This is exclusively used by the Arcade Physics system.
		
		This can be set to any valid collision bitfield value.
		
		See the `setCollisionCategory` method for more details.
	**/
	var collisionCategory : Float;
	/**
		The Tilemap Layer Collision Mask.
		
		This is exclusively used by the Arcade Physics system.
		
		See the `setCollidesWith` method for more details.
	**/
	var collisionMask : Float;
	/**
		The horizontal origin of this Tilemap Layer.
	**/
	final originX : Float;
	/**
		The vertical origin of this Tilemap Layer.
	**/
	final originY : Float;
	/**
		The horizontal display origin of this Tilemap Layer.
	**/
	final displayOriginX : Float;
	/**
		The vertical display origin of this Tilemap Layer.
	**/
	final displayOriginY : Float;
	/**
		Sets the rendering (draw) order of the tiles in this layer.
		
		The default is 'right-down', meaning it will order the tiles starting from the top-left,
		drawing to the right and then moving down to the next row.
		
		The draw orders are:
		
		0 = right-down
		1 = left-down
		2 = right-up
		3 = left-up
		
		Setting the render order does not change the tiles or how they are stored in the layer,
		it purely impacts the order in which they are rendered.
		
		You can provide either an integer (0 to 3), or the string version of the order.
	**/
	function setRenderOrder(renderOrder:ts.AnyOf2<String, Float>):TilemapLayer;
	/**
		Calculates interesting faces at the given tile coordinates of the specified layer. Interesting
		faces are used internally for optimizing collisions against tiles. This method is mostly used
		internally to optimize recalculating faces when only one tile has been changed.
	**/
	function calculateFacesAt(tileX:Float, tileY:Float):TilemapLayer;
	/**
		Calculates interesting faces within the rectangular area specified (in tile coordinates) of the
		layer. Interesting faces are used internally for optimizing collisions against tiles. This method
		is mostly used internally.
	**/
	function calculateFacesWithin(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float):TilemapLayer;
	/**
		Creates a Sprite for every object matching the given tile indexes in the layer. You can
		optionally specify if each tile will be replaced with a new tile after the Sprite has been
		created. This is useful if you want to lay down special tiles in a level that are converted to
		Sprites, but want to replace the tile itself with a floor tile or similar once converted.
	**/
	function createFromTiles(indexes:ts.AnyOf2<Float, Array<Dynamic>>, replacements:Null<ts.AnyOf2<Float, Array<Dynamic>>>, ?spriteConfig:phaser.types.gameobjects.sprite.SpriteConfig, ?scene:phaser.Scene, ?camera:phaser.cameras.scene2d.Camera):Array<phaser.gameobjects.Sprite>;
	/**
		Returns the tiles in the given layer that are within the cameras viewport.
		This is used internally during rendering.
	**/
	function cull(?camera:phaser.cameras.scene2d.Camera):Array<Tile>;
	/**
		Copies the tiles in the source rectangular area to a new destination (all specified in tile
		coordinates) within the layer. This copies all tile properties & recalculates collision
		information in the destination region.
	**/
	function copy(srcTileX:Float, srcTileY:Float, width:Float, height:Float, destTileX:Float, destTileY:Float, ?recalculateFaces:Bool):TilemapLayer;
	/**
		Sets the tiles in the given rectangular area (in tile coordinates) of the layer with the
		specified index. Tiles will be set to collide if the given index is a colliding index.
		Collision information in the region will be recalculated.
	**/
	function fill(index:Float, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?recalculateFaces:Bool):TilemapLayer;
	/**
		For each tile in the given rectangular area (in tile coordinates) of the layer, run the given
		filter callback function. Any tiles that pass the filter test (i.e. where the callback returns
		true) will returned as a new array. Similar to Array.prototype.Filter in vanilla JS.
	**/
	function filterTiles(callback:haxe.Constraints.Function, ?context:Dynamic, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:phaser.types.tilemaps.FilteringOptions):Array<Tile>;
	/**
		Searches the entire map layer for the first tile matching the given index, then returns that Tile
		object. If no match is found, it returns null. The search starts from the top-left tile and
		continues horizontally until it hits the end of the row, then it drops down to the next column.
		If the reverse boolean is true, it scans starting from the bottom-right corner traveling up to
		the top-left.
	**/
	function findByIndex(index:Float, ?skip:Float, ?reverse:Bool):Tile;
	/**
		Find the first tile in the given rectangular area (in tile coordinates) of the layer that
		satisfies the provided testing function. I.e. finds the first tile for which `callback` returns
		true. Similar to Array.prototype.find in vanilla JS.
	**/
	function findTile(callback:FindTileCallback, ?context:Dynamic, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:phaser.types.tilemaps.FilteringOptions):Null<Tile>;
	/**
		For each tile in the given rectangular area (in tile coordinates) of the layer, run the given
		callback. Similar to Array.prototype.forEach in vanilla JS.
	**/
	function forEachTile(callback:EachTileCallback, ?context:Dynamic, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:phaser.types.tilemaps.FilteringOptions):TilemapLayer;
	/**
		Sets an additive tint on each Tile within the given area.
		
		The tint works by taking the pixel color values from the tileset texture, and then
		multiplying it by the color value of the tint.
		
		If no area values are given then all tiles will be tinted to the given color.
		
		To remove a tint call this method with either no parameters, or by passing white `0xffffff` as the tint color.
		
		If a tile already has a tint set then calling this method will override that.
	**/
	function setTint(?tint:Float, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:phaser.types.tilemaps.FilteringOptions):TilemapLayer;
	/**
		Sets a fill-based tint on each Tile within the given area.
		
		Unlike an additive tint, a fill-tint literally replaces the pixel colors from the texture
		with those in the tint.
		
		If no area values are given then all tiles will be tinted to the given color.
		
		To remove a tint call this method with either no parameters, or by passing white `0xffffff` as the tint color.
		
		If a tile already has a tint set then calling this method will override that.
	**/
	function setTintFill(?tint:Float, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:phaser.types.tilemaps.FilteringOptions):TilemapLayer;
	/**
		Gets a tile at the given tile coordinates from the given layer.
	**/
	function getTileAt(tileX:Float, tileY:Float, ?nonNull:Bool):Tile;
	/**
		Gets a tile at the given world coordinates from the given layer.
	**/
	function getTileAtWorldXY(worldX:Float, worldY:Float, ?nonNull:Bool, ?camera:phaser.cameras.scene2d.Camera):Tile;
	/**
		Gets a tile at the given world coordinates from the given isometric layer.
	**/
	function getIsoTileAtWorldXY(worldX:Float, worldY:Float, ?originTop:Bool, ?nonNull:Bool, ?camera:phaser.cameras.scene2d.Camera):Tile;
	/**
		Gets the tiles in the given rectangular area (in tile coordinates) of the layer.
	**/
	function getTilesWithin(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:phaser.types.tilemaps.FilteringOptions):Array<Tile>;
	/**
		Gets the tiles that overlap with the given shape in the given layer. The shape must be a Circle,
		Line, Rectangle or Triangle. The shape should be in world coordinates.
	**/
	function getTilesWithinShape(shape:ts.AnyOf4<phaser.geom.Triangle, phaser.geom.Circle, phaser.geom.Line, phaser.geom.Rectangle>, ?filteringOptions:phaser.types.tilemaps.FilteringOptions, ?camera:phaser.cameras.scene2d.Camera):Array<Tile>;
	/**
		Gets the tiles in the given rectangular area (in world coordinates) of the layer.
	**/
	function getTilesWithinWorldXY(worldX:Float, worldY:Float, width:Float, height:Float, ?filteringOptions:phaser.types.tilemaps.FilteringOptions, ?camera:phaser.cameras.scene2d.Camera):Array<Tile>;
	/**
		Checks if there is a tile at the given location (in tile coordinates) in the given layer. Returns
		false if there is no tile or if the tile at that location has an index of -1.
	**/
	function hasTileAt(tileX:Float, tileY:Float):Bool;
	/**
		Checks if there is a tile at the given location (in world coordinates) in the given layer. Returns
		false if there is no tile or if the tile at that location has an index of -1.
	**/
	function hasTileAtWorldXY(worldX:Float, worldY:Float, ?camera:phaser.cameras.scene2d.Camera):Bool;
	/**
		Puts a tile at the given tile coordinates in the specified layer. You can pass in either an index
		or a Tile object. If you pass in a Tile, all attributes will be copied over to the specified
		location. If you pass in an index, only the index at the specified location will be changed.
		Collision information will be recalculated at the specified location.
	**/
	function putTileAt(tile:ts.AnyOf2<Float, Tile>, tileX:Float, tileY:Float, ?recalculateFaces:Bool):Tile;
	/**
		Puts a tile at the given world coordinates (pixels) in the specified layer. You can pass in either
		an index or a Tile object. If you pass in a Tile, all attributes will be copied over to the
		specified location. If you pass in an index, only the index at the specified location will be
		changed. Collision information will be recalculated at the specified location.
	**/
	function putTileAtWorldXY(tile:ts.AnyOf2<Float, Tile>, worldX:Float, worldY:Float, ?recalculateFaces:Bool, ?camera:phaser.cameras.scene2d.Camera):Tile;
	/**
		Puts an array of tiles or a 2D array of tiles at the given tile coordinates in the specified
		layer. The array can be composed of either tile indexes or Tile objects. If you pass in a Tile,
		all attributes will be copied over to the specified location. If you pass in an index, only the
		index at the specified location will be changed. Collision information will be recalculated
		within the region tiles were changed.
	**/
	function putTilesAt(tile:ts.AnyOf4<Array<Float>, Array<Array<Float>>, Array<Tile>, Array<Array<Tile>>>, tileX:Float, tileY:Float, ?recalculateFaces:Bool):TilemapLayer;
	/**
		Randomizes the indexes of a rectangular region of tiles (in tile coordinates) within the
		specified layer. Each tile will receive a new index. If an array of indexes is passed in, then
		those will be used for randomly assigning new tile indexes. If an array is not provided, the
		indexes found within the region (excluding -1) will be used for randomly assigning new tile
		indexes. This method only modifies tile indexes and does not change collision information.
	**/
	function randomize(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?indexes:Array<Float>):TilemapLayer;
	/**
		Removes the tile at the given tile coordinates in the specified layer and updates the layers
		collision information.
	**/
	function removeTileAt(tileX:Float, tileY:Float, ?replaceWithNull:Bool, ?recalculateFaces:Bool):Tile;
	/**
		Removes the tile at the given world coordinates in the specified layer and updates the layers
		collision information.
	**/
	function removeTileAtWorldXY(worldX:Float, worldY:Float, ?replaceWithNull:Bool, ?recalculateFaces:Bool, ?camera:phaser.cameras.scene2d.Camera):Tile;
	/**
		Draws a debug representation of the layer to the given Graphics. This is helpful when you want to
		get a quick idea of which of your tiles are colliding and which have interesting faces. The tiles
		are drawn starting at (0, 0) in the Graphics, allowing you to place the debug representation
		wherever you want on the screen.
	**/
	function renderDebug(graphics:phaser.gameobjects.Graphics, ?styleConfig:phaser.types.tilemaps.StyleConfig):TilemapLayer;
	/**
		Scans the given rectangular area (given in tile coordinates) for tiles with an index matching
		`findIndex` and updates their index to match `newIndex`. This only modifies the index and does
		not change collision information.
	**/
	function replaceByIndex(findIndex:Float, newIndex:Float, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float):TilemapLayer;
	/**
		You can control if the Cameras should cull tiles before rendering them or not.
		
		By default the camera will try to cull the tiles in this layer, to avoid over-drawing to the renderer.
		
		However, there are some instances when you may wish to disable this.
	**/
	function setSkipCull(?value:Bool):TilemapLayer;
	/**
		When a Camera culls the tiles in this layer it does so using its view into the world, building up a
		rectangle inside which the tiles must exist or they will be culled. Sometimes you may need to expand the size
		of this 'cull rectangle', especially if you plan on rotating the Camera viewing the layer. Do so
		by providing the padding values. The values given are in tiles, not pixels. So if the tile width was 32px
		and you set `paddingX` to be 4, it would add 32px x 4 to the cull rectangle (adjusted for scale)
	**/
	function setCullPadding(?paddingX:Float, ?paddingY:Float):TilemapLayer;
	/**
		Sets collision on the given tile or tiles within a layer by index. You can pass in either a
		single numeric index or an array of indexes: [2, 3, 15, 20]. The `collides` parameter controls if
		collision will be enabled (true) or disabled (false).
	**/
	function setCollision(indexes:ts.AnyOf2<Float, Array<Dynamic>>, ?collides:Bool, ?recalculateFaces:Bool, ?updateLayer:Bool):TilemapLayer;
	/**
		Sets collision on a range of tiles in a layer whose index is between the specified `start` and
		`stop` (inclusive). Calling this with a start value of 10 and a stop value of 14 would set
		collision for tiles 10, 11, 12, 13 and 14. The `collides` parameter controls if collision will be
		enabled (true) or disabled (false).
	**/
	function setCollisionBetween(start:Float, stop:Float, ?collides:Bool, ?recalculateFaces:Bool):TilemapLayer;
	/**
		Sets collision on the tiles within a layer by checking tile properties. If a tile has a property
		that matches the given properties object, its collision flag will be set. The `collides`
		parameter controls if collision will be enabled (true) or disabled (false). Passing in
		`{ collides: true }` would update the collision flag on any tiles with a "collides" property that
		has a value of true. Any tile that doesn't have "collides" set to true will be ignored. You can
		also use an array of values, e.g. `{ types: ["stone", "lava", "sand" ] }`. If a tile has a
		"types" property that matches any of those values, its collision flag will be updated.
	**/
	function setCollisionByProperty(properties:Dynamic, ?collides:Bool, ?recalculateFaces:Bool):TilemapLayer;
	/**
		Sets collision on all tiles in the given layer, except for tiles that have an index specified in
		the given array. The `collides` parameter controls if collision will be enabled (true) or
		disabled (false). Tile indexes not currently in the layer are not affected.
	**/
	function setCollisionByExclusion(indexes:Array<Float>, ?collides:Bool, ?recalculateFaces:Bool):TilemapLayer;
	/**
		Sets collision on the tiles within a layer by checking each tiles collision group data
		(typically defined in Tiled within the tileset collision editor). If any objects are found within
		a tiles collision group, the tile's colliding information will be set. The `collides` parameter
		controls if collision will be enabled (true) or disabled (false).
	**/
	function setCollisionFromCollisionGroup(?collides:Bool, ?recalculateFaces:Bool):TilemapLayer;
	/**
		Sets a global collision callback for the given tile index within the layer. This will affect all
		tiles on this layer that have the same index. If a callback is already set for the tile index it
		will be replaced. Set the callback to null to remove it. If you want to set a callback for a tile
		at a specific location on the map then see setTileLocationCallback.
	**/
	function setTileIndexCallback(indexes:ts.AnyOf2<Float, Array<Float>>, callback:haxe.Constraints.Function, callbackContext:Dynamic):TilemapLayer;
	/**
		Sets a collision callback for the given rectangular area (in tile coordinates) within the layer.
		If a callback is already set for the tile index it will be replaced. Set the callback to null to
		remove it.
	**/
	function setTileLocationCallback(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?callback:haxe.Constraints.Function, ?callbackContext:Dynamic):TilemapLayer;
	/**
		Shuffles the tiles in a rectangular region (specified in tile coordinates) within the given
		layer. It will only randomize the tiles in that area, so if they're all the same nothing will
		appear to have changed! This method only modifies tile indexes and does not change collision
		information.
	**/
	function shuffle(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float):TilemapLayer;
	/**
		Scans the given rectangular area (given in tile coordinates) for tiles with an index matching
		`indexA` and swaps then with `indexB`. This only modifies the index and does not change collision
		information.
	**/
	function swapByIndex(tileA:Float, tileB:Float, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float):TilemapLayer;
	/**
		Converts from tile X coordinates (tile units) to world X coordinates (pixels), factoring in the
		layers position, scale and scroll.
	**/
	function tileToWorldX(tileX:Float, ?camera:phaser.cameras.scene2d.Camera):Float;
	/**
		Converts from tile Y coordinates (tile units) to world Y coordinates (pixels), factoring in the
		layers position, scale and scroll.
	**/
	function tileToWorldY(tileY:Float, ?camera:phaser.cameras.scene2d.Camera):Float;
	/**
		Converts from tile XY coordinates (tile units) to world XY coordinates (pixels), factoring in the
		layers position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
	**/
	function tileToWorldXY(tileX:Float, tileY:Float, ?point:phaser.math.Vector2, ?camera:phaser.cameras.scene2d.Camera):phaser.math.Vector2;
	/**
		Returns an array of Vector2s where each entry corresponds to the corner of the requested tile.
		
		The `tileX` and `tileY` parameters are in tile coordinates, not world coordinates.
		
		The corner coordinates are in world space, having factored in TilemapLayer scale, position
		and the camera, if given.
		
		The size of the array will vary based on the orientation of the map. For example an
		orthographic map will return an array of 4 vectors, where-as a hexagonal map will,
		of course, return an array of 6 corner vectors.
	**/
	function getTileCorners(tileX:Float, tileY:Float, ?camera:phaser.cameras.scene2d.Camera):Null<Array<phaser.math.Vector2>>;
	/**
		Randomizes the indexes of a rectangular region of tiles (in tile coordinates) within the
		specified layer. Each tile will receive a new index. New indexes are drawn from the given
		weightedIndexes array. An example weighted array:
		
		[
		  { index: 6, weight: 4 },    // Probability of index 6 is 4 / 8
		  { index: 7, weight: 2 },    // Probability of index 7 would be 2 / 8
		  { index: 8, weight: 1.5 },  // Probability of index 8 would be 1.5 / 8
		  { index: 26, weight: 0.5 }  // Probability of index 27 would be 0.5 / 8
		]
		
		The probability of any index being choose is (the index's weight) / (sum of all weights). This
		method only modifies tile indexes and does not change collision information.
	**/
	function weightedRandomize(weightedIndexes:Array<Dynamic>, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float):TilemapLayer;
	/**
		Converts from world X coordinates (pixels) to tile X coordinates (tile units), factoring in the
		layers position, scale and scroll.
		
		You cannot call this method for Isometric or Hexagonal tilemaps as they require
		both `worldX` and `worldY` values to determine the correct tile, instead you
		should use the `worldToTileXY` method.
	**/
	function worldToTileX(worldX:Float, ?snapToFloor:Bool, ?camera:phaser.cameras.scene2d.Camera):Float;
	/**
		Converts from world Y coordinates (pixels) to tile Y coordinates (tile units), factoring in the
		layers position, scale and scroll.
		
		You cannot call this method for Isometric or Hexagonal tilemaps as they require
		both `worldX` and `worldY` values to determine the correct tile, instead you
		should use the `worldToTileXY` method.
	**/
	function worldToTileY(worldY:Float, ?snapToFloor:Bool, ?camera:phaser.cameras.scene2d.Camera):Float;
	/**
		Converts from world XY coordinates (pixels) to tile XY coordinates (tile units), factoring in the
		layers position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
	**/
	function worldToTileXY(worldX:Float, worldY:Float, ?snapToFloor:Bool, ?point:phaser.math.Vector2, ?camera:phaser.cameras.scene2d.Camera):phaser.math.Vector2;
	/**
		Destroys this TilemapLayer and removes its link to the associated LayerData.
	**/
	function destroy(?removeFromTilemap:Bool):Void;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():TilemapLayer;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
		
		If your game is running under WebGL you can optionally specify four different alpha values, each of which
		correspond to the four corners of the Game Object. Under Canvas only the `topLeft` value given is used.
	**/
	function setAlpha(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):TilemapLayer;
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
	function setBlendMode(value:ts.AnyOf3<String, Float, phaser.BlendModes>):TilemapLayer;
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
	function setSize(width:Float, height:Float):TilemapLayer;
	/**
		Sets the display size of this Game Object.
		
		Calling this will adjust the scale.
	**/
	function setDisplaySize(width:Float, height:Float):TilemapLayer;
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
	function setDepth(value:Float):TilemapLayer;
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
	function toggleFlipX():TilemapLayer;
	/**
		Toggles the vertical flipped state of this Game Object.
	**/
	function toggleFlipY():TilemapLayer;
	/**
		Sets the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlipX(value:Bool):TilemapLayer;
	/**
		Sets the vertical flipped state of this Game Object.
	**/
	function setFlipY(value:Bool):TilemapLayer;
	/**
		Sets the horizontal and vertical flipped state of this Game Object.
		
		A Game Object that is flipped will render inversed on the flipped axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlip(x:Bool, y:Bool):TilemapLayer;
	/**
		Resets the horizontal and vertical flipped state of this Game Object back to their default un-flipped state.
	**/
	function resetFlip():TilemapLayer;
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
	function setMask(mask:ts.AnyOf2<phaser.display.masks.BitmapMask, phaser.display.masks.GeometryMask>):TilemapLayer;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):TilemapLayer;
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
	function createBitmapMask<G, T>(?maskObject:ts.AnyOf2<phaser.gameobjects.GameObject, phaser.textures.DynamicTexture>, ?x:Float, ?y:Float, ?texture:ts.AnyOf2<String, phaser.textures.Texture>, ?frame:ts.AnyOf3<String, Float, phaser.textures.Frame>):phaser.display.masks.BitmapMask;
	/**
		Creates and returns a Geometry Mask. This mask can be used by any Game Object,
		including this one.
		
		To create the mask you need to pass in a reference to a Graphics Game Object.
		
		If you do not provide a graphics object, and this Game Object is an instance
		of a Graphics object, then it will use itself to create the mask.
		
		This means you can call this method to create a Geometry Mask from any Graphics Game Object.
	**/
	function createGeometryMask<G, S>(?graphics:ts.AnyOf2<phaser.gameobjects.Graphics, phaser.gameobjects.Shape>):phaser.display.masks.GeometryMask;
	/**
		Sets the origin of this Game Object.
		
		The values are given in the range 0 to 1.
	**/
	function setOrigin(?x:Float, ?y:Float):TilemapLayer;
	/**
		Sets the origin of this Game Object based on the Pivot values in its Frame.
	**/
	function setOriginFromFrame():TilemapLayer;
	/**
		Sets the display origin of this Game Object.
		The difference between this and setting the origin is that you can use pixel values for setting the display origin.
	**/
	function setDisplayOrigin(?x:Float, ?y:Float):TilemapLayer;
	/**
		Updates the Display Origin cached values internally stored on this Game Object.
		You don't usually call this directly, but it is exposed for edge-cases where you may.
	**/
	function updateDisplayOrigin():TilemapLayer;
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
	function setPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.WebGLPipeline>, ?pipelineData:Dynamic, ?copyData:Bool):TilemapLayer;
	/**
		Adds an entry to the `pipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPipelineData(key:String, ?value:Dynamic):TilemapLayer;
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
	function setPostPipeline(pipelines:ts.AnyOf6<String, haxe.Constraints.Function, Array<String>, Array<haxe.Constraints.Function>, phaser.renderer.webgl.pipelines.PostFXPipeline, Array<phaser.renderer.webgl.pipelines.PostFXPipeline>>, ?pipelineData:Dynamic, ?copyData:Bool):TilemapLayer;
	/**
		Adds an entry to the `postPipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
	**/
	function setPostPipelineData(key:String, ?value:Dynamic):TilemapLayer;
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
	function removePostPipeline(pipeline:ts.AnyOf2<String, phaser.renderer.webgl.pipelines.PostFXPipeline>):TilemapLayer;
	/**
		Removes all Pre and Post FX Controllers from this Game Object.
		
		If you wish to remove a single controller, use the `preFX.remove(fx)` or `postFX.remove(fx)` methods instead.
		
		If you wish to clear a single controller, use the `preFX.clear()` or `postFX.clear()` methods instead.
	**/
	function clearFX():TilemapLayer;
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
	function setScrollFactor(x:Float, ?y:Float):TilemapLayer;
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
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):TilemapLayer;
	/**
		Copies an object's coordinates to this Game Object's position.
	**/
	function copyPosition(source:ts.AnyOf3<phaser.types.math.Vector2Like, phaser.types.math.Vector3Like, phaser.types.math.Vector4Like>):TilemapLayer;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):TilemapLayer;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):TilemapLayer;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):TilemapLayer;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(?x:Float, ?y:Float):TilemapLayer;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):TilemapLayer;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):TilemapLayer;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):TilemapLayer;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):TilemapLayer;
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
	function setVisible(value:Bool):TilemapLayer;
	/**
		Sets the Collision Category that this Arcade Physics Body
		will use in order to determine what it can collide with.
		
		It can only have one single category assigned to it.
		
		If you wish to reset the collision category and mask, call
		the `resetCollisionCategory` method.
	**/
	function setCollisionCategory(category:Float):TilemapLayer;
	/**
		Checks to see if the given Collision Category will collide with
		this Arcade Physics object or not.
	**/
	function willCollideWith(category:Float):Bool;
	/**
		Adds the given Collision Category to the list of those that this
		Arcade Physics Body will collide with.
	**/
	function addCollidesWith(category:Float):TilemapLayer;
	/**
		Removes the given Collision Category from the list of those that this
		Arcade Physics Body will collide with.
	**/
	function removeCollidesWith(category:Float):TilemapLayer;
	/**
		Sets all of the Collision Categories that this Arcade Physics Body
		will collide with. You can either pass a single category value, or
		an array of them.
		
		Calling this method will reset all of the collision categories,
		so only those passed to this method are enabled.
		
		If you wish to add a new category to the existing mask, call
		the `addCollisionCategory` method.
		
		If you wish to reset the collision category and mask, call
		the `resetCollisionCategory` method.
	**/
	function setCollidesWith(categories:ts.AnyOf2<Float, Array<Float>>):TilemapLayer;
	/**
		Resets the Collision Category and Mask back to the defaults,
		which is to collide with everything.
	**/
	function resetCollisionCategory():TilemapLayer;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):TilemapLayer;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):TilemapLayer;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):TilemapLayer;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():TilemapLayer;
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
	function setData<T>(key:ts.AnyOf2<String, T>, ?data:Dynamic):TilemapLayer;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:String, ?amount:Float):TilemapLayer;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:String):TilemapLayer;
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
	function setInteractive(?hitArea:Dynamic, ?callback:phaser.types.input.HitAreaCallback, ?dropZone:Bool):TilemapLayer;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():TilemapLayer;
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
	function removeInteractive():TilemapLayer;
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
	function addToDisplayList(?displayList:ts.AnyOf2<phaser.gameobjects.Layer, phaser.gameobjects.DisplayList>):TilemapLayer;
	/**
		Adds this Game Object to the Update List belonging to the Scene.
		
		When a Game Object is added to the Update List it will have its `preUpdate` method called
		every game frame. This method is passed two parameters: `delta` and `time`.
		
		If you wish to run your own logic within `preUpdate` then you should always call
		`super.preUpdate(delta, time)` within it, or it may fail to process required operations,
		such as Sprite animations.
	**/
	function addToUpdateList():TilemapLayer;
	/**
		Removes this Game Object from the Display List it is currently on.
		
		A Game Object can only exist on one Display List at any given time, but may move freely removed
		and added back at a later stage.
		
		You can query which list it is on by looking at the `Phaser.GameObjects.GameObject#displayList` property.
		
		If a Game Object isn't on any Display List, it will not be rendered. If you just wish to temporarly
		disable it from rendering, consider using the `setVisible` method, instead.
	**/
	function removeFromDisplayList():TilemapLayer;
	/**
		Removes this Game Object from the Scene's Update List.
		
		When a Game Object is on the Update List, it will have its `preUpdate` method called
		every game frame. Calling this method will remove it from the list, preventing this.
		
		Removing a Game Object from the Update List will stop most internal functions working.
		For example, removing a Sprite from the Update List will prevent it from being able to
		run animations.
	**/
	function removeFromUpdateList():TilemapLayer;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TilemapLayer;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TilemapLayer;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TilemapLayer;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):TilemapLayer;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):TilemapLayer;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):TilemapLayer;
	static var prototype : TilemapLayer;
}