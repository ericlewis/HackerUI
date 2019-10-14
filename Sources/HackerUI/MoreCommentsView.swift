import SwiftUI
import HackerKit

public struct MoreCommentsView: View {
    @ObservedObject var store = CommentStore()
    var kids: [Int]
    
    public init(_ kids: [Int]) {
        self.kids = kids
    }
    
    func showMore() {
        self.store.fetchComments(ids: self.kids)
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            ForEach(store.comments) {
                CommentCell($0)
                    .padding(.leading)
            }
            if store.comments.isEmpty {
                VStack {
                    Divider()
                        .padding(.trailing, -25)
                    HStack {
                        Text((Formatters.count.string(for: kids.count) ?? "") + (kids.count == 1 ? " more reply" : " more replies"))
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    .foregroundColor(.accentColor)
                    .padding(.bottom, 3)
                }
                .onTapGesture(perform: showMore)
                .padding(.leading)
            }
        }
    }
}
