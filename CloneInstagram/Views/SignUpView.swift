//
//  SignUpView.swift
//  CloneInstagram
//
//  Created by FX on 2021/09/08.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var profileImage: Image?
    @State private var pickedImage: Image?
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func loadImage() {
        guard let inputImage = pickedImage else { return }
        profileImage = inputImage
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(systemName: "camera")
                    .font(.system(size: 60, weight: .black, design: .monospaced))
                VStack(alignment: .leading) {
                    Text("Welcome")
                        .font(.system(size: 32, weight: .heavy))
                    Text("Sign Up To Start")
                        .font(.system(size: 16, weight: .medium))
                }
                
                VStack {
                    Group {
                        if profileImage != nil {
                            profileImage!
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 200, height: 200)
                                .padding(.top, 28)
                                .onTapGesture {
                                    self.showingActionSheet = true
                                }
                            
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                                .padding(.top, 28)
                                .onTapGesture {
                                    self.showingActionSheet = true
                                }
                        }
                    }
                }
                
                Group {
                    FormField(value: $username, icon: "person.fill", placeholder: "Username")
                    FormField(value: $email, icon: "envelope.fill", placeholder: "E-mail")
                    FormField(value: $password, icon: "lock.fill", placeholder: "Password", isSecure: true)
                }
                    
                Button(action: {}) {
                    Text("Sign Up")
                        .font(.title)
                        .modifier(ButtonModifiers())
                }
                
            }.padding()
        }.sheet(isPresented: $showingImagePicker, onDismiss: loadImage ){
            ImagePicker(pickedImage: self.$pickedImage, showImgagePicker: self.$showingImagePicker, imageData: self.$imageData)
        }.actionSheet(isPresented: $showingActionSheet){
            ActionSheet(title: Text(""), buttons: [.default(Text("Choose A Photo")) {
                self.sourceType = .photoLibrary
                self.showingImagePicker = true
            },
            .default(Text("Take A Photo")){
                self.sourceType = .camera
                self.showingImagePicker = true
            }, .cancel()
            
            ])
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
