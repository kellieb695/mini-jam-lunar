package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import telescope.MoonHero;

class PlayState extends FlxState
{
	private var background:FlxSprite;

	public var station1:FlxSprite;

	var scrollcamera:FlxCamera;

	var station1State:FlxSubState;

	var hasKey:Bool = false;
	var keyButton:FlxButtonPlus;
	var keySprite:FlxSprite;

	override public function create()
	{
		background = new FlxSprite();
		background.loadGraphic(AssetPaths.panmoon__png);

		// station1State = new Station1State();

		scrollcamera = new FlxCamera(0, 0, 640, 480);
		scrollcamera.bgColor = FlxColor.TRANSPARENT;
		scrollcamera.setScrollBoundsRect(0, 0, 2560, 480);
		FlxG.cameras.reset(scrollcamera);

		keySprite = new FlxSprite(-20, -20);
		keySprite.loadGraphic(AssetPaths.key__png);

		var station1Button = createStationButton(() ->
		{
			// openSubState(station1State);
			FlxG.switchState(new TelescopeState());
		}, 200, 400, FlxColor.PINK);

		var station2Button = createStationButton(() ->
		{
			FlxG.switchState(new MazeState());
		}, 300, 400, FlxColor.BLUE);

		var station3Button = createStationButton(() ->
		{
			FlxG.switchState(new RocketState());
		}, 400, 400, FlxColor.GREEN);
		var keyButton = createKeyButton(() ->
		{
			hasKey = true;
			trace("got key");
			getKey();
		}, 70, 370);

		add(background);
		add(station1Button);
		add(station2Button);
		add(station3Button);
		add(keySprite);
		add(keyButton);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.getPosition().x > scrollcamera.scroll.x + 520)
		{
			scrollcamera.scroll.x += elapsed * 90;
		}

		if (FlxG.mouse.getPosition().x < scrollcamera.scroll.x + 100)
		{
			scrollcamera.scroll.x += elapsed * -90;
		}
	}

	private function createStationButton(onClick:Void->Void, posx:Int = 0, posy:Int = 0, color:FlxColor = FlxColor.BLACK):FlxButton
	{
		var button = new FlxButton(0, 0, onClick);
		button.makeGraphic(50, 50, color);
		button.setPosition(posx, posy);
		button.scrollFactor.set(1);

		return button;
	}

	private function createKeyButton(onClick:Void->Void, posx:Int = 0, posy:Int = 0):FlxButtonPlus
	{
		var button = new FlxButtonPlus(0, 0, onClick);
		button.loadButtonGraphic(keySprite, keySprite);
		button.setPosition(posx, posy);
		button.scrollFactor.set(1);

		return button;
	}

	private function getKey()
	{
		keyButton.kill();
	}
}
