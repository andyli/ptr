import haxe.io.Bytes;
import haxe.unit.*;
import ptr.Ptr;
using ptr.Tools;

class TestBytes extends TestBase {
	var a:Bytes;

	override function setup():Void {
		super.setup();

		a = Bytes.alloc(3);
		a.set(0, 2);
		a.set(1, 4);
		a.set(2, 6);

		aPtr = a.ptr();
	}
}