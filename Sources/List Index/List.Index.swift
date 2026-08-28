public import Index
public import List

extension List where Element: ~Copyable {

    public typealias Index = Index.Index<Element>
}
