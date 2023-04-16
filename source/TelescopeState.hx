package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class TelescopeState extends FlxState
{
	var starrysky:FlxSprite;
	var starlayer:FlxSprite;
	var crosshair:FlxSprite;
	var telecamera:FlxCamera;
	var quitbutton:FlxButton;
	var redPlanet:FlxSprite;
	var yellowPlanet:FlxSprite;
	var crosshairPoint:FlxObject;
	var coordText:FlxText;

	override public function create()
	{
		starrysky = new FlxSprite();
		starrysky.loadGraphic(AssetPaths.starrysky__png);
		starlayer = new FlxSprite(-70, -70);
		starlayer.loadGraphic(AssetPaths.halfstarlayer__png);
		starlayer.scrollFactor.set(0.9, 0.9);
		crosshair = new FlxSprite();
		crosshair.loadGraphic(AssetPaths.crosshair__png);
		crosshair.scrollFactor.set(0);
		redPlanet = new FlxSprite(700, 300);
		redPlanet.loadGraphic(AssetPaths.redplanet__png);
		yellowPlanet = new FlxSprite(400, 500);
		yellowPlanet.loadGraphic(AssetPaths.yellowplanet__png);
		crosshairPoint = new FlxObject(320, 240);
		crosshairPoint.scrollFactor.set(0);
		coordText = new FlxText(500, 240, 125, "X Coordinate: \nY Coordinate: ", 10);
		coordText.scrollFactor.set(0);

		quitbutton = createQuitButton("back", () ->
		{
			// close();
			FlxG.switchState(new PlayState());
		}, 10, 10, FlxColor.LIME);

		telecamera = new FlxCamera(0, 0, 640, 480);
		telecamera.bgColor = FlxColor.TRANSPARENT;
		telecamera.setScrollBoundsRect(0, 0, 2000, 2000);
		FlxG.cameras.reset(telecamera);

		add(starrysky);
		add(redPlanet);
		add(yellowPlanet);
		add(starlayer);
		add(crosshair);
		add(quitbutton);
		add(coordText);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		scrollSky(elapsed);
		showCoords();
	}

	private function createQuitButton(labelText:String, onClick:Void->Void, posx:Int = 0, posy:Int = 0, color:FlxColor = FlxColor.BLACK):FlxButton
	{
		var button = new FlxButton(posx, posy, labelText, onClick);
		button.makeGraphic(40, 20, color);
		button.label.size = 10;
		button.scrollFactor.set(0);

		return button;
	}

	private function scrollSky(elapsed:Float)
	{
		if (FlxG.mouse.getPosition().x > telecamera.scroll.x + 395)
		{
			telecamera.scroll.x += elapsed * 60;
		}

		if (FlxG.mouse.getPosition().x < telecamera.scroll.x + 245)
		{
			telecamera.scroll.x += elapsed * -60;
		}

		if (FlxG.mouse.getPosition().y > telecamera.scroll.y + 150)
		{
			telecamera.scroll.y += elapsed * 60;
		}

		if (FlxG.mouse.getPosition().y < telecamera.scroll.y + 330)
		{
			telecamera.scroll.y += elapsed * -60;
		}
	}

	private function showCoords()
	{
		var xcoord = crosshairPoint.getPosition().x + telecamera.scroll.x;
		var ycoord = crosshairPoint.getPosition().y + telecamera.scroll.y;
		coordText.text = "X Coordinate:" + xcoord + "\nY Coordinate:" + ycoord;
	}
}
