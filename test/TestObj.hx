import haxe.unit.*;
import ptr.Ptr;
using ptr.Tools;

class TestObj extends TestCase {
	var a:Int;
	var aPtr:Ptr<Int>;

	static var staticVar:Int = 9;
	function getA():Int {
		return a;
	}

	override function setup():Void {
		super.setup();

		a = 123;

		aPtr = a.objPtr();
	}

	function testInstanceVar():Void {
		var p = a.objPtr();
		assertEquals(a, p[0]);

		var p = this.a.objPtr();
		assertEquals(a, p[0]);
	}

	function testStaticVar():Void {
		var p = staticVar.objPtr();
		assertEquals(staticVar, p[0]);

		var p = TestObj.staticVar.objPtr();
		assertEquals(staticVar, p[0]);
	}

	function testArray():Void {
		var array = [123];
		var p = array.objPtr();
		assertEquals(123, p[0][0]);

		array[0] = 1;
		assertEquals(1, p[0][0]);

		p[0][0] = 2;
		assertEquals(2, array[0]);

		p[0] = [456];
		assertEquals(456, array[0]);
	}

	// should not compile
	// function testFunction():Void {
	// 	var p = getA().objPtr();
	// }

	function testGet():Void {
		assertEquals(123, aPtr[0]);

		assertTrue(try {
			aPtr[-1];
			false;
		} catch(e:Dynamic) true);

		assertTrue(try {
			aPtr[1];
			false;
		} catch(e:Dynamic) true);

		a = 456;
		assertEquals(456, aPtr[0]);
	}

	function testSet():Void {
		assertEquals(123, aPtr[0]);

		aPtr[0] = 3;
		assertEquals(3, aPtr[0]);
		assertEquals(3, a);

		assertTrue(try {
			aPtr[-1] = 0;
			false;
		} catch(e:Dynamic) true);

		assertTrue(try {
			aPtr[3] = 0;
			false;
		} catch(e:Dynamic) true);
	}
}