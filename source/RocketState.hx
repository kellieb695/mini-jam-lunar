package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.text.FlxTypeText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class RocketState extends FlxState
{
	var countdownTimer:FlxTypeText;
	var rocket:FlxSprite;

	override public function create()
	{
		super.create();
		rocket = new FlxSprite(300, 400);
		rocket.loadGraphic(AssetPaths.rocketspritesheet__png);
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
	}

	private function animateRocket()
	{
		rocket.y -= 5;
	}
}
