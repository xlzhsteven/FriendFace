//
//  ContentView.swift
//  FriendFace
//
//  Created by Xiaolong Zhang on 8/24/20.
//  Copyright © 2020 Xiaolong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var people = [Person]()
    
    var body: some View {
        NavigationView {
            List(0..<people.count, id: \.self) { row in
                NavigationLink(destination: DetailView(person: self.people[row], people: self.people, friends: self.people[row].friends)) {
                    VStack(alignment: .leading) {
                        Text("\(self.people[row].name)")
                        Text("\(self.people[row].email ?? "")")
                    }
                }
            }.navigationBarTitle("People")
        }
        .onAppear(perform: loadData)
    }
    
    private func loadData() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard error == nil, let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decoded = try? decoder.decode([Person].self, from: data) {
                DispatchQueue.main.async {
                    self.people = decoded
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
