package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
using flixel.util.FlxSpriteUtil;

class Arrow extends FlxSprite {
  public static inline var GRAVITY:Float = 600;
  public function new(x: Float, y: Float, powerX: Int, powerY: Int) {
    super(x, y);
    loadGraphic(AssetPaths.arrow__png);
    acceleration.y = GRAVITY;
    maxVelocity.set(500, GRAVITY);
    velocity.set(powerX, -powerY);
  }

  override public function update(elapsed:Float):Void {
    super.update(elapsed);

    if(!isOnScreen()) {
      kill();
    }
  }
}