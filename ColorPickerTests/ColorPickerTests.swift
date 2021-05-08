//
//  ColorPickerTests.swift
//  ColorPickerTests
//
//  Created by Theodore Lampert on 08.05.21.
//

import XCTest
@testable import ColorPicker

class ColorPickerTests: XCTestCase {

    func testShouldShowLabel() throws {
        let store = PickerStore()
        XCTAssertEqual(store.shouldShowLabel, true)
        store.isOpen = true
        XCTAssertEqual(store.shouldShowLabel, false)
        store.toggleSelected(colorChoice: .init(color: .red))
        store.isOpen = false
        XCTAssertEqual(store.shouldShowLabel, false)
    }

    func testShouldShowGrid() throws {
        let store = PickerStore()
        XCTAssertEqual(store.shouldShowGrid, false)
        store.toggleSelected(colorChoice: .init(color: .red))
        XCTAssertEqual(store.shouldShowGrid, true)
    }
}
