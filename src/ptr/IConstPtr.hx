package ptr;

interface IConstPtr<T> {
	public function get(i:Int):T;
	public function add(i:Int):IConstPtr<T>;
	public function sub(i:Int):IConstPtr<T>;
	public function preInc():IConstPtr<T>;
	public function postInc():IConstPtr<T>;
	public function preDec():IConstPtr<T>;
	public function postDec():IConstPtr<T>;
	public function copy():IConstPtr<T>;
	public function lt(p:IConstPtr<T>):Bool;
	public function lte(p:IConstPtr<T>):Bool;
	public function gt(p:IConstPtr<T>):Bool;
	public function gte(p:IConstPtr<T>):Bool;
	public function eq(p:IConstPtr<T>):Bool;
}
