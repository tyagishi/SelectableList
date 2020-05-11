//
//  SelectableList.swift
//  ClockClipSwiftUI
//
//  Created by Tomoaki Yagishita on 2020/03/20.
//  Copyright © 2020 SmallDeskSoftware. All rights reserved.
//

import SwiftUI

public struct SelectableList<T:Comparable & Hashable>: View {
    public var content:[T]
    public @Binding var selectedItem:T?
    public var rowCell:(T)-> Text
    public var selectionAction:(_ item: T)->Void
    public var body: some View {
        List {
            ForEach(content, id: \.self) { item in
                SelectableCell(item: item, selectedItem: self.$selectedItem,
                               rowCell: self.rowCell, selectionAction: self.selectionAction)
            }
        }
    }
}

public struct SelectableCell<T:Comparable> : View {
    public var item: T
    @Binding var selectedItem: T?
    public var rowCell:(T)->Text
    public var selectionAction:(_ selected: T)->Void

    public var body: some View {
        HStack {
            if ( item == selectedItem ) {
                Image(systemName: "checkmark").foregroundColor(.accentColor)
            }
            Spacer()
            self.rowCell(self.item)
            Spacer()
        } .onTapGesture {
            self.selectedItem = self.item
            self.selectionAction(self.item)
        }
    }
}

struct SelectableList_Previews: PreviewProvider {
    @State static var contentExample = ["test1", "test2"]
    @State static var selectedString:String? = "test1"
    static var previews: some View {
        SelectableList(content: contentExample, selectedItem: $selectedString, rowCell: { item -> Text in
            Text(item)
                }
            , selectionAction: { item in
                print("selected \(item)")
        })
    }
}
