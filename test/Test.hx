import haxe.unit.*;

class Test {
	static function main():Void {
		var runner = new TestRunner();
		runner.add(new TestArray());
		#if !java
		runner.add(new TestBytes());
		#end
		#if !java //https://github.com/HaxeFoundation/haxe/issues/4382
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