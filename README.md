# AJPopAlert

[![CI Status](https://img.shields.io/travis/ajijoyo/AJPopAlert.svg?style=flat)](https://travis-ci.org/ajijoyo/AJPopAlert)
[![Version](https://img.shields.io/cocoapods/v/AJPopAlert.svg?style=flat)](https://cocoapods.org/pods/AJPopAlert)
[![License](https://img.shields.io/cocoapods/l/AJPopAlert.svg?style=flat)](https://cocoapods.org/pods/AJPopAlert)
[![Platform](https://img.shields.io/cocoapods/p/AJPopAlert.svg?style=flat)](https://cocoapods.org/pods/AJPopAlert)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
![](https://github.com/ajijoyo/AJPopAlert/blob/master/images/Simulator1.png)

## Requirements
```
Xcode 10+
Swift 4.2
```

## Installation

AJPopAlert is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AJPopAlert'
```

## Usage

### Default Alert

```Swift

let vc = AJPopAlert(title: "Lorem Ipsum", message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",position:.bottom)
vc.addAction(title: "Ok") { (action) in
  print("ok")
}
vc.addAction(title: "Later") { (action) in
  print("later")
}        
vc.addAction(title: "Cancel", type: .destructive) { (action) in
  action.dismiss(animated: true, completion: nil)
}        
vc.show()

```

## customization

#### Custom View
```Swift

let customView = MyCustomView()
let vc = AJPopAlert(customView: customView)

vc.addAction(title: "Ok") { (action) in
     print("ok")
}
vc.addAction(title: "Later") { (action) in
     print("later")
}
 
vc.addAction(title: "Cancel", type: .destructive) { (action) in
     action.dismiss(animated: true, completion: nil)
}
        
vc.show()

```

#### Custom Action
Make sure you inheritent `AJPopAction` add pass to  `addAction(popAction: <#T##AJPopAction#>)`
```Swift
class MyCustomAction : AJPopAction {
  init(){
    type = .normal
    
  }
}


//// in other class

let customView = MyCustomView()
let vc = AJPopAlert(customView: customView)

vc.addAction(title: "Ok") { (action) in
     print("ok")
}
vc.addAction(title: "Later") { (action) in
     print("later")
}
let action = MyCustomAction()
action.action = { (viewcontroller) in 
  print("DidTap")
}
vc.addAction(popAction:action)
        
vc.show()


```

### Documentation
See in Wiki Tab for further information

## Author

ajijoyo, self.ajiejoy@gmail.com

## License

AJPopAlert is available under the MIT license. See the LICENSE file for more info.
