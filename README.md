# ShuInjector
 A very Simple Dependency Injector to be used with SwiftUI
 
 
## Installation

#### Swift Package Manager
To install `ShuInjector` using [Swift Package Manager](https://swift.org/package-manager/), add

`.package(name: "ShuInjector", url: "https://github.com/SimpleBoilerplates/ShuInjector", from: "1.0.0"),"` 

to your Package.swift, then follow the integration tutorial [here](https://swift.org/package-manager#importing-dependencies).

#### Cocoapod
Coming soon


## Usage

### Import

```
import ShuInjector
```

First define your assembler, like HTTP assembler or router etc

```
final class HTTPAssembler: ShuiAssembler {
	func assemble() {
		let provider = MoyaProvider<MultiTarget>(callbackQueue: DispatchQueue.main)
		ShuInjector.register(provider)
		ShuInjector.register(HttpManager())
	}
}
```
	
Now can you use that provider from any class that will be initialized after assembling. As example 

```
class HttpManager {
	@Inject var provider: MoyaProvider<MultiTarget>
}
```

This HTTP manager now can be accessed from any class that will be initialized later

```
class AuthRepository {
	@Inject var httpManager: HttpManager
}
```
And so on.

Architecture should be like you can define Several **ShuiAssembler** for different purposes, different features, HTTPAssembler should be defined on SceneDelegate level, there can be other **ShuiAssembler** for different purposes, like **AppAssembler**, that will handle Router, User Token etc. 


## Contact

Follow and contact me on [Twitter](https://twitter.com/SameeSadman) or [LinkedIn](https://www.linkedin.com/in/sadmansamee/). If you find an issue, just [open a ticket](https://github.com/SimpleBoilerplates/ShuInjector/issues/new). Pull requests are warmly welcome as well.

## Contribution

If you want fix anything or improve or add any new feature you are very much welcome.

## License

Cachy is released under the MIT license. See LICENSE for details.

