package ptr;

class Utils {
	inline static public function safe(i:Int, gte:Int, lt:Int):Int {
		return if (i >= gte && i < lt)
			i;
		else
			throw "out of bound";
	}
}