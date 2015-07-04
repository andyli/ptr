package ptr;

class ObjPtr<T> implements IPtr<T> {
	var o:T;
	public function new(o:T):Void {
		this.o = o;
	}
	public function get(i:Int):T {
		return if (i == 0)
			o;
		else
			throw "out of bound access";
	}
	public function set(i:Int, v:T):T {
		return if (i == 0)
			o = v;
		else
			throw "out of bound access";
	}
	public function add(i:Int):ObjPtr<T> {
		return if (i != 0)
			throw "ObjPtr cannot be add/sub.";
		else
			copy();
	}
	public function sub(i:Int):ObjPtr<T> {
		return if (i != 0)
			throw "ObjPtr cannot be add/sub.";
		else
			copy();
	}
	public function preInc():ObjPtr<T> {
		throw "ObjPtr cannot be inc/dec.";
	}
	public function postInc():ObjPtr<T> {
		throw "ObjPtr cannot be inc/dec.";
	}
	public function preDec():ObjPtr<T> {
		throw "ObjPtr cannot be inc/dec.";
	}
	public function postDec():ObjPtr<T> {
		throw "ObjPtr cannot be inc/dec.";
	}
	inline public function copy():ObjPtr<T> {
		return new ObjPtr(o);
	}
}