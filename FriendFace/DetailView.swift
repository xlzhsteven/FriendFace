//
//  DetailView.swift
//  FriendFace
//
//  Created by Xiaolong Zhang on 8/24/20.
//  Copyright © 2020 Xiaolong. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let person: Person
    let people: [Person]
    var friendCount: Int {
        person.friends?.count ?? 0
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("ID: \(person.id)")
            Text("Address: \(person.address ?? "")")
            Text("Registered: \(dateString(from: person.registered))")
            Text("Tags: \(person.tags?.joined(separator: ", ") ?? "")")
            friendsView
        }.padding()
            .navigationBarTitle(Text("\(person.name)"), displayMode: .inline)
    }
    
    private func getDetail(from id: String) -> Person? {
        people.first(where: { $0.id == id })
    }
    
    private func getPerson(from row: Int) -> Person {
        let id = self.person.friends![row].id
        return getDetail(from: id)!
    }
    
    
    private var friendsView: some View {
        List(0..<friendCount, id: \.self) { row in
            NavigationLink(destination: DetailView(person: self.getPerson(from: row), people: self.people)) {
                VStack(alignment: .leading) {
                    Text("\(self.getPerson(from: row).name)")
                    Text("\(self.getPerson(from: row).email ?? "")")
                }
            }
        }
    }
    
    private func dateString(from date: Date?) -> String {
        guard let date = date else { return "" }
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(person: Person(id: "", name: "", isActive: nil, age: nil, company: nil, email: nil, address: nil, about: nil, registered: nil, tags: nil, friends: nil), people: [Person]())
    }
}
