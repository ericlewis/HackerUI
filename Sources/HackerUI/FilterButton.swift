import SwiftUI

public struct FilterButton: View {
    @Binding var isVisible: Bool
    
    public init(isVisible: Binding<Bool>) {
        _isVisible = isVisible
    }
    
    public var body: some View {
        Button(action: {
            withAnimation {
                self.isVisible.toggle()
            }
        }) {
            Image(systemName: "line.horizontal.3.decrease.circle\(isVisible ? ".fill" : "")")
                .imageScale(.large)
                .padding([.vertical, .leading])
        }
    }
}
