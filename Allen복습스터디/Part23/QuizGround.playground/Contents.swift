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
