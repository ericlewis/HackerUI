import SwiftUI
import HackerKit

public struct StoryCell: View {
    var story: Story
    
    public init(_ story: Story) {
        self.story = story
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(story.title)
                .font(.headline)
                .foregroundColor(.primary)
            DetailBar(score: story.score,
                      by: story.by,
                      numberOfComments: story.descendants,
                      time: story.time,
                      url: story.url)
        }
    }
}
