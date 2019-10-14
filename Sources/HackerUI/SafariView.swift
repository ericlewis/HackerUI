import SwiftUI
import SafariServices

public struct SafariView: UIViewControllerRepresentable {
    public var url: URL
    
    public init(url: URL) {
        self.url = url
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    public func updateUIViewController(_ vc: SFSafariViewController, context: Context) {
        vc.dismissButtonStyle = .close
        
        guard vc.delegate == nil else {
            return
        }
        
        vc.delegate = context.coordinator
    }
    
    public class Coordinator: NSObject, SFSafariViewControllerDelegate {
        var parent: SafariView 
        
        init(_ parent: SafariView) {
            self.parent = parent
        }
        
        public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
            guard let nc = controller.navigationController else {
                return controller.dismiss(animated: true, completion: nil)
            }
            
            nc.popViewController(animated: true)
        }
    }
}
