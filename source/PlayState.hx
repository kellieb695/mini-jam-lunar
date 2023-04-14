package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import moon.MoonHero;

class PlayState extends FlxState
{
	private var background:FlxSprite;

	override public function create()
	{
		add(new MoonHero(150, 250));
		background = new FlxSprite();
		background.loadGraphic(AssetPaths.panmoon__png);

		camera = new FlxCamera(0, 0, 640, 480);
		// camera.useBgAlphaBlending = true;
		camera.bgColor = FlxColor.TRANSPARENT;
		camera.setScrollBoundsRect(0, 0, 2560, 480);
		FlxG.cameras.reset(camera);
		add(background);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new AsteroidsState());
		}

		if (FlxG.keys.pressed.RIGHT)
		{
			camera.scroll.x += elapsed * 40;
		}

		if (FlxG.keys.pressed.LEFT)
		{
			camera.scroll.y += elapsed * -40;
		}
	}
}
