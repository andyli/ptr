import haxe.unit.*;
import ptr.Ptr;
using ptr.Tools;

class TestBase extends TestCase {
	var aPtr:Ptr<Int>;

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

		var aPtr2 = aPtr.copy();

		aPtr[0] = 3;
		assertEquals(3, aPtr[0]);
		assertEquals(3, aPtr2[0]);

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

		#if ptr_no_out_of_bounds			
			assertTrue(try {
				aPtr - 1;
				false;
			} catch(e:Dynamic) true);

			assertTrue(try {
				aPtr + 3;
				false;
			} catch(e:Dynamic) true);
		#else			
			assertFalse(try {
				aPtr - 1;
				false;
			} catch(e:Dynamic) true);
			
			assertFalse(try {
				aPtr + 3;
				false;
			} catch(e:Dynamic) true);
		#end
	}

	function testPreOps():Void {
		assertEquals(2, aPtr[0]);
		assertEquals(4, (++aPtr)[0]);
		assertEquals(4, aPtr[0]);
		assertEquals(2, (--aPtr)[0]);
		assertEquals(2, aPtr[0]);

		#if ptr_no_out_of_bounds
			assertTrue(try {
				--aPtr;
				false;
			} catch(e:Dynamic) true);

			assertTrue(try {
				++(aPtr + 2);
				false;
			} catch(e:Dynamic) true);
		#else
			assertFalse(try {
				--aPtr;
				false;
			} catch(e:Dynamic) true);

			assertFalse(try {
				++(aPtr + 2);
				false;
			} catch(e:Dynamic) true);
		#end
	}

	function testPostOps():Void {
		assertEquals(2, aPtr[0]);
		assertEquals(2, (aPtr++)[0]);
		assertEquals(4, aPtr[0]);
		assertEquals(4, (aPtr--)[0]);
		assertEquals(2, aPtr[0]);

		#if ptr_no_out_of_bounds
			assertTrue(try {
				aPtr--;
				false;
			} catch(e:Dynamic) true);

			assertTrue(try {
				(aPtr + 2)++;
				false;
			} catch(e:Dynamic) true);
		#else
			assertFalse(try {
				aPtr--;
				false;
			} catch(e:Dynamic) true);

			assertFalse(try {
				(aPtr + 2)++;
				false;
			} catch(e:Dynamic) true);
		#end
	}

	function testCompare():Void {
		assertTrue(aPtr < aPtr + 1);
		assertTrue(aPtr <= aPtr + 1);
		assertTrue(aPtr + 1 > aPtr);
		assertTrue(aPtr + 1 >= aPtr);
		assertTrue(aPtr == aPtr.copy());
	}
}