import List
import Testing

@Suite
struct `List index spellings preserve element tags and ordinal values` {
    @Test
    func `The list index is the element tagged index with the same ordinal`() {
        requireSameType(List<Int>.Index.self, Index<Int>.self)
        let index: List<Int>.Index = 3
        let canonical: Index<Int> = index
        #expect(canonical.underlying.rawValue == 3)
        #expect(ObjectIdentifier(List<Int>.Index.self) != ObjectIdentifier(List<String>.Index.self))
    }

    @Test
    func `A noncopyable element retains its canonical index type`() {
        requireSameType(List<NoncopyableElement>.Index.self, Index<NoncopyableElement>.self)
        let index: List<NoncopyableElement>.Index = 2
        let canonical: Index<NoncopyableElement> = index
        #expect(canonical.underlying.rawValue == 2)
    }
}

private struct NoncopyableElement: ~Copyable {}

private func requireSameType<T>(_: T.Type, _: T.Type) {}
