import XCTest
import Core
@testable import Random

class RandomTests: XCTestCase {

    func testMakeInt8() throws {
        let rand = try URandom.makeInt8()
        print(rand)
    }
    
    func testMakeInt16() throws {
        let rand = try URandom.makeInt16()
        print(rand)
    }
    
    func testMakeInt32() throws {
        let rand = try URandom.makeInt32()
        print(rand)
    }
    
    func testMakeInt64() throws {
        let rand = try URandom.makeInt64()
        print(rand)
    }
    
    func testMakeInt() throws {
        let rand = try URandom.makeInt()
        print(rand)
    }

    func testOSRandom() throws {
        let rand = try OSRandom.makeInt64()
        print(rand)
        let bytes = try OSRandom.bytes(count: 32)
        print(bytes.makeString())
    }

    func testURandomCount() throws {
        let rand = try URandom.bytes(count: 65_536)
        XCTAssertEqual(rand.count, 65_536)
    }

    func testForTrailingZeros() throws {
        let rand = try URandom.bytes(count: 65_536)
        let tail = Bytes(rand.suffix(8))
        let zeros = Bytes(repeating: 0, count: 8)
        XCTAssertNotEqual(tail, zeros)
    }
    
    func testArrayWithZeroElements() {
        let array: [Int] = []
        XCTAssertNil(array.random)
    }
    
    func testArrayWithOneElement() {
        let array = [3]
        XCTAssertEqual(array.random, 3)
    }
    
    func testArrayWithMultipleElements() {
        let array = [1, 2, 3]
        var results: [Int: Int] = [:]
        for _ in 0..<65_536 {
            if let foo = array.random {
                results[foo] = (results[foo] ?? 0) + 1
            }
        }
        print(results)
    }
}
