import SwiftUI
import HackerKit

public struct UserView: View {
    var by: String
    @State var user: User?
    
    public init(_ by: String) {
        self.by = by
    }
    
    public var body: some View {
        Form {
            Section(header: Text("Information")) {
                Text(Formatters.count.string(for: user?.karma ?? 0) ?? "")
                if user?.created != nil {
                    Text(Formatters.relativeDate.localizedString(for: user!.created, relativeTo: Date()))
                }
            }
            Section {
                NavigationLink(destination: Text(user?.submitted.description ?? "no submissions")) {
                    HStack {
                        Text("Submissions")
                        Spacer()
                        Text(Formatters.count.string(for: user?.submitted.count ?? 0) ?? "")
                            .foregroundColor(.secondary)
                    }
                }
            }
            user?.about.map { about in
                Section(header: Text("About")) {
                    Text(about.decodingHTMLEntities())
                }
            }
        }
        .onReceive(HNAPI.shared.fetch(user: by).receive(on: RunLoop.main)) {
            self.user = $0
        }
    }
}
