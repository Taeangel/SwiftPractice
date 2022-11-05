//
//  ContentView.swift
//  keyboardPractice
//
//  Created by song on 2022/10/31.
//
  
import SwiftUI
  
class UIEmojiTextField: UITextField {
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override var textInputContextIdentifier: String? {
    return ""
  }
  
  override var textInputMode: UITextInputMode? {
    for mode in UITextInputMode.activeInputModes {
      if mode.primaryLanguage == "emoji" {
        self.keyboardType = .default
        return mode
      }
    }
    return nil
  }
}
  
struct EmojiTextField: UIViewRepresentable {
  @Binding var text: String
  
  func makeUIView(context: Context) -> UIEmojiTextField {
    let emojiTextField = UIEmojiTextField()
    emojiTextField.text = text
    emojiTextField.delegate = context.coordinator
    return emojiTextField
  }
  
  func updateUIView(_ uiView: UIEmojiTextField, context: Context) {
    uiView.text = text
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(parent: self)
  }
  
  class Coordinator: NSObject, UITextFieldDelegate {
    var parent: EmojiTextField
    
    init(parent: EmojiTextField) {
      self.parent = parent
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
      DispatchQueue.main.async { [weak self] in
        self?.parent.text = textField.text ?? ""
      }
    }
  }
}

struct EmojiContentView: View {
  @State private var text: String = ""
  
  var body: some View {
    EmojiTextField(text: $text)
  }
}
