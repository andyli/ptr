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
		return a[Utils.safe(base_i + i, 0, a.length)];
	}
	public function set(i:Int, v:T):T {
		return a[Utils.safe(base_i + i, 0, a.length)] = v;
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
	inline public function lt(p:IConstPtr<T>):Bool {
		var p = Std.downcast(p, NativeArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i < p.base_i;
	}
	inline public function lte(p:IConstPtr<T>):Bool {
		var p = Std.downcast(p, NativeArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i <= p.base_i;
	}
	inline public function gt(p:IConstPtr<T>):Bool {
		var p = Std.downcast(p, NativeArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i > p.base_i;
	}
	inline public function gte(p:IConstPtr<T>):Bool {
		var p = Std.downcast(p, NativeArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i >= p.base_i;
	}
	inline public function eq(p:IConstPtr<T>):Bool {
		var p = Std.downcast(p, NativeArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i == p.base_i;
	}
	inline public function subPtr(p:IConstPtr<T>):Int {
		var p = Std.downcast(p, NativeArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i - p.base_i;
	}
}