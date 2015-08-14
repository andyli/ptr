package ptr;

abstract ConstPtr<T>(IConstPtr<T>) from IConstPtr<T> to IConstPtr<T> {
	inline static public function fromIConstPtr<T>(p:IConstPtr<T>):ConstPtr<T>
		return p;

	@:arrayAccess #if !php inline #end function get(i:Int):T {
		return this.get(i);
	}

	@:op(A+B) inline function add(i:Int):ConstPtr<T>
		return this.add(i);
	@:op(A-B) inline function sub(i:Int):ConstPtr<T>
		return this.sub(i);

	#if (haxe_ver <= 3.2) //https://github.com/HaxeFoundation/haxe/issues/4357
		@:op(++A) inline function preInc<T>():ConstPtr<T>
			return this.preInc();

		@:op(A++) inline function postInc<T>():ConstPtr<T>
			return this.postInc();

		@:op(--A) inline function preDec<T>():ConstPtr<T>
			return this.preDec();

		@:op(A--) inline function postDec<T>():ConstPtr<T>
			return this.postDec();
	#else
		@:op(++A) inline function preInc():ConstPtr<T>
			return this.preInc();

		@:op(A++) inline function postInc():ConstPtr<T>
			return this.postInc();

		@:op(--A) inline function preDec():ConstPtr<T>
			return this.preDec();

		@:op(A--) inline function postDec():ConstPtr<T>
			return this.postDec();
	#end

	inline public function copy():ConstPtr<T>
		return this.copy();

	@:op(A < B) inline function lt(p:ConstPtr<T>):Bool
		return this.lt(p);
	@:op(A <= B) inline function lte(p:ConstPtr<T>):Bool
		return this.lte(p);
	@:op(A > B) inline function gt(p:ConstPtr<T>):Bool
		return this.gt(p);
	@:op(A >= B) inline function gte(p:ConstPtr<T>):Bool
		return this.gte(p);
	@:op(A == B) inline function eq(p:ConstPtr<T>):Bool
		return this.eq(p);
	@:op(A - B) inline function subPtr(p:ConstPtr<T>):Int
		return this.subPtr(p);
}