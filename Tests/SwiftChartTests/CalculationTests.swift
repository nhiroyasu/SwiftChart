import XCTest
@testable import SwiftChart

final class CalculationTests: XCTestCase {
    
    func test_calculateSeparationValue1() {
        let maxValue: Double = 78
        let separation: Double = 3
        
        let result = calculateSeparationValue(maxValue: maxValue, separation: separation)
        
        XCTAssertEqual(result, 20)
    }
    
    func test_calculateSeparationValue2() {
        let maxValue: Double = 1468
        let separation: Double = 3
        
        let result = calculateSeparationValue(maxValue: maxValue, separation: separation)
        
        XCTAssertEqual(result, 400)
    }
}
