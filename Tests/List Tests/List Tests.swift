import Testing

@testable import List

@Suite("List")
struct Tests {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension Tests.Unit {
    @Test func `namespace is available`() {

        _ = List<Int>.self
        #expect(Bool(true))
    }
}
