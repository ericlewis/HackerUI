import SwiftUI
import HackerKit

public struct RootView: View {
    @ObservedObject var store = StoryStore()
    @State var showingFilter = false
    
    var title: String {
        store.filter.title
    }
    
    var trailingBarItem: some View {
        FilterButton(isVisible: $showingFilter)
    }
    
    public init() {
    }
    
    public var body: some View {
        VStack {
            if showingFilter {
                FilterSelector(filter: $store.filter)
            }
            StoryListView { story in
                StoryCell(story)
                    .showsStoryDetails(story)
            }
            .environmentObject(store)
        }
        .navigationBarTitle(title)
        .navigationBarItems(trailing: trailingBarItem)
    }
}
