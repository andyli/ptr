package ptr;

abstract Ptr<T>(IPtr<T>) from IPtr<T> {
	inline static public function fromIPtr<T>(p:IPtr<T>):Ptr<T>
		return p;

	@:arrayAccess #if !php inline #end function get(i:Int):T {
		return this.get(i);
	}
	@:arrayAccess #if !php inline #end function set(i:Int, v:T):T {
		return this.set(i, v);
	}

	@:op(A+B) inline function add(i:Int):Ptr<T>
		return this.add(i);
	@:op(A-B) inline function sub(i:Int):Ptr<T>
		return this.sub(i);

	#if (haxe_ver <= 3.2) //https://github.com/HaxeFoundation/haxe/issues/4357
		@:op(++A) inline function preInc<T>():Ptr<T>
			return this.preInc();

		@:op(A++) inline function postInc<T>():Ptr<T>
			return this.postInc();

		@:op(--A) inline function preDec<T>():Ptr<T>
			return this.preDec();

		@:op(A--) inline function postDec<T>():Ptr<T>
			return this.postDec();
	#else
		@:op(++A) inline function preInc():Ptr<T>
			return this.preInc();

		@:op(A++) inline function postInc():Ptr<T>
			return this.postInc();

		@:op(--A) inline function preDec():Ptr<T>
			return this.preDec();

		@:op(A--) inline function postDec():Ptr<T>
			return this.postDec();
	#end
}