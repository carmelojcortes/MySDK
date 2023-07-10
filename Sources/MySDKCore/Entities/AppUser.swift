import Foundation

public struct AppUser: Equatable, Hashable, Codable {
    public var name: String
    
    public init(name: String) {
        self.name = name
    }
    
    public func printName() {
        print(self.name)
    }
}

