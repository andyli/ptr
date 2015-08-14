import haxe.unit.*;
import ptr.Ptr;
using ptr.Tools;

class TestBase<T> extends TestCase {
	var aPtr:Ptr<T>;
	function get(i:Int):T {
		return throw "should be overridden";
	}
	function len():Int {
		return throw "should be overridden";
	}

	function testGet():Void {
		for (i in 0...len())
			assertEquals(get(i), aPtr[i]);

		assertTrue(try {
			aPtr[-1];
			false;
		} catch(e:Dynamic) true);

		assertTrue(try {
			aPtr[len()];
			false;
		} catch(e:Dynamic) true);

		assertEquals(get(0), (aPtr+1)[-1]);
	}

	function testSet():Void {
		var aPtr2 = aPtr.copy();

		aPtr[0] = get(1);
		assertEquals(get(1), aPtr[0]);
		assertEquals(get(1), aPtr2[0]);

		assertTrue(try {
			aPtr[-1] = get(0);
			false;
		} catch(e:Dynamic) true);

		assertTrue(try {
			aPtr[len()] = get(0);
			false;
		} catch(e:Dynamic) true);
	}

	function testAdd():Void {
		var aPtrAdd2 = aPtr + 2;
		assertEquals(get(2), aPtrAdd2[0]);
		assertEquals(get(0), aPtr[0]);

		var aPtrAdd2Sub1 = aPtrAdd2 - 1;
		assertEquals(get(1), aPtrAdd2Sub1[0]);
		assertEquals(get(0), aPtr[0]);

		#if ptr_no_out_of_bounds			
			assertTrue(try {
				aPtr - 1;
				false;
			} catch(e:Dynamic) true);

			assertTrue(try {
				aPtr + len();
				false;
			} catch(e:Dynamic) true);
		#else			
			assertFalse(try {
				aPtr - 1;
				false;
			} catch(e:Dynamic) true);
			
			assertFalse(try {
				aPtr + len();
				false;
			} catch(e:Dynamic) true);
		#end
	}

	function testPreOps():Void {
		assertEquals(get(0), aPtr[0]);
		assertEquals(get(1), (++aPtr)[0]);
		assertEquals(get(1), aPtr[0]);
		assertEquals(get(0), (--aPtr)[0]);
		assertEquals(get(0), aPtr[0]);

		#if ptr_no_out_of_bounds
			assertTrue(try {
				--aPtr;
				false;
			} catch(e:Dynamic) true);

			assertTrue(try {
				++(aPtr + (len()-1));
				false;
			} catch(e:Dynamic) true);
		#else
			assertFalse(try {
				--aPtr;
				false;
			} catch(e:Dynamic) true);

			assertFalse(try {
				++(aPtr + (len()-1));
				false;
			} catch(e:Dynamic) true);
		#end
	}

	function testPostOps():Void {
		assertEquals(get(0), aPtr[0]);
		assertEquals(get(0), (aPtr++)[0]);
		assertEquals(get(1), aPtr[0]);
		assertEquals(get(1), (aPtr--)[0]);
		assertEquals(get(0), aPtr[0]);

		#if ptr_no_out_of_bounds
			assertTrue(try {
				aPtr--;
				false;
			} catch(e:Dynamic) true);

			assertTrue(try {
				(aPtr + (len()-1))++;
				false;
			} catch(e:Dynamic) true);
		#else
			assertFalse(try {
				aPtr--;
				false;
			} catch(e:Dynamic) true);

			assertFalse(try {
				(aPtr + (len()-1))++;
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
		assertTrue(aPtr <= aPtr.copy());
		assertTrue(aPtr >= aPtr.copy());
	}

	function testSubPtr():Void {
		assertEquals(1, aPtr + 1 - aPtr);
	}
}