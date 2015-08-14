package ptr;

import haxe.io.UInt8Array;

class UInt8ArrayPtr implements IPtr<Int> {
	var a:UInt8Array;
	var base_i:Int;
	public function new(a:UInt8Array, i:Int):Void {
		this.a = a;
		this.base_i = i;
		#if ptr_no_out_of_bounds
			if (base_i < 0 || base_i >= a.length)
				throw "out of bound";
		#end
	}
	public function get(i:Int):Int {
		return a[Utils.safe(base_i + i, 0, a.length)];
	}
	public function set(i:Int, v:Int):Int {
		return a[Utils.safe(base_i + i, 0, a.length)] = v;
	}
	public function add(i:Int):UInt8ArrayPtr {
		return new UInt8ArrayPtr(a, base_i + i);
	}
	public function sub(i:Int):UInt8ArrayPtr {
		return new UInt8ArrayPtr(a, base_i - i);
	}
	public function preInc():UInt8ArrayPtr {
		#if ptr_no_out_of_bounds
			if (base_i+1 >= a.length)
				throw "out of bound";
		#end
		base_i++;
		return this;
	}
	public function postInc():UInt8ArrayPtr {
		#if ptr_no_out_of_bounds
			if (base_i+1 >= a.length)
				throw "out of bound";
		#end
		var cur = copy();
		base_i++;
		return cur;
	}
	public function preDec():UInt8ArrayPtr {
		#if ptr_no_out_of_bounds
			if (base_i-1 < 0)
				throw "out of bound";
		#end
		base_i--;
		return this;
	}
	public function postDec():UInt8ArrayPtr {
		#if ptr_no_out_of_bounds
			if (base_i-1 < 0)
				throw "out of bound";
		#end
		var cur = copy();
		base_i--;
		return cur;
	}
	inline public function copy():UInt8ArrayPtr {
		return new UInt8ArrayPtr(a, base_i);
	}
	inline public function lt(p:IConstPtr<Int>):Bool {
		var p = Std.instance(p, UInt8ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i < p.base_i;
	}
	inline public function lte(p:IConstPtr<Int>):Bool {
		var p = Std.instance(p, UInt8ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i <= p.base_i;
	}
	inline public function gt(p:IConstPtr<Int>):Bool {
		var p = Std.instance(p, UInt8ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i > p.base_i;
	}
	inline public function gte(p:IConstPtr<Int>):Bool {
		var p = Std.instance(p, UInt8ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i >= p.base_i;
	}
	inline public function eq(p:IConstPtr<Int>):Bool {
		var p = Std.instance(p, UInt8ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i == p.base_i;
	}
	inline public function subPtr(p:IConstPtr<Int>):Int {
		var p = Std.instance(p, UInt8ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i - p.base_i;
	}
}