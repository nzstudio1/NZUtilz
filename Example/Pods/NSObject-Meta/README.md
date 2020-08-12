
# NSObject-Meta

  

[![CI Status](https://img.shields.io/travis/nzstudio1/NSObject-Meta.svg?style=flat)](https://travis-ci.org/nzstudio1/NSObject-Meta)

[![Version](https://img.shields.io/cocoapods/v/NSObject-Meta.svg?style=flat)](https://cocoapods.org/pods/NSObject-Meta)

[![License](https://img.shields.io/cocoapods/l/NSObject-Meta.svg?style=flat)](https://cocoapods.org/pods/NSObject-Meta)

[![Platform](https://img.shields.io/cocoapods/p/NSObject-Meta.svg?style=flat)](https://cocoapods.org/pods/NSObject-Meta)

  

## Summary

Using objc_getAssociatedObject and objc_setAssociatedObject is sometimes troublesome. NSObject+Meta brings in the ease of assigning meta objects to another instance of NSObject. Meta objects are retained, if you want to assign weakly, use weakMeta.

For retained objects it uses a NSMutableDictionary and for the weak objects it uses NSMapTable with weak value containers.

  

## How to use
Lets say self is a UIViewController. 
### Strong meta objects:

        self.view.meta = "I am the strong meta!" // [strongly] assigns a string to the view
        self.view.setMeta("I am a strong meta for key: `test`", forKey: "test") // [strongly] assigns a string to a view based addressed by a specific key
        
        print(self.view.meta as! String) // prints `I am the strong meta!`
        print(self.view.meta(forKey: "test") as! String) // prints `I am a strong meta for key: `test``
        
  ### Weak meta Objects:
  
        self.view.weakMeta = "I am the weak meta!"
        self.view.setWeakMeta("I am a weak meta for key: `test`", forKey: "test")

        let _ = self.view.weakMeta // returns nil because the weak object is released immediately after assignment
        let _ = self.view.weakMeta(forKey: "test") // returns nil because the weak object is released immediately after assignment

### How to remove a meta assignment:
Just use the same APIs with nil values.

    self.view.meta = nil // sets the default strong meta object for view to nil
    self.view.setWeakMeta(nil, forKey:"somekey") // sets the weak meta object for key `somekey` to nil

  

## Example

  

To run the example project, clone the repo, and run `pod install` from the Example directory first.

  

## Requirements

  

## Installation

  

NSObject-Meta is available through [CocoaPods](https://cocoapods.org). To install

it, simply add the following line to your Podfile:

  

```ruby

pod 'NSObject-Meta'

```

  

## Author

  

Hamidreza Vakilian, hamid@nzstudio.dev

  

## License

  

NSObject-Meta is available under the MIT license. See the LICENSE file for more info.
