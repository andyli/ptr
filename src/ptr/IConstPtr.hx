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
}
