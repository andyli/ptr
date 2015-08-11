import haxe.io.Bytes;
import haxe.unit.*;
import ptr.Ptr;
using ptr.Tools;

class TestBytes extends TestBase<Int> {
	var a:Bytes;
	override function get(i:Int)
		return a.get(i);
	override function len()
		return a.length;

	override function setup():Void {
		super.setup();

		a = Bytes.alloc(3);
		a.set(0, 2);
		a.set(1, 4);
		a.set(2, 6);

		aPtr = a.ptr();
	}
}