import SwiftUI
import HackerKit

public struct StoryDetailView: View {
    var story: Story
    
    public init(_ story: Story) {
        self.story = story
    }
    
    public var body: some View {
        CommentListView(story.kids, header: {
            HStack {
                StoryCell(self.story)
                    .padding(.vertical)
                Spacer()
            }
            .showURLOrDetail(self.story)
        }, text: story.text.map {
            Text($0.decodingHTMLEntities())
        }) {
            CommentCell($0)
        }
        .navigationBarTitle(story.type.title)
    }
}
