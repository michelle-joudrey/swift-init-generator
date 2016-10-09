# swift-init-generator
Uses the Swift parser to generate initializers

After selecting lines containing variable declarations, run the extension command to produce the corresponding initializer.

for example:

\<select text>
``` swift
class MyClass {
>   var a: Int
    var b: String
    var c: MyType<
}
```
\<run extension command>
``` swift
class TestClass {
    var a: Int
    var b: String
    var c: MyType
    init(a: Int, b: String, c: MyType) {
        self.a = a
        self.b = b
        self.c = c
    }
}
```
