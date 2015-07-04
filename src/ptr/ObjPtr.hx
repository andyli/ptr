package ptr;

class ObjPtr<T> implements IPtr<T> {
	var _get(default, null):Void->T;
	var _set(default, null):T->T;

	public function new(_get:Void->T, _set:T->T):Void {
		this._get = _get;
		this._set = _set;
	}
	public function get(i:Int):T {
		return if (i == 0)
			_get();
		else
			throw "out of bound access";
	}
	public function set(i:Int, v:T):T {
		return if (i == 0)
			_set(v);
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
		return new ObjPtr(_get, _set);
	}
}