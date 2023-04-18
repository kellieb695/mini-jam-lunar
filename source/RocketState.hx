package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.text.FlxTypeText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class RocketState extends FlxState
{
	var countdownTimer:FlxTypeText;
	var rocket:FlxSprite;
	var winText:FlxText;

	override public function create()
	{
		super.create();
		rocket = new FlxSprite(400, 450);
		rocket.loadGraphic(AssetPaths.rocket__png);
		winText = new FlxText(340, 295, 300, "You win! \nPress R to restart", 20);
		countdownTimer = new FlxTypeText(150, 20, 640, "9...\n8...\n7...\n6...\n5...\n4...\n3...\n2...\n1...", 35);
		countdownTimer.prefix = "10...\n";
		countdownTimer.delay = 0.1;
		add(countdownTimer);
		countdownTimer.start();
		countdownTimer.completeCallback = () ->
		{
			add(rocket);
		};
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (rocket.isOnScreen())
		{
			animateRocket(elapsed);
		}
		if (rocket.y < 200)
		{
			add(winText);
		}
		if (FlxG.keys.justReleased.R)
		{
			FlxG.switchState(new PlayState());
		}
	}

	private function animateRocket(elapsed:Float)
	{
		rocket.y -= elapsed * 40;
	}
}
