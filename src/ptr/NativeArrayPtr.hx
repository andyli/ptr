package ptr;

typedef NativeArray<T> =
#if java
	java.NativeArray<T>;
#elseif cs
	cs.NativeArray<T>;
#else
	Array<T>;
#end

class NativeArrayPtr<T> implements IPtr<T> {
	var a:NativeArray<T>;
	var base_i:Int;
	public function new(a:NativeArray<T>, i:Int):Void {
		this.a = a;
		this.base_i = i;
	}
	public function get(i:Int):T {
		return if (i >= 0 && i < a.length)
			a[base_i + i];
		else
			throw "out of bound access";
	}
	public function set(i:Int, v:T):T {
		return if (i >= 0 && i < a.length)
			a[base_i + i] = v;
		else
			throw "out of bound access";
	}
	public function add(i:Int):NativeArrayPtr<T> {
		return new NativeArrayPtr<T>(a, base_i + i);
	}
	public function sub(i:Int):NativeArrayPtr<T> {
		return new NativeArrayPtr<T>(a, base_i - i);
	}
	public function preInc():NativeArrayPtr<T> {
		base_i++;
		return this;
	}
	public function postInc():NativeArrayPtr<T> {
		var cur = copy();
		base_i++;
		return cur;
	}
	public function preDec():NativeArrayPtr<T> {
		base_i--;
		return this;
	}
	public function postDec():NativeArrayPtr<T> {
		var cur = copy();
		base_i--;
		return cur;
	}
	inline public function copy():NativeArrayPtr<T> {
		return new NativeArrayPtr(a, base_i);
	}
}