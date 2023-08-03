//
//  QuizAppUnitTests.swift
//  QuizAppUnitTests
//
//  Created by Leo on 2023/07/07.
//

import XCTest
@testable import QuizApp


final class 퀴즈가_로딩_될_때: XCTestCase {
    func test_전체_점수가_정확하게_계산되어야함() {
        let quizesDTOs = QuizData.loadQuizDTOs()
        let quizes = quizesDTOs.map(Quiz.init)
        
        let mathQuiz = quizes.first {
            $0.quizId == 1
        }!
        
        XCTAssertEqual(3, mathQuiz.questions.count)
        XCTAssertEqual(30, mathQuiz.totalPoints)
    }
}

class 점수를_계산할_때: XCTestCase {
   
    lazy var gradeASubmission: QuizSubmission = {
        var studentSubmission = QuizSubmission(quizId: 1)
        studentSubmission.addChoice(questionId: 1, choiceId: 2)
        studentSubmission.addChoice(questionId: 2, choiceId: 3)
        studentSubmission.addChoice(questionId: 3, choiceId: 4)
        return studentSubmission
    }()
    
    lazy var gradeBSubmission: QuizSubmission = {
        var studentSubmission = QuizSubmission(quizId: 1)
        studentSubmission.addChoice(questionId: 1, choiceId: 1)
        studentSubmission.addChoice(questionId: 2, choiceId: 3)
        studentSubmission.addChoice(questionId: 3, choiceId: 4)
        return studentSubmission
    }()

    lazy var gradeFSubmission: QuizSubmission = {
        var studentSubmission = QuizSubmission(quizId: 1)
        studentSubmission.addChoice(questionId: 1, choiceId: 4)
        studentSubmission.addChoice(questionId: 2, choiceId: 2)
        studentSubmission.addChoice(questionId: 3, choiceId: 1)
        return studentSubmission
    }()

    func test_점수에_맞게_등급이_나와야함() {
        let quizesDTOs = QuizData.loadQuizDTOs()
        let quizes = quizesDTOs.map(Quiz.init)
        
        let mathQuiz = quizes.first {
            $0.quizId == 1
        }!
        
        XCTAssertEqual("A", mathQuiz.calculateLetterGrade(score: 90))
        XCTAssertEqual("B", mathQuiz.calculateLetterGrade(score: 72))
        XCTAssertEqual("F", mathQuiz.calculateLetterGrade(score: 42))
    }
    
    func test_답안지에_맞게_등급이_나와야_함() {
        let quizesDTOs = QuizData.loadQuizDTOs()
        let quizes = quizesDTOs.map(Quiz.init)
        
        let mathQuiz = quizes.first {
            $0.quizId == 1
        }!
    
        XCTAssertEqual("A", mathQuiz.grade(submission: gradeASubmission).letter)
        XCTAssertEqual("B", mathQuiz.grade(submission: gradeBSubmission).letter)
        XCTAssertEqual("F", mathQuiz.grade(submission: gradeFSubmission).letter)
    }
    
}
