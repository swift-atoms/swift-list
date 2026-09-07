import Testing

@testable import List

@Suite
struct `List exposes its namespace` {
    @Suite struct `The List namespace can be referenced` {}
    @Suite struct `No list namespace boundary cases are defined` {}
    @Suite struct `No list namespace integration cases are defined` {}
}

extension `List exposes its namespace`.`The List namespace can be referenced` {
    @Test func `namespace is available`() {

        _ = List<Int>.self
        #expect(Bool(true))
    }
}
