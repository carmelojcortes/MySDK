import SwiftUI
import NukeUI
import MySDKCore

public struct AppUserView: View {
    
    @State var user: AppUser = .init(name: "Pepe")
    
    public var body: some View {
        VStack(alignment: .center) {
            Image(resource: "locked_bg_1")
            Text("Hola soy \(user.name)")
            Button {
                user.printName()
                performFeedback()
            } label: {
                Text(resource: "button.text")
                    .foregroundColor(Color(resource: "myAccent"))
            }
            LazyImage(url: URL(string: "https://images.pexels.com/photos/708440/pexels-photo-708440.jpeg"))
            .processors([.resize(width: UIScreen.main.bounds.width)])
            .animation(.linear(duration: 0.3))
        }
    }
    
    private func performFeedback() {
        HapticPlayer.shared.playHaptic(pattern: .selected)
    }
}
