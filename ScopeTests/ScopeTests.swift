//
//  ScopeTests.swift
//  ScopeTests
//
//  Created by hb1love on 02/12/2018.
//  Copyright © 2018 happytiger. All rights reserved.
//

import XCTest
@testable import Scope

class Organazation: Let, Also, Apply {
    var name: String
    var member: Member?

    init(name: String = "default", member: Member? = nil) {
        self.name = name
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

func someFunc1(){}
func someFunc2(){}
func someFunc3(){}

class ScopeTests: XCTestCase {

    func testAlso() {
        let org = Organazation().also {
            $0.name = "podo"
            $0.member = Member(name: "hb1love", role: .owner)
        }

        XCTAssertTrue(org.name == "podo")
        XCTAssertTrue(org.member?.name == "hb1love")
    }

    func testApply() {
        let org = Organazation().apply {
            someFunc1()
        }

        XCTAssertTrue(org.name == "default")
        XCTAssertTrue(org.member == nil)
    }

    func testLet() {
        let org = Organazation(name: "podo", member: Member(name: "hb1love", role: .owner))

        org.member?.let {
            $0.name = "heebeom"
        }

        XCTAssertTrue(org.member?.name == "heebeom")

        let member = org.let { org -> Member? in
            org.name = "new podo"
            return org.member
        }

        XCTAssertTrue(org.name == "new podo")
        XCTAssertTrue(member?.name == "heebeom")
    }

    func testrun() {
        let org = run { () -> Organazation in
            someFunc1()
            someFunc2()
            someFunc3()
            return Organazation(name: "podo")
        }

        XCTAssertTrue(org.name == "podo")
        XCTAssertTrue(org.member == nil)
    }

    func testWith() {
        let org = Organazation()

        with(org) {
            $0.name = "podo"
            $0.member = Member(name: "hb1love")

            with($0.member) {
                $0?.name = "heebeom"
            }
        }

        XCTAssertTrue(org.name == "podo")
        XCTAssertTrue(org.member?.name == "heebeom")
    }

    func testWith_optional() {
        let org = Organazation()

        with(org.member) {
            $0?.name = "Org!!"
            $0?.role = .owner
        }

        XCTAssertTrue(org.name == "default")
        XCTAssertTrue(org.member?.role == nil)
    }
}
