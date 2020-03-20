# Scope

[![Build Status](https://travis-ci.org/hb1love/Scope.svg?branch=master)](https://travis-ci.org/hb1love/Scope)
[![Platform](https://img.shields.io/cocoapods/p/Scope.svg?style=flat)](https://github.com/hb1love/Scope)
![Swift](https://img.shields.io/badge/Swift-5.1-orange.svg)
[![CocoaPods](http://img.shields.io/cocoapods/v/Scope.svg)](https://cocoapods.org/pods/Scope)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

🌷 Scoping Functions of Kotlin Style for Readable Code

## Usage

**`also`**, **`with`**, **`let`**, **`run`**, **`apply`**


Initialize Instance with **`also`** in closure

```swift
let org = Organazation().also {
    $0.name = "podo"
    $0.member = Member(name: "hb1love", role: .owner)
}
``` 

Similarly, we can be used like this. **`with`**

```swift
with(organization.member) {
    $0.name = "podo"
    $0.role = .owner
}
```

Imagine if `organization.member` could be null, maybe it looks like this: Use **`let`** !

```swift
// so bad..
with(organization.member) {
    $0?.name = "hb1love"
    $0?.role = .owner
}

// Good!
org.member?.let {
    $0.name = "hb1love"
    $0.role = .owner
}
```

it is fully enclosed within the **`run`** scope.

```swift
var age = 17
run {
    var age = 27
    print(age) // 27
}
print(age) // 17
```

```swift
let org = run { () -> Organazation in
    someFunc1()
    someFunc2()
    someFunc3()
    return Organazation(name: "podo")
}
```

Use **`apply`**, when you need any logic after initialization

```swift
let org = Organazation().apply {
    someFunc1()
    someFunc2()
}
```

**`apply`** has no parameters. It just returns an instance.

## Requirements

- iOS 8.0+
- Xcode 11.3.1+
- Swift 4.0+

## Installation

- Using [CocoaPods](https://cocoapods.org)

```ruby
pod 'Scope'
```

- Using [Carthage](https://github.com/Carthage/Carthage)

```
github "hb1love/Scope"
```

## License

**Scope** is available under the MIT license. See the [LICENSE](LICENSE) for details.
