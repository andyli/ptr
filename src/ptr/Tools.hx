package ptr;

class ObjPtrTools {
	inline static public function ptr<T>(o:T):Ptr<T>
		return new ObjPtr(o);
}

class NativeArrayPtrTools {
	inline static public function ptr<T>(a:NativeArrayPtr.NativeArray<T>):Ptr<T>
		return new NativeArrayPtr(a, 0);
}

class ArrayPtrTools {
	inline static public function ptr<T>(a:Array<T>):Ptr<T>
		return new ArrayPtr(a, 0);
}

class VectorPtrTools {
	inline static public function ptr<T>(a:haxe.ds.Vector<T>):Ptr<T>
		return new VectorPtr(a, 0);
}

class BytesPtrTools {
	inline static public function ptr(a:haxe.io.Bytes):Ptr<Int>
		return new BytesPtr(a, 0);
}
