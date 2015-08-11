package ptr;

#if macro
import haxe.macro.*;
import haxe.macro.Expr;
#end

#if false // not sure if its design and its implementation are good...
class ObjPtrTools {
	macro static public function objPtr<T>(o:ExprOf<T>):ExprOf<Ptr<T>> {
		// var te = Context.typeExpr(o);
		// trace(TypedExprTools.toString(te));
		// var e = Context.getTypedExpr(te);
		// trace(ExprTools.toString(e), o.pos);
		var e = try {
			Context.typeExpr(
				macro ptr.Ptr.fromIPtr(new ptr.ObjPtr(
					function() return $o,
					function(__v) return $o = __v
				))
			);
		} catch (e:Dynamic) {
			Context.error("Only pointer to writable variable is supported. Hint: Store it to a local variable first?", o.pos);
		}
		return Context.storeTypedExpr(e);
	}
}
#end

class NativeArrayPtrTools {
	inline static public function ptr<T>(a:NativeArrayPtr.NativeArray<T>, i:Int = 0):Ptr<T>
		return new NativeArrayPtr(a, i);
	inline static public function constPtr<T>(a:NativeArrayPtr.NativeArray<T>, i:Int = 0):ConstPtr<T>
		return new NativeArrayPtr(a, i);
}

class ArrayPtrTools {
	inline static public function ptr<T>(a:Array<T>, i:Int = 0):Ptr<T>
		return new ArrayPtr(a, i);
	inline static public function constPtr<T>(a:Array<T>, i:Int = 0):ConstPtr<T>
		return new ArrayPtr(a, i);
}

class VectorPtrTools {
	inline static public function ptr<T>(a:haxe.ds.Vector<T>, i:Int = 0):Ptr<T>
		return new VectorPtr(a, i);
	inline static public function constPtr<T>(a:haxe.ds.Vector<T>, i:Int = 0):ConstPtr<T>
		return new VectorPtr(a, i);
}

class BytesPtrTools {
	inline static public function ptr(a:haxe.io.Bytes, i:Int = 0):Ptr<Int>
		return new BytesPtr(a, i);
	inline static public function constPtr(a:haxe.io.Bytes, i:Int = 0):ConstPtr<Int>
		return new BytesPtr(a, i);
}

class UInt8ArrayPtrTools {
	inline static public function ptr(a:haxe.io.UInt8Array, i:Int = 0):Ptr<Int>
		return new UInt8ArrayPtr(a, i);
	inline static public function constPtr(a:haxe.io.UInt8Array, i:Int = 0):ConstPtr<Int>
		return new UInt8ArrayPtr(a, i);
}

class UInt16ArrayPtrTools {
	inline static public function ptr(a:haxe.io.UInt16Array, i:Int = 0):Ptr<Int>
		return new UInt16ArrayPtr(a, i);
	inline static public function constPtr(a:haxe.io.UInt16Array, i:Int = 0):ConstPtr<Int>
		return new UInt16ArrayPtr(a, i);
}

class UInt32ArrayPtrTools {
	inline static public function ptr(a:haxe.io.UInt32Array, i:Int = 0):Ptr<UInt>
		return new UInt32ArrayPtr(a, i);
	inline static public function constPtr(a:haxe.io.UInt32Array, i:Int = 0):ConstPtr<UInt>
		return new UInt32ArrayPtr(a, i);
}

class Int32ArrayPtrTools {
	inline static public function ptr(a:haxe.io.Int32Array, i:Int = 0):Ptr<Int>
		return new Int32ArrayPtr(a, i);
	inline static public function constPtr(a:haxe.io.Int32Array, i:Int = 0):ConstPtr<Int>
		return new Int32ArrayPtr(a, i);
}

class Float32ArrayPtrTools {
	inline static public function ptr(a:haxe.io.Float32Array, i:Int = 0):Ptr<Float>
		return new Float32ArrayPtr(a, i);
	inline static public function constPtr(a:haxe.io.Float32Array, i:Int = 0):ConstPtr<Float>
		return new Float32ArrayPtr(a, i);
}

class Float64ArrayPtrTools {
	inline static public function ptr(a:haxe.io.Float64Array, i:Int = 0):Ptr<Float>
		return new Float64ArrayPtr(a, i);
	inline static public function constPtr(a:haxe.io.Float64Array, i:Int = 0):ConstPtr<Float>
		return new Float64ArrayPtr(a, i);
}