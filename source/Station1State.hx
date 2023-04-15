package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.FlxSubState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import station1.MoonHero;

class Station1State extends FlxState
{
	var starrysky:FlxSprite;
	var crosshair:FlxSprite;
	var telecamera:FlxCamera;
	var quitbutton:FlxButton;

	override public function create()
	{
		starrysky = new FlxSprite();
		starrysky.loadGraphic(AssetPaths.starrysky__png);
		crosshair = new FlxSprite();
		crosshair.loadGraphic(AssetPaths.crosshair__png);
		crosshair.scrollFactor.set(0);

		quitbutton = createQuitButton("back", () ->
		{
			// close();
			FlxG.switchState(new PlayState());
		}, 50, 50, FlxColor.LIME);

		telecamera = new FlxCamera(0, 0, 640, 480);
		telecamera.bgColor = FlxColor.TRANSPARENT;
		telecamera.setScrollBoundsRect(0, 0, 2000, 2000);
		FlxG.cameras.reset(telecamera);

		add(starrysky);
		add(new MoonHero(150, 250));
		add(new MoonHero(300, 150));
		add(crosshair);
		add(quitbutton);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.getPosition().x > telecamera.scroll.x + 520)
		{
			telecamera.scroll.x += elapsed * 60;
		}

		if (FlxG.mouse.getPosition().x < telecamera.scroll.x + 100)
		{
			telecamera.scroll.x += elapsed * -60;
		}

		if (FlxG.mouse.getPosition().y > telecamera.scroll.y + 300)
		{
			telecamera.scroll.y += elapsed * 60;
		}

		if (FlxG.mouse.getPosition().y < telecamera.scroll.y + 100)
		{
			telecamera.scroll.y += elapsed * -60;
		}
	}

	private function createQuitButton(labelText:String, onClick:Void->Void, posx:Int = 0, posy:Int = 0, color:FlxColor = FlxColor.BLACK):FlxButton
	{
		var button = new FlxButton(0, 0, labelText, onClick);
		button.makeGraphic(20, 20, color);
		button.label.size = 10;
		button.width = button.label.width;
		button.height = button.label.height;
		button.setPosition(posx, posy);
		button.scrollFactor.set(0);

		return button;
	}
}
