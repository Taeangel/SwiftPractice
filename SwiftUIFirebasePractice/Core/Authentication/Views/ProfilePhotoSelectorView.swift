//
//  ProfilePhotoSelectorView.swift
//  SwiftUIFirebasePractice
//
//  Created by song on 2023/01/27.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
  @State private var showImagePicker = false
  @State private var seletedImage: UIImage?
  @State private var profileImage: Image?
  @EnvironmentObject var viewModel: AuthViewModel
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    VStack {
      AuthenticationHeaderView(title1: "Setup account",
                               title2: "Add a profile photo")
      .padding(.bottom, 20)
      
      Button(action: {
        showImagePicker.toggle()
      },
             label: {
        if let profileImage = profileImage {
          profileImage
            .resizable()
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
        } else {
          Image("plusButton")
            .resizable()
            .renderingMode(.template)
            .scaledToFill()
            .frame(width: 180, height: 180)
        }
      })
      .sheet(isPresented: $showImagePicker,
             onDismiss: loadImage) {
        ImagePicker(selectedImage: $seletedImage)
      }
      
      if let seletedImage {
        Button {
          viewModel.uploadProfileImage(seletedImage)
          presentationMode.wrappedValue.dismiss()
        } label: {
          Text("Continue")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 340, height: 50)
            .background(Color(.systemBlue))
            .clipShape(Capsule())
            .padding()
        }
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
      }
      
      Spacer()
    }
    .ignoresSafeArea()
  }
  
  func loadImage() {
    guard let seletedImage = seletedImage else { return }
    profileImage = Image(uiImage: seletedImage)
  }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
  static var previews: some View {
    ProfilePhotoSelectorView()
  }
}
