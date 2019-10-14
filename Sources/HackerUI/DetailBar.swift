import SwiftUI

public struct DetailBar: View {
    var score: Int? = nil
    var by: String? = nil
    var numberOfComments: Int? = nil
    var time: Date? = nil
    var url: URL? = nil
    
    public init(score: Int? = nil, by: String? = nil, numberOfComments: Int? = nil, time: Date? = nil, url: URL? = nil) {
        self.score = score
        self.by = by
        self.numberOfComments = numberOfComments
        self.time = time
        self.url = url
    }
    
    func Item(_ title: String?, _ symbolName: String) -> some View {
        HStack {
            Text(title ?? "")
                .lineLimit(1)
                .truncationMode(.middle)
                .leadingSymbol(name: symbolName)
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
    }
    
    var Score: some View {
        score.map { score in
            Item(Formatters.count.string(for: score), "arrow.up")
        }
    }
    
    @State var showingUser = false
    
    func showUser() {
        showingUser.toggle()
    }
    
    var By: some View {
        by.map { by in
            Item(by, "person")
                .onTapGesture(perform: showUser)
                .sheet(isPresented: $showingUser) {
                    NavView {
                        UserView(by)
                            .navigationBarTitle(by)
                            .navigationBarItems(trailing: Button(action: self.showUser) {
                                Text("Done")
                                    .padding([.leading, .vertical])
                            })
                    }
            }
        }
    }
    
    var Comments: some View {
        numberOfComments.map {
            Item(Formatters.count.string(for: $0), "bubble.left")
        }
    }
    
    var Time: some View {
        time.map {
            Item(Formatters.relativeDate.localizedString(for: $0, relativeTo: Date()), "clock")
        }
    }
    
    var Domain: some View {
        url.map {
            Item($0.host?.replacingOccurrences(of: "www.", with: ""), "safari")
        }
    }
    
    public var body: some View {
        HStack(spacing: 10) {
            Score
            By
            Comments
            Time
            Domain
        }
    }
}
