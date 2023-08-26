import UIKit

/*
 아래 코드를 자유롭게 변형하여 출력 결과가 나오도록 수정하시오.
 */

enum Size: Int  {
    case Small
    case Medium
    case Large
    case XLarge
}

extension Size: Comparable {
    static func < (lhs: Size, rhs: Size) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

struct Person: Comparable {
    var name: String
    var clothesSize: Size
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.clothesSize < rhs.clothesSize
    }
}

Size.Small < Size.XLarge // true
Size.Small > Size.XLarge // false

let bigPerson = Person(name: "BIG", clothesSize: .XLarge)
let smallPerson = Person(name: "Small", clothesSize: .Small)

bigPerson < smallPerson // false

let big2Person = Person(name: "BIG2", clothesSize: .XLarge)

bigPerson == big2Person // false




enum 은행: CaseIterable {
    case 신한은행, 국민은행, 카카오뱅크, 우리은행, 농협은행
}

/*
 1. 코드 두 줄을 작성하여 다음을 출력하시오.
 신한은행
 국민은행
 카카오뱅크
 우리은행
 농협은행
 */

for bank in 은행.allCases {
    print(bank)
}

/*
 2. 아래의 코드를 짧게 변경하시오.
 */
 struct 통장 {
     let 은행들: [은행] = [.신한은행, .국민은행, .카카오뱅크, .우리은행, .농협은행]
     let 은행들들 = 은행.allCases
 }

print(통장().은행들들)

/*
 3. 고차 함수를 이용하여 다음을 출력하시오.
 신한은행, 국민은행, 카카오뱅크, 우리은행, 농협은행
 */

print(은행.allCases
    .map{"\($0)"}
    .joined(separator: ", "))

/*
 4. 랜덤하게 은행을 출력해보시오.
 */
print(은행.allCases.randomElement()!)
은행.allCases.shuffled().first

struct Person1 {
    var name: String
    var age: Int
}

let person = Person1(name: "Alice", age: 30)

// KeyPath를 사용하여 name 프로퍼티에 접근
let nameKeyPath = \Person1.name
let name = person[keyPath: nameKeyPath]
print("Name: \(name)")  // 출력: Name: Alice


class A {
    let a: Int
    let b: String
    init(a: Int, b: String) {
        self.a = a
        self.b = b
    }
}

func calculateFunc() -> ((Int) -> Int) {

    var sum = 0
    
    func square(num: Int) -> Int {
        sum += (num * num)
        return sum
    }

    return square
}

var squareFunc = calculateFunc()
var func2 = calculateFunc()


/*
 struct A: Hashable {
     let a: Int
     let b: String
 }
 let a = A(a: 1, b: "1")
 let b = A(a: 1, b: "1")
 ### 문제

 위 **A**구조체는 Hashable프로토콜을 채택하고 있습니다.

 아래 3가지 비교문은 가능할까요? 가능하다면 답은 무엇일까요?

 - [x]  a == b:  `true` or `false`
 - [ ]  a > b:  `true` or `false`
 - [x]  a.hashValue == b.hashValue:  `true` or `false`
 
 -----
 class B {
     let a: Int
     let b: String
     init(a: Int, b: String) {
         self.a = a
         self.b = b
     }
 }
 let x = B(a: 1, b: "1")
 let y = B(a: 2, b: "2")
 
 아래 3가지 비교문이 모두 가능하려면 어떤 프로토콜을 채택해야할까요?

 - Comparable, Hashable

 채택하고 클래스 내부에 어떤 메서드를 구현해야 할까요?

 - [ ]  a == b
 - [ ]  a > b:
 - [ ]  a.hashValue == b.hashValue
 
 -------
 person.name과 person[keyPath: \Person.name]의 차이점은 무엇일까요?
 
 struct Person {
     var name: String
     var age: Int
 }

 let person = Person(name: "Alice", age: 30)

 // KeyPath를 사용하여 name 프로퍼티에 접근
 let nameKeyPath = \Person.name
 let name = person[keyPath: nameKeyPath]
 print("Name: \(name)")  // 출력: Name: Alice
 
 
 -------
 리팩토링 해보시오
 enum MyColor {
     case red
     case green
     case blue
     
     static var allColors: [MyColor] {
         return [.red, .green, .blue]
     }
 }

 let allColors = MyColor.allColors
 for color in allColors {
     print(color)
 }
 */
