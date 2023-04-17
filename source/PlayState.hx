package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var background:FlxSprite;

	public var station1:FlxSprite;

	var scrollcamera:FlxCamera;

	var station1State:FlxSubState;

	var hasKey:Bool = false;
	var keySprite:FlxSprite;
	var telescopeSprite:FlxSprite;
	var caveSprite:FlxSprite;
	var compSprite:FlxSprite;

	// public function new(haskey:Bool)
	// {
	// 	super();
	// 	hasKey = haskey;
	// }

	override public function create()
	{
		background = new FlxSprite();
		background.loadGraphic(AssetPaths.panmoonblue__png);

		// station1State = new Station1State();

		scrollcamera = new FlxCamera(0, 0, 640, 480);
		scrollcamera.bgColor = FlxColor.TRANSPARENT;
		scrollcamera.setScrollBoundsRect(0, 0, 1240, 480);
		FlxG.cameras.reset(scrollcamera);

		keySprite = new FlxSprite(1200, 420);
		keySprite.loadGraphic(AssetPaths.key__png);
		telescopeSprite = new FlxSprite(-100, -100);
		telescopeSprite.loadGraphic(AssetPaths.telescope__png);
		caveSprite = new FlxSprite(-100, -100);
		caveSprite.loadGraphic(AssetPaths.cave__png);
		compSprite = new FlxSprite(-100, -100);
		compSprite.loadGraphic(AssetPaths.thecomputer__png);

		var telescopeButton = createStationButton(() ->
		{
			FlxG.switchState(new TelescopeState());
		}, 1000, 280, telescopeSprite);

		var caveButton = createStationButton(() ->
		{
			FlxG.switchState(new MazeState(hasKey));
		}, 150, 270, caveSprite);

		var computerButton = createStationButton(() ->
		{
			FlxG.switchState(new ComputerState());
		}, 700, 300, compSprite);

		add(background);
		add(telescopeButton);
		add(caveButton);
		add(computerButton);
		add(keySprite);
		if (hasKey)
		{
			keySprite.kill();
		}
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		scrollFunction(elapsed);
		getKey();
	}

	private function createStationButton(onClick:Void->Void, posx:Int = 0, posy:Int = 0, spriteImage:FlxSprite):FlxButtonPlus
	{
		var button = new FlxButtonPlus(0, 0, onClick, null, Std.int(spriteImage.height), Std.int(spriteImage.width));
		button.loadButtonGraphic(spriteImage, spriteImage);
		button.setPosition(posx, posy);
		button.scrollFactor.set(1);

		return button;
	}

	private function scrollFunction(elapsed:Float)
	{
		if (FlxG.mouse.getPosition().x > scrollcamera.scroll.x + 520)
		{
			scrollcamera.scroll.x += elapsed * 150;
		}

		if (FlxG.mouse.getPosition().x < scrollcamera.scroll.x + 100)
		{
			scrollcamera.scroll.x += elapsed * -150;
		}
	}

	private function getKey()
	{
		if ((FlxG.mouse.justPressed && FlxG.mouse.overlaps(keySprite)))
		{
			keySprite.kill();
			hasKey = true;
		}
	}
}
