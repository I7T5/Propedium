/*
Reference: https://developer.apple.com/documentation/swiftdata/adding-and-editing-persistent-data-in-your-app
See the AppleLicense.txt file for this sample’s licensing information.
*/

import SwiftUI
import SwiftData

struct DiemEditor: View {
    let diem: Diem?
    
    private var editorTitle: String {
        diem == nil ? "New Diem" : "Edit Diem"
    }
    
    private var confirmationText: String {
        diem == nil ? "Add" : "Done"
    }
    
    @State private var name = ""
    @State private var date = Date()
    
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df
    }()
    
    @State private var showsDatePicker: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                HStack {
                    Text("Date")
                    Spacer()
                    
                    // Mock compact DatePicker view
                    // I wish DatePicker could work as a label
                    // TODO: toggle only on clicking date view, not the whole HStack
                    Button {
                        // TODO: remove foregroundStyle
                        // TODO: Make DatePicker animation duration shorter
                        withAnimation {
                            showsDatePicker.toggle()
                        }
                    } label: {
                        Text(date, formatter: dateFormatter)
                            .foregroundStyle(showsDatePicker ? .accent : .black)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 7.5)
                            .background(.fill.tertiary)
                            .containerShape(.rect(cornerRadius: 7.5))
                    }
                }
                
                if showsDatePicker {
                    DatePicker("Date",
                               selection: $date,
                               displayedComponents: [.date])
                    .datePickerStyle(.graphical)

                }
                
                // TODO: Repeat picker
                
                // TODO: Tags section like Apple Reminders
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(editorTitle)
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button(confirmationText) {
                        withAnimation {
                            save()
                            dismiss()
                        }
                    }
                    .disabled(name == "")
                    // TODO: disable when no value is changed
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
            .onAppear {
                if let diem {
                    // Edit the incoming diem.
                    name = diem.name
                    date = diem.date
                }
            }
            #if os(macOS)
            .padding()
            #endif
        }
    }
    
    private func save() {
        if let diem {
            // Edit the diem.
            diem.name = name
            diem.date = date
        } else {
            // Add an diem.
            let newDiem = Diem(name: name, date: date)
            modelContext.insert(newDiem)
        }
    }
}

#Preview("Add diem") {
    ModelContainerPreview(ModelContainer.sample) {
        DiemEditor(diem: nil)
    }
    
//    DiemEditorSheet(diem: nil)
//        .modelContainer(previewContainer)
}

#Preview("Edit diem") {
    ModelContainerPreview(ModelContainer.sample) {
        DiemEditor(diem: .newYear)
    }
    
//    DiemEditorSheet(diem: .christmas)
//        .modelContainer(previewContainer)
}
