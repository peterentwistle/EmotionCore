import XCTest
@testable import EmotionCore

class EmotionCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(EmotionCore().text, "Hello, World!")
    }


    static var allTests : [(String, (EmotionCoreTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
