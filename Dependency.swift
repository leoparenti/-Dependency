@propertyWrapper
public struct Dependency<T> {
    private let keyPath: WritableKeyPath<DependencyContainer, T>

    public var wrappedValue: T {
        get { DependencyContainer[keyPath] }
        set { DependencyContainer[keyPath] = newValue }
    }

    public init(_ keyPath: WritableKeyPath<DependencyContainer, T>) {
        self.keyPath = keyPath
    }
}
