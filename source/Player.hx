package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.util.FlxFSM;

class Player extends FlxSprite {
  public var fsm:FlxFSM<Player>;
  public function new() {
    super();
    this.loadGraphic(AssetPaths.archer__png, true, 32, 32, true);
    this.animation.add("Stand", [0], 1, true);
    this.animation.add("Move", [0, 1, 2, 3], 10, true);
    this.animation.add("Attack", [5, 6, 6, 6, 6, 6, 7, 7, 7], 10, false);
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
    } else if(this.animation.name=="Move" || this.animation.finished) {
      this.animation.play("Stand");
      }
    }
  }

class Stand extends FlxFSMState<Player> {
  override public function enter(owner:Player, fsm:FlxFSM<Player>):Void {
    owner.animation.play("Stand");
  }
}