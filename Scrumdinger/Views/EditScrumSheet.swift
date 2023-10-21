//
//  EditScrumSheet.swift
//  Scrumdinger
//
//  Created by Emir Safa Yavuz on 25.10.2023.
//

import SwiftUI

struct EditScrumSheet: View {
    @State private var editingScrum = DailyScrum.emptyScrum
    @Binding var scrum: DailyScrum
    @Binding var isPresentingEditView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $editingScrum)
                .navigationTitle(scrum.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingEditView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresentingEditView = false
                            scrum = editingScrum
                        }
                    }
                }
        }
    }
}

#Preview {
    EditScrumSheet(scrum: .constant(DailyScrum.sampleData[0]), isPresentingEditView: .constant(true))
}
