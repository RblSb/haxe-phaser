package phaser.physics;

@:native("Phaser.Physics.Matter") @valueModuleOnly extern class Matter {
	/**
		A Matter Game Object is a generic object that allows you to combine any Phaser Game Object,
		including those you have extended or created yourself, with all of the Matter Components.
		
		This enables you to use component methods such as `setVelocity` or `isSensor` directly from
		this Game Object.
	**/
	static function MatterGameObject(world:phaser.physics.matter.World, gameObject:phaser.gameobjects.GameObject, ?options:ts.AnyOf2<phaser.types.physics.matter.MatterBodyConfig, matterjs.Body>, ?addToWorld:Bool):phaser.gameobjects.GameObject;
}