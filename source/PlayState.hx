package;

import flixel.FlxState;
import flixel.FlxSprite;

class PlayState extends FlxState {
  var hero = new FlxSprite();
  override public function create():Void {
    super.create();
    hero.loadGraphic(AssetPaths.archer__png, true, 32, 32, true);
    hero.animation.add("Idle", [0], 1, true);
    hero.setPosition(100, 100);
    hero.animation.play("Idle");
    this.add(hero);
  }

  override public function update(elapsed:Float):Void {
    super.update(elapsed);
  }
}
