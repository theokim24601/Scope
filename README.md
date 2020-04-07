# Scope

[![Platform](https://img.shields.io/cocoapods/p/Scope.svg?style=flat)](https://github.com/hb1love/Scope)
![Swift](https://img.shields.io/badge/Swift-5.1-orange.svg)
[![Build Status](https://travis-ci.org/hb1love/Scope.svg?branch=master)](https://travis-ci.org/hb1love/Scope)
[![CocoaPods](http://img.shields.io/cocoapods/v/Scope.svg)](https://cocoapods.org/pods/Scope)

🌷 Scoping Functions of Kotlin Style for Readable Code

## Usage

**`apply`**, **`also`** , **`let`**, **`with`**, **`run`** 

### Reture Value

The scope functions differ by the result they return:

- `apply`, `also` return the context object.
- `let`, `with`, and `run` return the closure result.

The return value of `also`  and `apply` is the context object itself. so they can be included into call chains as side steps.

```swift
let org = Organization()
  .also { print("new podo org") }
  .apply {
    $0.name = "podo"
    $0.member = Member(name: "Esther", role: .owner)
  }
```

They also can be used in return statements of functions returning the context object.

```swift
func newPodoOrg() -> Organization {
  Organization().apply {
    $0.name = "podo"
    $0.member = Member(name: "Esther", role: .owner)
  }
}
```

### apply

Use `apply` for code blocks that don't return a value and mainly operate on the members of the receiver object. 

```swift
let org = Organization().apply {
  $0.name = "podo"
  $0.member = Member(name: "esther", role: .owner)
}
print(org)
```

### also

Use `also` for additional actions that don't alter the object, such as logging or printing debug information.

```swift
let member = Member(name: "esther", role: .owner)
let org = Organization()

org.also { print("new member") }
  .addMember(member)
``` 

### let

`let` can be used to invoke one or more functions on result of call chains.

```swift
let numbers = [1, 5, 10]
numbers.map { $0 * 2 }
  .filter { $0 > 3}
  .let { $0.count }
```

`let` is often used for executing a code block only with non-nil values.

```swift
var org: Organization?
org = Organization(name: "podo", member: Member(name: "esther", role: .member))

org?.member?.let {
  $0.role = .owner // $0 is not nil inside '?.let {}' 
}
```

### with

A non-extension function: the context object is passed as an argument, and return value is the closure result.

`with` can be read as *"with this object, do the following."*

```swift
let description = with(org) {
  "Orgnaization name is \($0.name), "
    .appending("member name is \($0.member.name)")
}
print(description)
```

### run

Use `run` as a non-extension function. 
Non-extension `run` lets you execute a block of several statements where an expression is required.

```swift
let hexNumberRegex = run2 { () -> Regex in
  let digits = "0-9"
  let hexDigits = "A-Fa-f"
  let sign = "+-"

  return Regex("[\(sign)]?[\(digits)\(hexDigits)]+")
}
```

## Installation

- **Using [Swift Package Manager](https://swift.org/package-manager/)**

  ```swift
  import PackageDescription

  let package = Package(
    name: "MyApp",
    dependencies: [
      .Package(url: "https://github.com/hb1love/Scope", majorVersion: 2),
    ]
  )
  ```

- **Using [CocoaPods](https://cocoapods.org)**

  ```ruby
  pod 'Scope'
  ```

## License

**Scope** is available under the MIT license. See the [LICENSE](LICENSE) for details.
