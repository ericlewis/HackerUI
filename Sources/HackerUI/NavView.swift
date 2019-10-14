import SwiftUI
import UIKit

public struct NavView<RootView: View>: UIViewControllerRepresentable {
    var rootView: () -> RootView
    
    public init(@ViewBuilder _ rootView: @escaping () -> RootView) {
        self.rootView = rootView
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        UINavigationController(rootViewController: UIHostingController(rootView: rootView()))
    }
    
    public func updateUIViewController(_ nc: UINavigationController, context: Context) {
        
    }
}
