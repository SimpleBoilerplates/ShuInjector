
//  Created by sadman samee on 29/4/21.
//

import Foundation

public protocol ShuiAssembler {
    func assemble()
    func disassemble()
}

public extension ShuiAssembler {
    func disassemble() {}
}

// Usage
// ShuInjector.register(Store())
// ShuInjector.unregister(Store.self)
// @Inject private(set) var store: Store //(Inside a view or viewmodel)

@propertyWrapper
public struct Inject<T> {
    var wrappedValue: T

    init() {
        wrappedValue = ShuInjector.resolve()
    }
}

public final class ShuInjector {
    private var dependencies = [String: Any]()
    private static var shared = ShuInjector()
    
    private init() {}

    static func register<T>(_ dependency: T) {
        shared.register(dependency)
    }

    static func unregister<T>(_ type: T.Type) {
        shared.unregister(type)
    }

    static func resolve<T>() -> T {
        shared.resolve()
    }

    private func register<T>(_ dependency: T) {
        let key = String(describing: T.self)
        dependencies[key] = dependency as AnyObject
    }

    private func resolve<T>() -> T {
        let key = String(describing: T.self)
        let dependency = dependencies[key] as? T

        precondition(dependency != nil, "No dependency found for \(key)! must register a dependency before resolve.")

        return dependency!
    }

    private func unregister<T>(_ type: T.Type) {
        let key = String(describing: "\(type)")
        let dependency = dependencies[key] as? T
        if dependency != nil {
            dependencies.removeValue(forKey: key)
        }
    }
}
