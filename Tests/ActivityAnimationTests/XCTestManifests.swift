import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ActivityAnimationTests.allTests),
    ]
}
#endif
