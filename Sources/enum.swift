
extension RawRepresentable where RawValue: Strideable {
    func increment() -> Self {
        return Self(rawValue: rawValue + 1) ?? self
    }
    func decrement() -> Self {
        return Self(rawValue: rawValue - 1) ?? self
    }
    mutating func incrementInPlace() {
        self = increment()
    }
    mutating func decrementInPlace() {
        self = decrement()
    }
}

extension RawRepresentable where RawValue:IntegerType {
    /**
     - Attention: the result will be correct only if all raw values are sequential and start from zero
     */
    static var count: Int {
        var i: RawValue = 0
        while let _ = Self(rawValue:i) {
            i++
        }
        return Int(i.toIntMax())
    }
    /**
     - Attention: the result will be correct only if all raw values are sequential and start from zero
     */
    static var allValues: [Self] {
        var values = [Self]()
        var i: RawValue = 0
        while let value = Self(rawValue:i) {
            values.append(value)
            i++
        }
        return values
    }
}



func == <A:RawRepresentable,B:Equatable where A.RawValue:Equatable, A.RawValue==B>(lhs:A,rhs:B) -> Bool {
    return lhs.rawValue == rhs
}

func != <A:RawRepresentable,B:Equatable where A.RawValue:Equatable, A.RawValue==B>(lhs:A,rhs:B) -> Bool {
    return lhs.rawValue != rhs
}

func > <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:A,rhs:B) -> Bool {
    return lhs.rawValue > rhs
}

func < <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:A,rhs:B) -> Bool {
    return lhs.rawValue < rhs
}

func >= <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:A,rhs:B) -> Bool {
    return lhs.rawValue >= rhs
}

func <= <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:A,rhs:B) -> Bool {
    return lhs.rawValue <= rhs
}

func == <A:RawRepresentable,B:Equatable where A.RawValue:Equatable, A.RawValue==B>(lhs:B,rhs:A) -> Bool {
    return lhs == rhs.rawValue
}

func != <A:RawRepresentable,B:Equatable where A.RawValue:Equatable, A.RawValue==B>(lhs:B,rhs:A) -> Bool {
    return lhs != rhs.rawValue
}

func > <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:B,rhs:A) -> Bool {
    return lhs > rhs.rawValue
}

func < <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:B,rhs:A) -> Bool {
    return lhs < rhs.rawValue
}

func >= <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:B,rhs:A) -> Bool {
    return lhs >= rhs.rawValue
}

func <= <A:RawRepresentable,B:Comparable where A.RawValue:Comparable, A.RawValue==B>(lhs:B,rhs:A) -> Bool {
    return lhs <= rhs.rawValue
}
