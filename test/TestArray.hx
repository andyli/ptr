import haxe.unit.*;
import ptr.Ptr;
using ptr.Tools;

class TestArray extends TestBase<Int> {
	var a:Array<Int>;
	override function get(i:Int)
		return a[i];
	override function len()
		return a.length;

	override function setup():Void {
		super.setup();

		a = [2, 4, 6];
		aPtr = a.ptr();
	}
}