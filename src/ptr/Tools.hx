package ptr;

#if macro
import haxe.macro.*;
import haxe.macro.Expr;
#end

class ObjPtrTools {
	macro static public function objPtr<T>(o:ExprOf<T>):ExprOf<Ptr<T>> {
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

class NativeArrayPtrTools {
	inline static public function ptr<T>(a:NativeArrayPtr.NativeArray<T>, i:Int = 0):Ptr<T>
		return new NativeArrayPtr(a, i);
}

class ArrayPtrTools {
	inline static public function ptr<T>(a:Array<T>, i:Int = 0):Ptr<T>
		return new ArrayPtr(a, i);
}

class VectorPtrTools {
	inline static public function ptr<T>(a:haxe.ds.Vector<T>, i:Int = 0):Ptr<T>
		return new VectorPtr(a, i);
}

class BytesPtrTools {
	inline static public function ptr(a:haxe.io.Bytes, i:Int = 0):Ptr<Int>
		return new BytesPtr(a, i);
}
