package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import telescope.MoonHero;

class PlayState extends FlxState
{
	private var background:FlxSprite;

	public var station1:FlxSprite;

	var scrollcamera:FlxCamera;

	var station1State:FlxSubState;

	override public function create()
	{
		add(new MoonHero(150, 250));
		background = new FlxSprite();
		background.loadGraphic(AssetPaths.panmoon__png);

		// station1State = new Station1State();

		scrollcamera = new FlxCamera(0, 0, 640, 480);
		scrollcamera.bgColor = FlxColor.TRANSPARENT;
		scrollcamera.setScrollBoundsRect(0, 0, 2560, 480);
		FlxG.cameras.reset(scrollcamera);

		var station1Button = createStationButton(() ->
		{
			// openSubState(station1State);
			FlxG.switchState(new TelescopeState());
		}, 200, 400, FlxColor.PINK);

		var station2Button = createStationButton(() ->
		{
			FlxG.switchState(new TelescopeState());
		}, 300, 400, FlxColor.BLUE);

		var station3Button = createStationButton(() ->
		{
			FlxG.switchState(new RocketState());
		}, 400, 400, FlxColor.GREEN);

		add(background);
		add(station1Button);
		add(station2Button);
		add(station3Button);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.getPosition().x > scrollcamera.scroll.x + 520)
		{
			scrollcamera.scroll.x += elapsed * 60;
		}

		if (FlxG.mouse.getPosition().x < scrollcamera.scroll.x + 100)
		{
			scrollcamera.scroll.x += elapsed * -60;
		}
	}

	private function createStationButton(onClick:Void->Void, posx:Int = 0, posy:Int = 0, color:FlxColor = FlxColor.BLACK):FlxButton
	{
		var button = new FlxButton(0, 0, onClick);
		button.makeGraphic(50, 50, color);
		// button.width = button.label.width;
		// button.height = button.label.height;
		button.setPosition(posx, posy);
		button.scrollFactor.set(1);

		return button;
	}
}
