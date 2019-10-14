import SwiftUI
import HackerKit

public struct CommentListView<Header: View, Cell: View>: View {
    var kids: [Int]?
    var header: (() -> Header)?
    var text: Text?
    var cell: (Comment) -> Cell
    
    @EnvironmentObject var store: CommentStore
    
    public init(_ kids: [Int]? = nil, header: (() -> Header)? = nil, text: Text?, cell: @escaping (Comment) -> Cell) {
        self.kids = kids
        self.header = header
        self.text = text
        self.cell = cell
    }
    
    func appeared() {
        store.fetchComments(ids: kids)
    }
    
    public var body: some View {
        List {
            Section {
                header?()
                if text != nil {
                    text.padding(.vertical)
                }
                ForEach(store.comments) {
                    self.cell($0)
                }
            }
        }
        .onAppear(perform: appeared)
    }
}
