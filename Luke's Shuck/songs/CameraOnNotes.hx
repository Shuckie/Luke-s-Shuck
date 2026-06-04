import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

public var camMovement:Bool = true;
var currentTween:FlxTween = null;
var lastAngleTarget:Float = 0;

function postCreate() {
    var song = PlayState.SONG.meta.name;
    if (song == 'Irida' || song == 'Shucks-Old' || song == 'Shucks-Vibre' || song == 'Execretion')
        camMovement = false;
        }

function postUpdate() {
    if (camMovement) {
        if (curCameraTarget < 0 || curCameraTarget >= strumLines.members.length) return;
        
        var strum = strumLines.members[curCameraTarget];
        if (strum == null || strum.characters == null || strum.characters.length == 0 || strum.characters[0] == null) return;

        var angleTarget:Float = lastAngleTarget;
        switch (strum.characters[0].getAnimName()) {
            case "singLEFT":
                angleTarget = -1.5;
            case "singDOWN":
                camFollow.y += 15;
                angleTarget = 0;
            case "singUP":
                camFollow.y -= 15;
                angleTarget = 0;
            case "singRIGHT":
                angleTarget = 1.5;
            default:
                angleTarget = 0;
        }

        if (angleTarget != lastAngleTarget) {
            if (currentTween != null) currentTween.cancel();
            var tweenTime:Float = (angleTarget == 0 ? 1.9 : 1.6);
            currentTween = FlxTween.tween(camGame, {angle: angleTarget}, tweenTime, {ease: FlxEase.sineOut});
            lastAngleTarget = angleTarget;
        }
    }
}
