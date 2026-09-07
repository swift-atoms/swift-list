public import Index

extension List where Element: ~Copyable {

    public typealias Index = Index::Index<Element>
}
