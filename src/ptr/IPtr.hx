package ptr;

interface IPtr<T> extends IConstPtr<T> {
	public function set(i:Int, v:T):T;
	public function add(i:Int):IPtr<T>;
	public function sub(i:Int):IPtr<T>;
	public function preInc():IPtr<T>;
	public function postInc():IPtr<T>;
	public function preDec():IPtr<T>;
	public function postDec():IPtr<T>;
	public function copy():IPtr<T>;
}