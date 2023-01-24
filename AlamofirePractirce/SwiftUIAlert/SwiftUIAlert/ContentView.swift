//
//  ContentView.swift
//  SwiftUIAlert
//
//  Created by song on 2022/12/30.
//

import SwiftUI

struct ContentView: View {
  
  @State var showAlert: Bool = false
  
  var body: some View {
    Home()
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct Home: View {
   
  @State var nativeAlert = false
  @State var customAlert = false
  @State var HUD = false
  @State var password = ""
  
  var body: some View {
    ZStack {
      VStack(spacing: 25) {
        Button(action: {
         alertView()
        },
               label: {
          Text("Native Alert With TextFields")
        })
        Text(password)
          .fontWeight(.bold)
        
        Button(action: {
          HUD.toggle()
        },
               label: {
          Text("HUD Progress View")
        })
        
        Text(password)
          .fontWeight(.bold)
        
        Button(action: {
          withAnimation(.easeInOut(duration: 0.5)) {
            customAlert.toggle()
          }
          
        },
               label: {
          Text("custom")
        })
        Text(password)
          .fontWeight(.bold)
      }
      
      if HUD {
        HUDProgressView(placeHolder: "Please Wait", show: $HUD)
          
      }
      
      if customAlert {
        CustomAlertView(isSuccess: true, show: $customAlert, completion: "이거임?")
      }
      
    }
    .edgesIgnoringSafeArea(.all)
  }
  
  func alertView() {
    let alert = UIAlertController(title: "Login",
                                   message: "Enter Your Password",
                                   preferredStyle: .alert)
    
    alert.addTextField { pass in
      pass.isSecureTextEntry = true
      pass.placeholder = "Password"
    }

    let login = UIAlertAction(title: "Login", style: .default) { _ in
      password = alert.textFields![0].text!
    }
    
    let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in
      //same .
    }
    
    alert.addAction(cancel)
    alert.addAction(login)
    
    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true) {
      
    }
  }
 }

struct HUDProgressView: View {
  
  var placeHolder: String
  @Binding var show: Bool
  @State var animate = false
  
  var body: some View {
    VStack(spacing: 28) {
      Circle()
        .stroke(AngularGradient(gradient: .init(colors: [Color.primary, Color.primary.opacity(0)]), center: .center))
        .frame(width: 80, height: 80 )
        .rotationEffect(.init(degrees: animate ? 360 : 0))
      
      Text(placeHolder)
        .fontWeight(.bold)
    }
    .padding(.vertical, 25)
    .padding(.horizontal, 35)
    .background(BlurView())
    .cornerRadius(20)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(
      Color.primary.opacity(0.35)
        .onTapGesture {
          withAnimation {
            show.toggle()
          }
        }
    )
    .onAppear {
      withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
        animate.toggle()
      }
    }
  }
}

struct BlurView: UIViewRepresentable {
  
  func makeUIView(context: Context) -> UIVisualEffectView {
    let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
    return view
  }
  
  func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
    
  }
}

struct CustomAlertView: View {
  let isSuccess: Bool
  @Binding var show: Bool
  let completion: String
  
  var body: some View {
    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
      VStack(spacing: 25) {
        Text(isSuccess ? "😃😃😃😃😃😃😃😃" : "😰😰😰😰😰😰😰")
        
        Text(isSuccess ? "성공했습니다!" : "실패했습니다ㅜ")
          .font(.title)
          .foregroundColor(isSuccess ? Color.blue : Color.red)
        
        Text(completion)
        
        Button(action: {
          withAnimation {
            show.toggle()
          }
        },
               label: {
          Text("확인")
            .foregroundColor(.white)
            .fontWeight(.bold)
            .padding(.vertical, 10)
            .padding(.horizontal, 25)
            .background(Color.orange)
            .clipShape(Capsule())
        })
      }
      .padding(.vertical, 25)
      .padding(.horizontal, 30)
//      .background(BlurView())
      .cornerRadius(25)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(
      Color.primary.opacity(0.35)
    )
  }
}
