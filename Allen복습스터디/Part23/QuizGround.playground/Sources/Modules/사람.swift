import Foundation

open class 사람 {
    public var name: String = ""
    
    public init(name: String) {
        self.name = name
    }
    
    open func printDescription() {
        print(name)
    }
}
