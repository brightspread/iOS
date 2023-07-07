//
//  GradeScreen.swift
//  QuizApp
//
//  Created by Leo on 2023/07/07.
//

import SwiftUI

struct QuizGradeScreen: View {
    
    @StateObject private var quizGradeVM = QuizGradeViewModel(networkService: NetworkServiceFactory.create())
    let submission: QuizSubmission
    let quiz: QuizViewModel
    @State private var startOver: Bool = false
    @Environment(\.rootPresentationMode) var rootPresentationMode
    
    var body: some View {
        VStack {
            Spacer()
            
            Spacer()
            Button("Start over") {
                rootPresentationMode.wrappedValue.dismiss()
            }
            
        }.navigationTitle(quiz.title)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                quizGradeVM.submitQuiz(submission: submission)
            }
    }
}

struct GradeScreen_Previews: PreviewProvider {
    static var previews: some View {
        let submission = QuizSubmission(quizId: 1)
        let quiz = QuizData.loadQuizes()[0]
        NavigationView {
            QuizGradeScreen(submission: submission, quiz: quiz)
        }
    }
}
