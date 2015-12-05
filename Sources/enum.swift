
public extension RawRepresentable where RawValue: Strideable {
    public func increment() -> Self {
        return Self(rawValue: rawValue + 1) ?? self
    }
    public func decrement() -> Self {
        return Self(rawValue: rawValue - 1) ?? self
    }
    public mutating func incrementInPlace() {
        self = increment()
    }
    public mutating func decrementInPlace() {
        self = decrement()
    }
}

public extension RawRepresentable where RawValue:IntegerType {
    /**
     - Attention: the result will be correct only if all raw values are sequential and start from zero
     */
    public static var count: Int {
        var i: RawValue = 0
        while let _ = Self(rawValue:i) {
            i++
        }
        return Int(i.toIntMax())
    }
    /**
     - Attention: the result will be correct only if all raw values are sequential and start from zero
     */
    public static var allCases: [Self] {
        var cases = [Self]()
        var i: RawValue = 0
        while let c = Self(rawValue:i) {
            cases.append(c)
            i++
        }
        return cases
    }
}



public func == <A:RawRepresentable,B:Equatable where A.RawValue:Equatable, A.RawValue==B>(lhs:A,rhs:B) -> Bool {
    return lhs.rawValue == rhs
}

public func != <A:RawRepresentable,B:Equatable where A.RawValue:Equatable, A.RawValue==B>(lhs:A,rhs:B) -> Bool {
    return lhs.rawValue != rhs
}

public func > <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:A,rhs:B) -> Bool {
    return lhs.rawValue > rhs
}

public func < <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:A,rhs:B) -> Bool {
    return lhs.rawValue < rhs
}

public func >= <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:A,rhs:B) -> Bool {
    return lhs.rawValue >= rhs
}

public func <= <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:A,rhs:B) -> Bool {
    return lhs.rawValue <= rhs
}

public func == <A:RawRepresentable,B:Equatable where A.RawValue:Equatable, A.RawValue==B>(lhs:B,rhs:A) -> Bool {
    return lhs == rhs.rawValue
}

public func != <A:RawRepresentable,B:Equatable where A.RawValue:Equatable, A.RawValue==B>(lhs:B,rhs:A) -> Bool {
    return lhs != rhs.rawValue
}

public func > <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:B,rhs:A) -> Bool {
    return lhs > rhs.rawValue
}

public func < <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:B,rhs:A) -> Bool {
    return lhs < rhs.rawValue
}

public func >= <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:B,rhs:A) -> Bool {
    return lhs >= rhs.rawValue
}

public func <= <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:B,rhs:A) -> Bool {
    return lhs <= rhs.rawValue
}
