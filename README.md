# swift-init-generator
Uses the Swift parser to generate initializers

After selecting lines containing variable declarations, run the extension command to produce the corresponding initializer.

## Example
![Alt Text](https://github.com/michelle-joudrey/swift-init-generator/blob/master/out.gif)

## Installation 
* Clone or download the source code  
* Configure the code signing team on both targets  
* Run the target `Swift Initializer Generator`  
* Restart Xcode  

### Xcode 10

* Make the "Swift Initializer Generator" scheme active
* Select Archive under the Product menu
* Select "Distribute App", then "Copy App", and export to /Applications
* Close Xcode
* Run the exported app from the Applications folder
* In System Preferences -> Extensions -> Xcode Source Editor, enable "Swift Initializer Generator"

### Source code for the libraries
https://github.com/mjoudrey/swift/tree/my-extension
