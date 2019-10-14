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
    
    func setFilter(_ filter: StoryList) -> () -> Void {
        {
            self.store.filter = filter
        }
    }
    
    public var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return VStack {
                FilterSelector(filter: $store.filter)
                StoryListView { story in
                    StoryCell(story)
                        .showsStoryDetails(story)
                }
                .environmentObject(store)
            }
            .navigationBarTitle(title)
            .eraseToAnyView()
        } else {
            return StoryListView { story in
                StoryCell(story)
                    .showsStoryDetails(story)
            }
            .actionSheet(isPresented: $showingFilter) {
                ActionSheet(title: Text("Stories"), message: nil, buttons: StoryList.allCases.map { list -> ActionSheet.Button in
                    .default(Text(list.title), action: setFilter(list))
                } + [.cancel()])
            }
            .environmentObject(store)
            .navigationBarTitle(title)
            .navigationBarItems(trailing: trailingBarItem)
            .eraseToAnyView()
        }
    }
}
