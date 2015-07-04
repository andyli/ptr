import haxe.unit.*;

class Test {
	static function main():Void {
		var runner = new TestRunner();
		runner.add(new TestArray());
		runner.add(new TestObj());
		#if !java //https://github.com/HaxeFoundation/haxe/issues/4203
		runner.add(new TestBytes());
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