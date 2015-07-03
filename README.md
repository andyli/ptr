# ptr

C-style pointer emulation in pure Haxe, for easy porting of C/C++ code base to Haxe.

Let's make it clear: This is just a wrapper around `Array`/`haxe.ds.Vector`/`haxe.io.Bytes`, to provide a pointer-like interface, such that we can translate C/C++ code to Haxe easier.

If you're looking for a way to interact with native code, don't use this lib. Instead, use [cpp.Pointer, CFFI](http://gamehaxe.com/2015/06/17/wwx2015/), or any other [hxcpp magics](http://haxe.io/roundups/wwx/c++-magic/).