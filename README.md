# @Dependency
A property wrapper type that reflects a dependency injected using `DependencyContainer`.


### Usage
```
@Dependency(\.aService) var aService
```

### Create a Service
example to implement AService struct
```
struct AService {
    fileprivate public static let shared = AService()
    private init() {}

    public var example: Foo {
        ....
    }
    public func example() -> Foo {
        ....
    }
}
```
### Implement Dependency
```
public struct AServiceDependencyKey: LazyDependencyKey {
    public static var lazyValue:AService?
}

extension DependencyContainer {
    public var aService: AService {
        get { Self[AServiceDependencyKey.self] }
        set { Self[AServiceDependencyKey.self] = newValue }
    }
    static func setAService(){
        DependencyContainer.set(initialValue: AService.shared, key: AServiceDependencyKey.self)
    }
}
```


### Required
- Somewhere on your app launch code (Appdelegate)
```
setupDependencies()
```

and
```
private extension AppDelegate {
     func setupDependencies() {
         DependencyContainer.setAService
         DependencyContainer.set ....
         ...
     }
 }
```

#### Ref&Tech
https://apiumhub.com/tech-blog-barcelona/native-dependency-injection-in-swift/

#### Documentation
Swift Subscripts: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/subscripts/
