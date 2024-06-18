package phaser;

@:native("Phaser.Sound") @valueModuleOnly extern class Sound {
	/**
		Creates a Web Audio, HTML5 Audio or No Audio Sound Manager based on config and device settings.
		
		Be aware of https://developers.google.com/web/updates/2017/09/autoplay-policy-changes
	**/
	static function SoundManagerCreator(game:Game):ts.AnyOf3<phaser.sound.NoAudioSoundManager, phaser.sound.HTML5AudioSoundManager, phaser.sound.WebAudioSoundManager>;
}