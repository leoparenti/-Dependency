public class DependencyContainer {
    private static var current = DependencyContainer()
    private init() {}

    /// - Parameter key: Implementation type of `DependencyKey`.
    public static subscript<K>(key: K.Type) -> K.Value where K: DependencyKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }

    /// Accesses the dependency with the specified `keyPath`.
    public static subscript<T>(_ keyPath: WritableKeyPath<DependencyContainer, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }

    public static func set<K>(initialValue: K.Value, key: K.Type) where K: LazyDependencyKey {
        key.lazyValue = initialValue
    }
}
