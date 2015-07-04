import haxe.io.Bytes;
import haxe.unit.*;
import ptr.Ptr;
using ptr.Tools;

class TestBytes extends TestCase {
	var a:Bytes;
	var aPtr:Ptr<Int>;

	override function setup():Void {
		super.setup();

		a = Bytes.alloc(3);
		a.set(0, 2);
		a.set(1, 4);
		a.set(2, 6);

		aPtr = a.ptr();
	}

	function testGet():Void {
		assertEquals(2, aPtr[0]);
		assertEquals(4, aPtr[1]);
		assertEquals(6, aPtr[2]);

		assertTrue(try {
			aPtr[-1];
			false;
		} catch(e:Dynamic) true);

		assertTrue(try {
			aPtr[3];
			false;
		} catch(e:Dynamic) true);
	}

	function testSet():Void {
		assertEquals(2, aPtr[0]);

		aPtr[0] = 3;
		assertEquals(3, aPtr[0]);
		assertEquals(3, a.get(0));

		assertTrue(try {
			aPtr[-1] = 0;
			false;
		} catch(e:Dynamic) true);

		assertTrue(try {
			aPtr[3] = 0;
			false;
		} catch(e:Dynamic) true);
	}

	function testAdd():Void {
		assertEquals(2, aPtr[0]);

		var aPtrAdd2 = aPtr + 2;
		assertEquals(6, aPtrAdd2[0]);
		assertEquals(2, aPtr[0]);

		var aPtrAdd2Sub1 = aPtrAdd2 - 1;
		assertEquals(4, aPtrAdd2Sub1[0]);
		assertEquals(2, aPtr[0]);
	}

	function testPreOps():Void {
		assertEquals(2, aPtr[0]);
		assertEquals(4, (++aPtr)[0]);
		assertEquals(4, aPtr[0]);
		assertEquals(2, (--aPtr)[0]);
		assertEquals(2, aPtr[0]);
	}

	function testPostOps():Void {
		assertEquals(2, aPtr[0]);
		assertEquals(2, (aPtr++)[0]);
		assertEquals(4, aPtr[0]);
		assertEquals(4, (aPtr--)[0]);
		assertEquals(2, aPtr[0]);
	}
}