package ptr;

class ArrayPtr<T> implements IPtr<T> {
	var a:Array<T>;
	var base_i:Int;
	public function new(a:Array<T>, i:Int):Void {
		this.a = a;
		this.base_i = i;
		#if ptr_no_out_of_bounds
			if (base_i < 0 || base_i >= a.length)
				throw "out of bound";
		#end
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
	public function add(i:Int):ArrayPtr<T> {
		return new ArrayPtr<T>(a, base_i + i);
	}
	public function sub(i:Int):ArrayPtr<T> {
		return new ArrayPtr<T>(a, base_i - i);
	}
	public function preInc():ArrayPtr<T> {
		#if ptr_no_out_of_bounds
			if (base_i+1 >= a.length)
				throw "out of bound";
		#end
		base_i++;
		return this;
	}
	public function postInc():ArrayPtr<T> {
		#if ptr_no_out_of_bounds
			if (base_i+1 >= a.length)
				throw "out of bound";
		#end
		var cur = copy();
		base_i++;
		return cur;
	}
	public function preDec():ArrayPtr<T> {
		#if ptr_no_out_of_bounds
			if (base_i-1 < 0)
				throw "out of bound";
		#end
		base_i--;
		return this;
	}
	public function postDec():ArrayPtr<T> {
		#if ptr_no_out_of_bounds
			if (base_i-1 < 0)
				throw "out of bound";
		#end
		var cur = copy();
		base_i--;
		return cur;
	}
	inline public function copy():ArrayPtr<T> {
		return new ArrayPtr(a, base_i);
	}
	inline public function lt(p:IConstPtr<T>):Bool {
		var p = Std.instance(p, ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i < p.base_i;
	}
	inline public function lte(p:IConstPtr<T>):Bool {
		var p = Std.instance(p, ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i <= p.base_i;
	}
	inline public function gt(p:IConstPtr<T>):Bool {
		var p = Std.instance(p, ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i > p.base_i;
	}
	inline public function gte(p:IConstPtr<T>):Bool {
		var p = Std.instance(p, ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i >= p.base_i;
	}
	inline public function eq(p:IConstPtr<T>):Bool {
		var p = Std.instance(p, ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i == p.base_i;
	}
	inline public function subPtr(p:IConstPtr<T>):Int {
		var p = Std.instance(p, ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i - p.base_i;
	}
}