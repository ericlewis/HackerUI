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
        
        return NavigationLink(destination: SafariView(url: url)) {
            self
        }
        .eraseToAnyView()
    }
}
