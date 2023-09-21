public protocol DependencyKey {
    associatedtype Value
    static var currentValue: Self.Value { get set }
}

public protocol LazyDependencyKey: DependencyKey {
    associatedtype Value
    static var lazyValue: Self.Value? { get set }
}

extension LazyDependencyKey {
    /// The unwrapped value of the injected dependency. Fails if the actual value has not been set before access.
    public static var currentValue: Self.Value {
        get {
            guard let currentValue = lazyValue else {
                preconditionFailure("Fail LazyDependency: miss implementation of DependencyContainer.set\(Self.Value.self)")
            }

            return currentValue
        }
        set {
            lazyValue = newValue
        }
    }
}
