# swift-init-generator
Uses the Swift parser to generate initializers

After selecting lines containing variable declarations, run the extension command to produce the corresponding initializer.

Example class (showing the selected line range):
``` swift
class MyClass {
>   var a: Int
    var b: String
    var c: MyType<
}
```
After running source editor extension command:
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

## Installation 
Set the code-signing team on both targets
Run the target `swift-init-generator`
Restart Xcode

### Source code for the libraries
https://github.com/rjoudrey/swift/tree/my-extension
