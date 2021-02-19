# Scope

[![Swift](https://img.shields.io/badge/Swift-5.2-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/cocoapods/p/Scope.svg?style=flat)](https://github.com/hb1love/Scope)
[![CocoaPods](http://img.shields.io/cocoapods/v/Scope.svg)](https://github.com/hb1love/Scope)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager)
[![Build Status](https://github.com/hb1love/Scope/workflows/CI/badge.svg?branch=master)](https://github.com/hb1love/Scope/actions)
[![License](https://img.shields.io/github/license/hb1love/Scope)](LICENSE)

Scoping Functions of Swift Style for Readable Code

## 🌷 Usage

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
    $0.member = Member(name: "jayce", role: .owner)
  }
```

They also can be used in return statements of functions returning the context object.

```swift
func newPodoOrg() -> Organization {
  Organization().apply {
    $0.name = "podo"
    $0.member = Member(name: "jayce", role: .owner)
  }
}
```

### apply

Use `apply` for code blocks that don't return a value and mainly operate on the members of the receiver object. 

```swift
let org = Organization().apply {
  $0.name = "podo"
  $0.member = Member(name: "jayce", role: .owner)
}
print(org)
```

### also

Use `also` for additional actions that don't alter the object, such as logging or printing debug information.

```swift
let member = Member(name: "jayce", role: .owner)
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
org = Organization(name: "podo", member: Member(name: "jayce", role: .member))

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
let hexNumberRegex = run { () -> Regex in
  let digits = "0-9"
  let hexDigits = "A-Fa-f"
  let sign = "+-"

  return Regex("[\(sign)]?[\(digits)\(hexDigits)]+")
}
```

## ⚙️ Installation

- **Using [Swift Package Manager](https://swift.org/package-manager/)**

  ```swift
  import PackageDescription

  let package = Package(
    name: "MyApp",
    dependencies: [
      .package(url: "https://github.com/hb1love/Scope", .upToNextMajor(from: "2.1.0"))
    ]
  )
  ```

- **Using [CocoaPods](https://cocoapods.org)**

  ```ruby
  pod 'Scope'
  ```

## 👮‍ License

**Scope** is available under the MIT license. See the [LICENSE](LICENSE) for details.
