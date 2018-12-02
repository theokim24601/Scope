# Scope

[![Build Status](https://travis-ci.org/hb1love/Scope.svg?branch=master)](https://travis-ci.org/hb1love/Scope)
[![Platform](https://img.shields.io/cocoapods/p/Scope.svg?style=flat)](https://github.com/hb1love/Scope)
![Swift](https://img.shields.io/badge/Swift-4.2-orange.svg)
[![CocoaPods](http://img.shields.io/cocoapods/v/Scope.svg)](https://cocoapods.org/pods/Scope)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

🌷 Scoping Functions of Kotlin Style for Readable Code

## Usage

### Using `run`

The `run` function is helpful to:
- Scope variable into a closure

```swift
var age = 17

run {
    var age = 27
    print(age) // 27
}
print(age) // 17
```

### Using `with`

```swift
with(profile.user) {
    $0.email = "usermail@gmail.com"
    $0.github = "github.com/hb1love"
}
```

### Using `let`

```swift
profile.user.let {
    $0.email = "usermail@gmail.com"
    $0.github = "github.com/hb1love"
}
```

### Using `also`

### Using `apply`


## Requirements

- iOS 8.0+
- Xcode 9.0+
- Swift 3.0+

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
