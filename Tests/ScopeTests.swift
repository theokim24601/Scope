//  MIT License
//
//  Copyright © 2018 Esther. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import XCTest
@testable import Scope

class Organization: Let, Also, Apply {
  var name: String
  var member: Member?

  init(name: String = "default", member: Member? = nil) {
    self.name = name
    self.member = member
  }

  func addMember(_ member: Member) {
    self.member = member
  }
}

class Member: Let {
  var name: String
  var role: Role?

  init(name: String = "user", role: Role? = nil) {
    self.name = name
    self.role = role
  }
}

enum Role {
  case owner
  case member
}

class ScopeTests: XCTestCase {

  func testApply() {
    let org = Organization().apply {
      $0.name = "podo"
      $0.member = Member(name: "esther", role: .owner)
    }

    XCTAssertEqual(org.name, "podo")
    XCTAssertEqual(org.member?.name, "esther")
  }

  func testAlso() {
    let member = Member(name: "esther", role: .owner)
    let org = Organization()

    org.also { print("new member") }
      .addMember(member)

    XCTAssertEqual(org.member?.name, "esther")
  }

  func testLet() {
    var org: Organization?
    org = Organization(name: "podo", member: Member(name: "esther", role: .member))

    org?.member?.let {
      $0.role = .owner
    }

    XCTAssertEqual(org?.member?.role, .owner)

    let member = org?.let { org -> Member? in
      org.name = "new podo"
      return org.member
    }

    XCTAssertEqual(org?.name, "new podo")
    XCTAssertEqual(member?.name, "esther")
  }

  func testWith() {
    let org = Organization()
    org.member = Member()

    let description = with(org) {
      "Orgnaization name is \($0.name), "
        .appending("member name is \($0.member!.name)")
    }

    XCTAssertEqual(description, "Orgnaization name is default, member name is user")
  }

  func testWith_optional() {
    let org = Organization()

    with(org.member) {
      $0?.name = "Org!!"
      $0?.role = .owner
    }

    XCTAssertTrue(org.name == "default")
    XCTAssertTrue(org.member?.role == nil)
  }
}



