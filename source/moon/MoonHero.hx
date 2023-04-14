package moon;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class MoonHero extends FlxSprite
{
	var hero_width:Int = 30;
	var hero_height:Int = 30;

	var min_speed:Int = -75;
	var max_speed:Int = 75;

	public function new(x:Int = 0, y:Int = 0, bodyGraphic:FlxGraphicAsset = AssetPaths.moonspritesheet__png)
	{
		super(x, y);
		initSelf(bodyGraphic);
		this.velocity.x = FlxG.random.float(min_speed, max_speed);
		this.velocity.y = FlxG.random.float(min_speed, max_speed);
	}

	private function initSelf(staticGraphic:FlxGraphicAsset)
	{
		loadGraphic(staticGraphic, true, 96, 96);
		var hitboxAdjustment = width * 0.35;
		width -= hitboxAdjustment;
		height -= hitboxAdjustment;
		offset.add(hitboxAdjustment / 2, hitboxAdjustment / 2);
	}

	private function screenWrap()
	{
		if (this.velocity.x > 0 && this.x >= FlxG.width)
		{
			this.x = -(this.width);
		}
		else if (this.velocity.x < 0 && (this.x + this.width) <= 0)
		{
			this.x = FlxG.width;
		}

		if (this.velocity.y > 0 && this.y >= FlxG.height)
		{
			this.y = 0;
		}
		else if (this.velocity.y < 0 && (this.y + this.height) <= 0)
		{
			this.y = FlxG.height;
		}
	}

	private function invertDirection()
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			this.velocity.x *= -1;
			this.velocity.y *= -1;
		}
	}

	override public function update(elapsed:Float)
	{
		screenWrap();
		invertDirection();

		super.update(elapsed);
	}
}
