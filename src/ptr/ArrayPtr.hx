package ptr;

class ArrayPtr<T> implements IPtr<T> {
	var a:Array<T>;
	var base_i:Int;
	public function new(a:Array<T>, i:Int):Void {
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
	public function add(i:Int):ArrayPtr<T> {
		return new ArrayPtr<T>(a, base_i + i);
	}
	public function sub(i:Int):ArrayPtr<T> {
		return new ArrayPtr<T>(a, base_i - i);
	}
	public function preInc():ArrayPtr<T> {
		base_i++;
		return this;
	}
	public function postInc():ArrayPtr<T> {
		var cur = copy();
		base_i++;
		return cur;
	}
	public function preDec():ArrayPtr<T> {
		base_i--;
		return this;
	}
	public function postDec():ArrayPtr<T> {
		var cur = copy();
		base_i--;
		return cur;
	}
	inline public function copy():ArrayPtr<T> {
		return new ArrayPtr(a, base_i);
	}
}