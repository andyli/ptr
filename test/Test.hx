import haxe.unit.*;

class Test {
	static function main():Void {
		var runner = new TestRunner();
		runner.add(new TestArray());
		// runner.add(new TestObj());
		#if !java //https://github.com/HaxeFoundation/haxe/issues/4203
		runner.add(new TestBytes());
		runner.add(new TestUInt8Array());
		runner.add(new TestUInt16Array());
		runner.add(new TestUInt32Array());
		runner.add(new TestInt32Array());
		runner.add(new TestFloat32Array());
		runner.add(new TestFloat64Array());
		#end
		#if !java //https://github.com/HaxeFoundation/haxe/issues/3965
		runner.add(new TestVector());
		#end
		if (!runner.run()) {
			#if sys
				Sys.exit(1);
			#else
				throw "failed";
			#end
		}
	}
}