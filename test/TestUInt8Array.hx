import haxe.io.*;
import haxe.unit.*;
import ptr.Ptr;
using ptr.Tools;

class TestUInt8Array extends TestBase<Int> {
	var a:UInt8Array;
	override function get(i:Int)
		return a[i];
	override function len()
		return a.length;

	override function setup():Void {
		super.setup();

		a = new UInt8Array(3);
		a[0] = 2;
		a[1] = 4;
		a[2] = 6;
		aPtr = a.ptr();
	}
}