package ptr;

import haxe.io.*;
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
	inline static public function ptr(a:Bytes, i:Int = 0):Ptr<Int>
		return new BytesPtr(a, i);
	inline static public function constPtr(a:Bytes, i:Int = 0):ConstPtr<Int>
		return new BytesPtr(a, i);
}

class UInt8ArrayPtrTools {
	inline static public function ptr(a:UInt8Array, i:Int = 0):Ptr<Int>
		return new UInt8ArrayPtr(a, i);
	inline static public function constPtr(a:UInt8Array, i:Int = 0):ConstPtr<Int>
		return new UInt8ArrayPtr(a, i);
	inline static public function ptrUInt8(a:Bytes, i:Int = 0):Ptr<Int>
		return new UInt8ArrayPtr(UInt8Array.fromBytes(a), i);
	inline static public function constPtrUInt8(a:Bytes, i:Int = 0):ConstPtr<Int>
		return new UInt8ArrayPtr(UInt8Array.fromBytes(a), i);
}

class UInt16ArrayPtrTools {
	inline static public function ptr(a:UInt16Array, i:Int = 0):Ptr<Int>
		return new UInt16ArrayPtr(a, i);
	inline static public function constPtr(a:UInt16Array, i:Int = 0):ConstPtr<Int>
		return new UInt16ArrayPtr(a, i);
	inline static public function ptrUInt16(a:Bytes, i:Int = 0):Ptr<Int>
		return new UInt16ArrayPtr(UInt16Array.fromBytes(a), i);
	inline static public function constPtrUInt16(a:Bytes, i:Int = 0):ConstPtr<Int>
		return new UInt16ArrayPtr(UInt16Array.fromBytes(a), i);
}

class UInt32ArrayPtrTools {
	inline static public function ptr(a:UInt32Array, i:Int = 0):Ptr<UInt>
		return new UInt32ArrayPtr(a, i);
	inline static public function constPtr(a:UInt32Array, i:Int = 0):ConstPtr<UInt>
		return new UInt32ArrayPtr(a, i);
	inline static public function ptrUInt32(a:Bytes, i:Int = 0):Ptr<UInt>
		return new UInt32ArrayPtr(UInt32Array.fromBytes(a), i);
	inline static public function constPtrUInt32(a:Bytes, i:Int = 0):ConstPtr<UInt>
		return new UInt32ArrayPtr(UInt32Array.fromBytes(a), i);
}

class Int32ArrayPtrTools {
	inline static public function ptr(a:Int32Array, i:Int = 0):Ptr<Int>
		return new Int32ArrayPtr(a, i);
	inline static public function constPtr(a:Int32Array, i:Int = 0):ConstPtr<Int>
		return new Int32ArrayPtr(a, i);
	inline static public function ptrInt32(a:Bytes, i:Int = 0):Ptr<Int>
		return new Int32ArrayPtr(Int32Array.fromBytes(a), i);
	inline static public function constPtrInt32(a:Bytes, i:Int = 0):ConstPtr<Int>
		return new Int32ArrayPtr(Int32Array.fromBytes(a), i);
}

class Float32ArrayPtrTools {
	inline static public function ptr(a:Float32Array, i:Int = 0):Ptr<Float>
		return new Float32ArrayPtr(a, i);
	inline static public function constPtr(a:Float32Array, i:Int = 0):ConstPtr<Float>
		return new Float32ArrayPtr(a, i);
	inline static public function ptrFloat32(a:Bytes, i:Int = 0):Ptr<Float>
		return new Float32ArrayPtr(Float32Array.fromBytes(a), i);
	inline static public function constPtrFloat32(a:Bytes, i:Int = 0):ConstPtr<Float>
		return new Float32ArrayPtr(Float32Array.fromBytes(a), i);
}

class Float64ArrayPtrTools {
	inline static public function ptr(a:Float64Array, i:Int = 0):Ptr<Float>
		return new Float64ArrayPtr(a, i);
	inline static public function constPtr(a:Float64Array, i:Int = 0):ConstPtr<Float>
		return new Float64ArrayPtr(a, i);
	inline static public function ptrFloat64(a:Bytes, i:Int = 0):Ptr<Float>
		return new Float64ArrayPtr(Float64Array.fromBytes(a), i);
	inline static public function constPtrFloat64(a:Bytes, i:Int = 0):ConstPtr<Float>
		return new Float64ArrayPtr(Float64Array.fromBytes(a), i);
}