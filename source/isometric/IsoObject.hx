package isometric;

import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import flixel.FlxBasic;

class IsoObject extends FlxSprite {
	public var world:IsoWorld;

	private var sprOffset:FlxPoint = FlxPoint.get();
	private var iso:FlxPoint = FlxPoint.get();

	public var isoX(get, set):Float;

	public function set_isoX(newX:Float) {
		x = world.isometricToCartesian(newX, isoY).x + sprOffset.x;
		return iso.x = newX;
	}

	public function get_isoX():Float {
		return iso.x;
	}

	public var isoY(get, set):Float;

	public function set_isoY(newY:Float) {
		y = world.isometricToCartesian(isoX, newY).y + sprOffset.y;
		return iso.y = newY;
	}

	public function get_isoY():Float {
		return iso.y;
	}

	public function setIsoPosition(newX:Float, newY:Float) {
		var p = world.isometricToCartesian(newX, newY).add(sprOffset.x, sprOffset.y);
		setPosition(p.x, p.y);
		iso.x = newX;
		iso.y = newY;
	}

	public function new(world:IsoWorld, isoX:Float = 0.0, isoY:Float = 0.0, offsetX:Float = 0.0, offsetY:Float = 0.0,
			?image:flixel.system.FlxAssets.FlxGraphicAsset, ?debugColor:FlxColor) {
		super(0, 0, image);
		if (world == null) {
			throw "world must not be null";
		}
		this.world = world;
		world.add(this);
		sprOffset.set(offsetX, offsetY);
		setIsoPosition(isoX, isoY);
	}
}