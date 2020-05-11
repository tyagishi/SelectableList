import XCTest
@testable import SelectableList

final class SelectableListTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SelectableList().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
