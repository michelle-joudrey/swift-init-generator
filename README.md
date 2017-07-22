# swift-init-generator
Uses the Swift parser to generate initializers

After selecting lines containing variable declarations, run the extension command to produce the corresponding initializer.

## Example
![Alt Text](https://github.com/mjoudrey/swift-init-generator/blob/master/out.gif)

## Installation
1. [Download the app extension](https://github.com/mjoudrey/swift-init-generator/releases/download/0.13/Swift.Initializer.Generator.app.zip)  
2. Unzip it  
3. Move `Swift Initializer Generator.app` to Applications  
4. Start `Swift Initializer Generator.app`  
5. Go to System Preferences > Extensions > Xcode Source Editor and enable `Generate Swift Initializer`  
6. Restart Xcode  

## Alternate Installation 
Configure the code signing on both targets  
Run the target `Swift Initializer Generator`  
Restart Xcode  

### Source code for the libraries
https://github.com/mjoudrey/swift/tree/my-extension
