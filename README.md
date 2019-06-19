# swift-init-generator
Uses the Swift parser to generate initializers

After selecting lines containing variable declarations, run the extension command to produce the corresponding initializer.

## Example
![Alt Text](https://github.com/rjoudrey/swift-init-generator/blob/master/out.gif)

## Installation 
Clone or download the source code  
Configure the code signing on both targets  
Run the target `Swift Initializer Generator`  
Restart Xcode  

### Xcode 10

Archive the target, export it and move to Applications folder
Close XCode
Run the app from the Applications folder
Go to Settings -> Extensions and select a checkbox under "Swift Initialiser Generator"

### Source code for the libraries
https://github.com/rjoudrey/swift/tree/my-extension
