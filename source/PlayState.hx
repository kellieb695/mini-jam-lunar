package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import station1.MoonHero;

class PlayState extends FlxState
{
	private var background:FlxSprite;

	public var station1:FlxSprite;

	override public function create()
	{
		add(new MoonHero(150, 250));
		background = new FlxSprite();
		background.loadGraphic(AssetPaths.panmoon__png);

		camera = new FlxCamera(0, 0, 640, 480);
		camera.bgColor = FlxColor.TRANSPARENT;
		camera.setScrollBoundsRect(0, 0, 2560, 480);
		FlxG.cameras.reset(camera);

		var station1Button = createStationButton("Play Game", () ->
		{
			FlxG.switchState(new Station1State());
		}, 700, 400, FlxColor.PINK);

		var station2Button = createStationButton("Play Game", () ->
		{
			FlxG.switchState(new Station1State());
		}, 1200, 400, FlxColor.BLUE);

		var station3Button = createStationButton("Play Game", () ->
		{
			FlxG.switchState(new Station1State());
		}, 2000, 400, FlxColor.GREEN);

		add(background);
		add(station1Button);
		add(station2Button);
		add(station3Button);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.getPosition().x > camera.scroll.x + 520)
		{
			camera.scroll.x += elapsed * 60;
		}

		if (FlxG.mouse.getPosition().x < camera.scroll.x + 100)
		{
			camera.scroll.x += elapsed * -60;
		}
	}

	private function createStationButton(labelText:String, onClick:Void->Void, posx:Int = 0, posy:Int = 0, color:FlxColor = FlxColor.BLACK):FlxButton
	{
		var button = new FlxButton(0, 0, labelText, onClick);
		button.makeGraphic(50, 50, color);
		button.label.size = 15;
		button.width = button.label.width;
		button.height = button.label.height;
		button.setPosition(posx, posy);
		button.scrollFactor.set(1);

		return button;
	}
}
