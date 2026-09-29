import List
import Testing

@Suite
struct `List index aliases preserve their canonical type and conformances` {
    @Test
    func `The companion alias denotes the canonical list and element index type`() {
        requireSameType(List<Int>.Index.self, ListIndex<Int>.self)
        requireSameType(ListIndex<Int>.self, Index<Int>.self)
    }

    @Test
    func `Noncopyable element tags preserve the index value conformances`() {
        requireSameType(ListIndex<NoncopyableElement>.self, List<NoncopyableElement>.Index.self)
        requireSameType(ListIndex<NoncopyableElement>.self, Index<NoncopyableElement>.self)
        requireIndexConformances(ListIndex<NoncopyableElement>.self)

        let index: ListIndex<NoncopyableElement> = 3
        let duplicate = copy index
        #expect(duplicate == index)
        #expect(Set([index, duplicate]).count == 1)
    }
}

private final class MutableState {
    var value = 0
}

private struct NoncopyableElement: ~Copyable {
    var state: MutableState
}

private func requireSameType<T>(_: T.Type, _: T.Type) {}

private func requireIndexConformances<T: Copyable & Escapable & Hashable & Comparable & Sendable>(
    _: T.Type
) {}
