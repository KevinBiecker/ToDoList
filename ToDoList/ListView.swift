//
//  ListView.swift
//  ToDoList
//
//  Created by Kevin biecker on 3/14/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listData: ListData
    
    var body: some View {
        VStack {
            Text("Things To Do")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 4.0)
                .controlSize(.large)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 80, alignment: .center)
                .foregroundColor(Color.white)
                .background(Color.blue)

            List {
                ForEach(listData.items){ item in
                    RowView(item: item)
                }
            }
            .background(Color.orange)
            .navigationBarItems(trailing: NavigationLink("Add", destination: AddRowView()).foregroundColor(Color.white))
            
            Spacer()
            
        }
        .background(Color.yellow.opacity(0.6))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListData())
    }
}

