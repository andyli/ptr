package ptr;

import haxe.ds.Vector;

class VectorPtr<T> implements IPtr<T> {
	var a:Vector<T>;
	var base_i:Int;
	public function new(a:Vector<T>, i:Int):Void {
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
	public function add(i:Int):VectorPtr<T> {
		return new VectorPtr<T>(a, base_i + i);
	}
	public function sub(i:Int):VectorPtr<T> {
		return new VectorPtr<T>(a, base_i - i);
	}
	public function preInc():VectorPtr<T> {
		base_i++;
		return this;
	}
	public function postInc():VectorPtr<T> {
		var cur = copy();
		base_i++;
		return cur;
	}
	public function preDec():VectorPtr<T> {
		base_i--;
		return this;
	}
	public function postDec():VectorPtr<T> {
		var cur = copy();
		base_i--;
		return cur;
	}
	inline public function copy():VectorPtr<T> {
		return new VectorPtr(a, base_i);
	}
}