import SwiftUI
import HackerKit

public struct CommentCell: View {
    var comment: Comment
    
    @State var viewingMore = false
    
    public init(_ comment: Comment) {
        self.comment = comment
    }
    
    var text: String {
        comment.text.decodingHTMLEntities()
            .replacingOccurrences(of: "<p>", with: "\n\n")
            .replacingOccurrences(of: "<\\p>", with: "")
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            DetailBar(by: comment.by,
                      time: comment.time)
            Text(text)
                .padding(.bottom, 5)
                .foregroundColor(.primary)
            comment.kids.map { kids in
                MoreCommentsView(kids)
            }
        }
    }
}
