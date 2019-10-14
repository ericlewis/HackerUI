import SwiftUI
import HackerKit

public struct StoryListView<Cell: View>: View {
    @EnvironmentObject var store: StoryStore
    var cell: (Story) -> Cell
    
    public init(cell: @escaping (Story) -> Cell) {
        self.cell = cell
    }
    
    public var body: some View {
        List {
            Section {
                ForEach(store.stories) {
                    self.cell($0)
                }
            }
        }
    }
}
