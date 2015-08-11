package ptr;

import haxe.io.Bytes;

class BytesPtr implements IPtr<Int> {
	var a:Bytes;
	var base_i:Int;
	public function new(a:Bytes, i:Int):Void {
		this.a = a;
		this.base_i = i;
		#if ptr_no_out_of_bounds
			if (base_i < 0 || base_i >= a.length)
				throw "out of bound";
		#end
	}
	public function get(i:Int):Int {
		return if (i >= 0 && i < a.length)
			a.get(base_i + i);
		else
			throw "out of bound access";
	}
	public function set(i:Int, v:Int):Int {
		return if (i >= 0 && i < a.length) {
			a.set(base_i + i, v);
			v;
		} else
			throw "out of bound access";
	}
	public function add(i:Int):BytesPtr {
		return new BytesPtr(a, base_i + i);
	}
	public function sub(i:Int):BytesPtr {
		return new BytesPtr(a, base_i - i);
	}
	public function preInc():BytesPtr {
		#if ptr_no_out_of_bounds
			if (base_i+1 >= a.length)
				throw "out of bound";
		#end
		base_i++;
		return this;
	}
	public function postInc():BytesPtr {
		#if ptr_no_out_of_bounds
			if (base_i+1 >= a.length)
				throw "out of bound";
		#end
		var cur = copy();
		base_i++;
		return cur;
	}
	public function preDec():BytesPtr {
		#if ptr_no_out_of_bounds
			if (base_i-1 < 0)
				throw "out of bound";
		#end
		base_i--;
		return this;
	}
	public function postDec():BytesPtr {
		#if ptr_no_out_of_bounds
			if (base_i-1 < 0)
				throw "out of bound";
		#end
		var cur = copy();
		base_i--;
		return cur;
	}
	inline public function copy():BytesPtr {
		return new BytesPtr(a, base_i);
	}
	inline public function lt(p:IPtr<Int>):Bool {
		var p = Std.instance(p, BytesPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i < p.base_i;
	}
	inline public function lte(p:IPtr<Int>):Bool {
		var p = Std.instance(p, BytesPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i <= p.base_i;
	}
	inline public function gt(p:IPtr<Int>):Bool {
		var p = Std.instance(p, BytesPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i > p.base_i;
	}
	inline public function gte(p:IPtr<Int>):Bool {
		var p = Std.instance(p, BytesPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i >= p.base_i;
	}
	inline public function eq(p:IPtr<Int>):Bool {
		var p = Std.instance(p, BytesPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i == p.base_i;
	}
}