public import Index
public import List_Primitive

extension List where Element: ~Copyable {

    public typealias Index = Index.Index<Element>
}
