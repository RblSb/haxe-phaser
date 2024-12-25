package phaser.loader.filetypes;

#if SPINE_PLUGIN
extern class SpineFile extends phaser.loader.MultiFile 
{
    public function new(loader: phaser.loader.LoaderPlugin,
        key: haxe.extern.EitherType<String, phaser.loader.filetypes.SpineFileConfig>,
        jsonURL: haxe.extern.EitherType<String, Array<String>>,
        atlasURL: String,
        preMultipliedAlpha: Bool,
        jsonXhrSettings: phaser.types.loader.XHRSettingsObject,
        atlasXhrSettings: phaser.types.loader.XHRSettingsObject);
    public function addToCache();
}
#end
