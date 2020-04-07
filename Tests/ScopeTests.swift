//
//  ScopeTests.swift
//  ScopeTests
//
//  Created by hb1love on 02/12/2018.
//  Copyright © 2018 happytiger. All rights reserved.
//

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



