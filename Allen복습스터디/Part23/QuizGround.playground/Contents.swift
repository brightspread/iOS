import UIKit

/*
 Leo 문제1
 /*
  1) 아래 코드가 한 파일에 있다면, 컴파일이 될까? (swift3, 4)
  2) extension 코드를 파일 분리한다면, 컴파일이 될까?
  
  struct 회사 {
      private let 이름: String
  }
  
  extension 회사: Equatable {
      static func ==(lhs: 회사, rhs: 회사) -> Bool {
          return lhs.이름 == rhs.이름
      }
  }

  ref : https://post.naver.com/viewer/postView.nhn?volumeNo=8201552&memberNo=37948224
  https://github.com/apple/swift-evolution/blob/main/proposals/0169-improve-interaction-between-private-declarations-and-extensions.md
  */

 */

/*
 Leo 문제2
 - 접근 제어 변경을 통해, 컴파일 에러를 수정해보시오.
 파일 구성

 Playground

 - Contents.swift
 - Sources
     - 사람.swift (다른 모듈)
 
 Contents.swift

         let 사람1 = 사람(name: "레오")
         print(사람1.name)

         class 학생: 사람 {
             var 학점: String
             
             init(name: String, 학점: String) {
                 self.학점 = 학점
                 super.init(name: name)
             }
             
             override func printDescription() {
                 print("\(super.name) : \(학점)")
             }
         }

         let 학생1 = 학생(name: "레오", 학점: "A")
         학생1.printDescription()
 
 사람.swift
 
         import Foundation

         class 사람 {
             var name: String = ""
             
             init(name: String) {
                 self.name = name
             }

                 func printDescription() {
                 print(name)
             }
         }
 
 */


let 사람1 = 사람(name: "레오")
print(사람1.name)

class 학생: 사람 {
    var 학점: String
    
    init(name: String, 학점: String) {
        self.학점 = 학점
        super.init(name: name)
    }
    
    override func printDescription() {
        print("\(super.name) : \(학점)")
    }
}

let 학생1 = 학생(name: "레오", 학점: "A")
학생1.printDescription()

/*
 Jimmy
 1. 아래 클래스의 프로퍼티를 한 줄로 요약해보세요
 class SomeClass1 {
     private var _name = "이름"
     
     var name: String {
         return _name
     }
 }
 
 2. Substring의 COW(Copy On Write)
 var greeting = "Hello World"

 let word = greeting.prefix(5) //1.이 때 word는 메모리를 차지하고 있을까요?

 greeting = "Jimmy Hello" //2. 이 때 word의 메모리는 어떤 상태일까요?
 
 3.어떤 에러가 발생하고 왜 에러가 발생하는지 메모리 관점에서 설명해보세요
 extension SomeCalculateClass {
         let getName: String {
                 return "이름"
         }
 }
 
 
 
 */

/*
 Elly
 1. 아래 코드가 정상적으로 동작하도록 코드를 수정해보세요.
 class ViewModel {
     private var id: Int = 5
 }

 class ViewController {
     
     let viewModel: ViewModel = ViewModel()

     func viewDidLoad() {
         super.viewDidLoad()
         
         // 아래 코드가 정상적으로 동작하도록 코드를 수정해보세요. (모든 코드 변경 가능)
         print(viewModel.id) // 5
     }
 }
 
 
 2. “010-1234-5678” 전화번호의 - 를 제거하는 코드와,
    01012345678 전화번호에 4번째, 8번째 자리에 -를 추가하는 코드를 만들어보세요
 
 let phoneNumber: String = "010-1234-5678"

 // 010-1234-5678 -> 01012345678

 // 01012345678 -> 010-1234-5678
 ----------------------------
 */
