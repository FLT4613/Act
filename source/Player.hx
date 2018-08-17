package;

import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite {
  public function new() {
    super();
    this.loadGraphic(AssetPaths.archer__png, true, 32, 32, true);
    this.animation.add("Idle", [0], 1, true);
    this.animation.add("Move", [0, 1, 2, 3], 10, true);
    this.animation.add("Attack", [5, 6, 6, 6, 6, 6, 7, 7, 7], 10, false);
    this.animation.play("Idle");
  }

  override public function update(elapsed:Float) {
    super.update(elapsed);

    if(FlxG.keys.pressed.RIGHT) {
      this.x += 1;
      this.animation.play("Move");
    } else if(FlxG.keys.pressed.LEFT) {
      this.x -= 1;
      this.animation.play("Move");
    } else if(FlxG.keys.justPressed.SPACE) {
      this.animation.play("Attack");
    } else {
      if(this.animation.name=="Move" || this.animation.finished) {
        this.animation.play("Idle");
      }
    }
  }

}