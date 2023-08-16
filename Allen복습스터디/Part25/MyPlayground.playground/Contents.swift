import UIKit

/*
 레오는 지미의 지갑과 엘리의 지갑을 훔쳐 본인 지갑에 넣으려고 한다.
 하지만 Swift 컴파일러에 막혀 훔치지 못하고 있다.

 아래의 문제를 해결하여 모든 돈을 가져오시오.
 */
Int


struct 지갑 {
    var 천원권 = 2
    var 오천원권 = 1
    var 만원권 = 1
}

let 지미_지갑 = 지갑(천원권: 3, 오천원권: 2, 만원권: 1)
let 엘리_지갑 = 지갑(천원권: 2, 오천원권: 3, 만원권: 3)

let 레오_지갑 = 지미_지갑 + 엘리_지갑

extension 지갑 {
    static func + (lhs: 지갑, rhs: 지갑) -> 지갑 {
        return 지갑(
            천원권: lhs.천원권 + rhs.천원권,
            오천원권: lhs.오천원권 + rhs.오천원권,
            만원권: lhs.만원권 + rhs.만원권
            )
    }
}

/*
 아래의 코드를 동작시키기 위해 ++ 연산자를 정의하시오.
 (단, ++ 는  '+= 1'과 동일함)
 */

var i = 0.5
while (i < 10) {
    print(i)
    i++
}



extension Numeric {
    static postfix func ++(num: inout Self) -> Self {
        num += 1
        return num
    }
}



enum A: String {
    case a
    init () {
    }
}

//let a: Int8 = 0b0101101
//let b: Int8 = 0b1100011
////
////let result = a & b
////print(String(format: "%08d", Int(String(result, radix: 2))!))


var a: Int8 = 120 // 최대값 0111_1000

a = a &+ 10

DispatchQueue.global().async {
    DispatchQueue.main.sync {
        print("a")
    }
    
}


/// Jimmy
///
let a1: Int8 = 0b0101101
let b1: Int8 = 0b1100011
let result1 = a1 & b1
print(String(format: "%08d", Int(String(result1, radix: 2))!))

let a2: Int8 = 0b0101101
let b2: Int8 = 0b1100011

let result2 = a2 | b2

let a3: Int8 = 0b0101101
let b3: Int8 = 0b1100011

let result3 = a3 ^ b3


var a4: Int8 = 120
a4 = a4 &+ 10
print(a4)

/// Elly
let aa: UInt8 = 0b0000_1111 //

// 코드 입력
let bb: UInt8 = ??? 0b1111_0000

let sum: UInt8 = aa + bb

print(sum) // 255

 // 정답 -> ~aa
