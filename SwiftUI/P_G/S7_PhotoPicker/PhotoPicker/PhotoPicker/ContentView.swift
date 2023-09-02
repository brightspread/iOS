//
//  ContentView.swift
//  PhotoPicker
//
//  Created by Leo on 2023/09/02.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State var isPresentPicker = false
    @State var images = [UIImage]()
    
    var body: some View {
        VStack {
            Button("Select Images") {
                isPresentPicker = true
            }
            
            List {
                ForEach(images, id:\.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)) // 좌우 인셋
                }
            }.listStyle(.plain) // default는 모서리 둥근 형태
        }
        .sheet(isPresented: $isPresentPicker) {
            // Picker
            ImagePicker(isPresent: $isPresentPicker, images: $images)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isPresent: Bool
    @Binding var images: [UIImage]
    
    func makeCoordinator() -> Coordinator { // delegate 같은거 연결
        return ImagePicker.Coordinator(picker: self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        var config = PHPickerConfiguration()
        config.selectionLimit = 0 // 0은 여러개 띄우기
        config.filter = .images // 이미지만. 동영상X
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator

        return picker
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
        
        var picker: ImagePicker
        
        init(picker: ImagePicker) {
            self.picker = picker
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            self.picker.isPresent = false // 피킹 완료
            
            for img in results {
                if img.itemProvider.canLoadObject(ofClass: UIImage.self) { // 이미지 못불러오는 것도 있어서 canLoadObject 해야함
                    img.itemProvider.loadObject(ofClass: UIImage.self) { (loadedImage, error) in
                        guard let hasImage = loadedImage else {
                            print("empty Image")
                            return
                        }
                        self.picker.images.append(hasImage as! UIImage)
                    }
                } else {
                    print("fail to loaded")
                }
            }
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // 안쓰는 코드. 프로토콜땜에 만듦
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
