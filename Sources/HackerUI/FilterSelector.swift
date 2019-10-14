import SwiftUI
import HackerKit

public struct FilterSelector: View {
    @Binding var filter: StoryList
    
    public init(filter: Binding<StoryList>) {
        _filter = filter
    }
    
    public var body: some View {
        VStack {
            Picker("Selected Filter", selection: $filter) {
                ForEach(StoryList.allCases) {
                    Text($0.title).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Divider()
        }
    }
}
