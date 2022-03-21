//
//  AddRowView.swift
//  ToDoList
//
//  Created by Kevin biecker on 3/16/22.
//

import SwiftUI

struct AddRowView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listData: ListData
    @State var textF: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            TextField("Type here...", text: $textF)
                .background(Color(.systemGray6))
                .padding(.horizontal, 4.0)

            
            Button("Save"){
                listData.addToList(title: textF)
                
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.top, 15.0)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        }
        .navigationTitle("New To Do")
    }
}

struct AddRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddRowView()
        }
        .environmentObject(ListData())
    }
}
