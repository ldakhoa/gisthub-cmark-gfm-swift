//
//  NestedSwiftUIView.swift
//  Example
//
//  Created by Khoa Le on 31/12/2022.
//

import SwiftUI
import GistHubMarkdownPreview

struct NestedSwiftUIView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading) {
                ForEach(mocks, id: \.name) { mock in
                    ViewThatFits(in: .vertical) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(mock.name)
                                Text("Test subtitle")
                            }
                            MarkdownPreviewView(markdown: mock.content)
                        }
                    }

                }
            }
        }
        .frame(maxWidth: .infinity)
    }

    struct Mock {
        let name: String
        let content: String
    }

    private let mocks = [
        Mock(name: "Test 1", content: "# h1\n## h2\n### h3\n#### h4\n##### h5\n###### h6"),
        Mock(name: "Test 2", content: "# h1\n## h2\n### h3\n#### h4\n##### h5\n###### h6"),
        Mock(name: "Test 3", content: "# h1\n## h2\n### h3\n#### h4\n##### h5\n###### h6"),
        Mock(name: "Test 4", content: "# h1\n## h2\n### h3\n#### h4\n##### h5\n###### h6"),
        Mock(name: "Test 5", content: "# h1\n## h2\n### h3\n#### h4\n##### h5\n###### h6"),
    ]
}

struct NestedSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NestedSwiftUIView()
    }
}
