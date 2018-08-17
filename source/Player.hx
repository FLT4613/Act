package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.util.FlxFSM;

class Player extends FlxSprite {
  public var fsm:FlxFSM<Player>;
  public function new() {
    super();
    fsm = new FlxFSM<Player>(this);
    setFacingFlip(FlxObject.LEFT, true, false);
    setFacingFlip(FlxObject.RIGHT, false, false);
    loadGraphic(AssetPaths.archer__png, true, 32, 32, true);
    animation.add("Stand", [0], 1, true);
    animation.add("Move", [0, 1, 2, 3], 10, true);
    animation.add("Attack", [5, 6, 7], 10, false);
    fsm.transitions
    .add(Stand, Attack, function(_)return FlxG.keys.pressed.SPACE)
    .add(Attack, Stand, function(owner)return owner.animation.finished)
    .start(Stand);
  }

  override public function update(elapsed:Float) {
    fsm.update(elapsed);
    super.update(elapsed);
  }
}

class Stand extends FlxFSMState<Player> {
  override public function enter(owner:Player, fsm:FlxFSM<Player>):Void {
    owner.animation.play("Stand");
  }

  override public function update(elapsed:Float, owner:Player, fsm:FlxFSM<Player>):Void {
    owner.acceleration.x = 0;

    if(FlxG.keys.pressed.LEFT || FlxG.keys.pressed.RIGHT) {
      owner.facing = FlxG.keys.pressed.LEFT ? FlxObject.LEFT : FlxObject.RIGHT;
      owner.animation.play("Move");
      owner.acceleration.x = FlxG.keys.pressed.LEFT ? -100 : 100;
    } else {
      owner.animation.play("Stand");
      owner.velocity.x *= 0.9;
    }
  }
}

class Attack extends FlxFSMState<Player> {
  override public function enter(owner:Player, fsm:FlxFSM<Player>):Void {
    owner.animation.play("Attack");
  }
  override public function update(elapsed:Float, owner:Player, fsm:FlxFSM<Player>):Void {
    owner.acceleration.x = 0;
    owner.velocity.x *= 0.9;
  }
  override public function exit(owner:Player):Void {
    PlayState.arrows.add(new Arrow(owner.x, owner.y, FlxG.random.int(10, 1000), FlxG.random.int(10, 1000)));
  }
}