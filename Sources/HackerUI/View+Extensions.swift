import SwiftUI
import HackerKit

public extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
    
    func leadingSymbol(name: String, spacing: CGFloat? = 5, scale: Image.Scale = .small) -> some View {
        HStack(spacing: spacing) {
            Image(systemName: name)
                .imageScale(scale)
            self
        }
    }
    
    func showsStoryDetails(_ story: Story) -> some View {
        NavigationLink(destination: StoryDetailView(story).environmentObject(CommentStore())) {
            self
        }
    }
    
    func showURLOrDetail(_ story: Story) -> some View {
        guard let url = story.url else {
            return showsStoryDetails(story)
                .eraseToAnyView()
        }
        
        return ModifiedContent(content: self, modifier: SafariModifier(url)).eraseToAnyView()
    }
}

public struct SafariModifier: ViewModifier {
    var url: URL
    @State var showing = false
    
    public init(_ url: URL) {
        self.url = url
    }
    
    public func body(content: Content) -> some View {
        UIDevice.current.userInterfaceIdiom != .pad ? NavigationLink(destination: SafariView(url: url)) {
            content
        }
        .eraseToAnyView() : Button(action: {
            self.showing = true
        }) {
            content
            .sheet(isPresented: $showing) {
                SafariView(url: self.url)
            }
        }
        .eraseToAnyView()
    }
}
