package ptr;

import haxe.io.UInt32Array;

class UInt32ArrayPtr implements IPtr<UInt> {
	var a:UInt32Array;
	var base_i:Int;
	public function new(a:UInt32Array, i:Int):Void {
		this.a = a;
		this.base_i = i;
		#if ptr_no_out_of_bounds
			if (base_i < 0 || base_i >= a.length)
				throw "out of bound";
		#end
	}
	public function get(i:Int):UInt {
		return a[Utils.safe(base_i + i, 0, a.length)];
	}
	public function set(i:Int, v:UInt):UInt {
		return a[Utils.safe(base_i + i, 0, a.length)] = v;
	}
	public function add(i:Int):UInt32ArrayPtr {
		return new UInt32ArrayPtr(a, base_i + i);
	}
	public function sub(i:Int):UInt32ArrayPtr {
		return new UInt32ArrayPtr(a, base_i - i);
	}
	public function preInc():UInt32ArrayPtr {
		#if ptr_no_out_of_bounds
			if (base_i+1 >= a.length)
				throw "out of bound";
		#end
		base_i++;
		return this;
	}
	public function postInc():UInt32ArrayPtr {
		#if ptr_no_out_of_bounds
			if (base_i+1 >= a.length)
				throw "out of bound";
		#end
		var cur = copy();
		base_i++;
		return cur;
	}
	public function preDec():UInt32ArrayPtr {
		#if ptr_no_out_of_bounds
			if (base_i-1 < 0)
				throw "out of bound";
		#end
		base_i--;
		return this;
	}
	public function postDec():UInt32ArrayPtr {
		#if ptr_no_out_of_bounds
			if (base_i-1 < 0)
				throw "out of bound";
		#end
		var cur = copy();
		base_i--;
		return cur;
	}
	inline public function copy():UInt32ArrayPtr {
		return new UInt32ArrayPtr(a, base_i);
	}
	inline public function lt(p:IConstPtr<UInt>):Bool {
		var p = Std.downcast(p, UInt32ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i < p.base_i;
	}
	inline public function lte(p:IConstPtr<UInt>):Bool {
		var p = Std.downcast(p, UInt32ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i <= p.base_i;
	}
	inline public function gt(p:IConstPtr<UInt>):Bool {
		var p = Std.downcast(p, UInt32ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i > p.base_i;
	}
	inline public function gte(p:IConstPtr<UInt>):Bool {
		var p = Std.downcast(p, UInt32ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i >= p.base_i;
	}
	inline public function eq(p:IConstPtr<UInt>):Bool {
		var p = Std.downcast(p, UInt32ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i == p.base_i;
	}
	inline public function subPtr(p:IConstPtr<UInt>):Int {
		var p = Std.downcast(p, UInt32ArrayPtr);
		return if (p == null || this.a != p.a)
			throw "cannot compare pointers to different array";
		else
			this.base_i - p.base_i;
	}
}