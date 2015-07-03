package ptr;

import haxe.io.Bytes;

class BytesPtr implements IPtr<Int> {
	var a:Bytes;
	var base_i:Int;
	public function new(a:Bytes, i:Int):Void {
		this.a = a;
		this.base_i = i;
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
		base_i++;
		return this;
	}
	public function postInc():BytesPtr {
		var cur = copy();
		base_i++;
		return cur;
	}
	public function preDec():BytesPtr {
		base_i--;
		return this;
	}
	public function postDec():BytesPtr {
		var cur = copy();
		base_i--;
		return cur;
	}
	inline public function copy():BytesPtr {
		return new BytesPtr(a, base_i);
	}
}