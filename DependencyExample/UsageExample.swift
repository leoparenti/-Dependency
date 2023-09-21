// USAGE
struct AStruct {
    @Dependency(\.aService) var aService

    func someFunc(){
        aService.example()
    }
}

// IMPLEMENT
public struct AServiceDependencyKey: LazyDependencyKey {
    public static var lazyValue: AService?
}

public extension DependencyContainer {
    var aservice: AService {
        get { Self[AServiceDependencyKey.self] }
        set { Self[AServiceDependencyKey.self] = newValue }
    }

    static func setNavigationHelper(){
        DependencyContainer.set(initialValue: AService.shared, key: AServiceDependencyKey.self)
    }
}

// SERVICE
public struct AService {
    fileprivate static let shared = AService()
    private init() {}

    public var example: Foo {
        "this is example"
    }
    func foo() {
        //do things
    }
}

struct Foo {

}
