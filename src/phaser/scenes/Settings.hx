package phaser.scenes;

@:native("Phaser.Scenes.Settings") @valueModuleOnly extern class Settings {
	/**
		Takes a Scene configuration object and returns a fully formed System Settings object.
	**/
	static function create(config:ts.AnyOf2<String, phaser.types.scenes.SettingsConfig>):phaser.types.scenes.SettingsObject;
}