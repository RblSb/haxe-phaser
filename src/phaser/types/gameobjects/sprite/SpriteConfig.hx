package phaser.types.gameobjects.sprite;

typedef SpriteConfig = phaser.types.gameobjects.GameObjectConfig & {
	/**
		The key, or instance of the Texture this Game Object will use to render with, as stored in the Texture Manager.
	**/
	@:optional
	var key : ts.AnyOf2<String, phaser.textures.Texture>;
	/**
		An optional frame from the Texture this Game Object is rendering with.
	**/
	@:optional
	var frame : ts.AnyOf2<String, Float>;
	/**
		The string-based key of the animation to play, or an Animation instance, or a `PlayAnimationConfig` object.
	**/
	@:optional
	var anims : ts.AnyOf3<String, phaser.animations.Animation, phaser.types.animations.PlayAnimationConfig>;
	/**
		This property is used exclusively by `Tilemap.createFromTiles`. Set to `true` if this Sprite is being created by a Tilemap and is part of a spritesheet.
	**/
	@:optional
	var useSpriteSheet : Bool;
};