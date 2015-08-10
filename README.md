# ptr

[![Build Status](https://travis-ci.org/andyli/ptr.svg?branch=master)](https://travis-ci.org/andyli/ptr)

C-style pointer emulation in pure Haxe, for easy porting of C/C++ code base to Haxe.

Let's make it clear: This is just a wrapper around `Array`/`haxe.ds.Vector`/`haxe.io.Bytes`, to provide a pointer-like interface, such that we can easily translate C/C++ code to Haxe.

If you're looking for a way to interact with native code, don't use this lib. Instead, use [cpp.Pointer, CFFI](http://gamehaxe.com/2015/06/17/wwx2015/), or any other [hxcpp magics](http://haxe.io/roundups/wwx/c++-magic/).

## usage

```haxe
import ptr.Ptr;  // the pointer type, which is an abstract
using ptr.Tools; // let us create Ptr easily

class Test {
  static function main() {
    // in this example, we will use an Array, but
    // we can also use a haxe.ds.Vector, or haxe.io.Bytes
    var array = [123, 456];
    
    // obtain a pointer to array's first element
    var p = array.ptr();
    $type(p);            // Ptr<Int>
    
    // Ptr works like haxe Array
    // we can get elements from it using array access syntax
    trace(p[0]);         // 123
    trace(p[1]);         // 456
    
    // out-of-bound access will cause run-time error
    // p[-1]
    // p[2]
    
    // of course we can set the elements
    // and it will affect the underlaying Array as expected
    p[0] = 999;
    trace(array);        // [999, 456]
    array[0] = 123;
    trace(p[0]);         // 123
    
    // pointer arithmetic
    p++;                 // point to the next element
    trace(p[0]);         // 456
    p--;                 // point to the previous element
    trace(p[0]);         // 123
    
    // it is fine to point to an unexisting element, unless `-D ptr-no-out-of-bounds`
    var badP = p + 100;  // no run-time error
    // ... as long as we don't dereference the unexisting element
    // badP[0]           // run-time error
  }
}
```
