import haxe.unit.*;
import ptr.Ptr;
using ptr.Tools;

class TestArray extends TestBase {
	var a:Array<Int>;

	override function setup():Void {
		super.setup();

		a = [2, 4, 6];
		aPtr = a.ptr();
	}
}