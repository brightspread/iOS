//
//  ImagePicker.swift
//  InstagramSwiftUITutorial
//
//  Created by Leo on 2023/09/10.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable { // UIVC 를 SwiftUI의 View로 만듦

    @Binding var image: UIImage? // selectedImage와 연결
//    @Environment(\.presentationMode) var mode
    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    // ViewController의 변경사항을 다른 컨트롤러에 전달
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // 사용자가 이미지 선택할 때의 작업 처리하는 메서드
            guard let image = info[.originalImage] as? UIImage else { return }
            self.parent.image = image
//            self.parent.mode.wrappedValue.dismiss()
            self.parent.dismiss()
        }
    }
}
