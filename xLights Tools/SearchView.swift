//
//  SearchView.swift
//  xLights Companion Pro
//
//  Created by Jayden Irwin on 2021-01-30.
//

import SwiftUI
import Combine

struct SearchView: View {
    
    @ObservedObject var searchModel = SearchModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("Search songs", text: $searchModel.searchText)
                    .padding(7)
                    .padding(.horizontal, 28)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                    , alignment: .leading)
                    .overlay(
                        Button(action: {
                            searchModel.searchText = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        })
                    , alignment: .trailing)
                    .padding(.horizontal, 10)
                if searchModel.searchText == "" {
                    Spacer()
                    Text("Suggestions")
                        .font(.headline)
                    Button("Santa Baby", action: {
                        searchModel.searchText = "Santa Baby"
                    })
                        .foregroundColor(Color.accentColor)
                    Button("We Wish You A Merry Christmas", action: {
                        searchModel.searchText = "We Wish You A Merry Christmas"
                    })
                        .foregroundColor(Color.accentColor)
                    Button("Jingle Bells", action: {
                        searchModel.searchText = "Jingle Bells"
                    })
                        .foregroundColor(Color.accentColor)
                    Button("Deck The Halls", action: {
                        searchModel.searchText = "Deck The Halls"
                    })
                        .foregroundColor(Color.accentColor)
                    Button("Winter Wonderland", action: {
                        searchModel.searchText = "Winter Wonderland"
                    })
                        .foregroundColor(Color.accentColor)
                    Spacer()
                } else {
                    if searchModel.results.isEmpty && searchModel.doneSearching {
                        Spacer()
                        Text("No results")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                        Spacer()
                    } else if searchModel.results.isEmpty && !searchModel.doneSearching {
                        Spacer()
                        ProgressView()
                            .scaleEffect(1.5)
                        Spacer()
                    } else {
                        List {
                            ForEach(searchModel.results) { result in
                                Link(result.title, destination: URL(string: result.url)!)
                            }
                        }
                        
                    }
                }
            }
            .navigationTitle("Song Search")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tabItem { Label("Search", systemImage: "music.note.list") }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

class SearchModel: ObservableObject {
    
    var subscription: Set<AnyCancellable> = []
    
    @Published private (set) var results: [SongResult] = []
    
    @Published var searchText: String = ""
    
    @Published var doneSearching = false
    
    // MARK:- Initiliazer for product via model.
    
    init() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main) // debounces the string publisher, such that it delays the process of sending request to remote server.
            .map({ (string) -> String? in
                if string.isEmpty {
                    self.results = []
                    return nil
                }
                return string.trimmingCharacters(in: .whitespacesAndNewlines)
            }) // prevents sending numerous requests and sends nil if the count of the characters is less than 1.
            .removeDuplicates()
            .compactMap{ $0 } // removes the nil values so the search string does not get passed down to the publisher chain
            .sink { (_) in
                //
            } receiveValue: { [self] (searchField) in
                searchItems(searchText: searchField)
            }.store(in: &subscription)
    }
    
    
    private func searchItems(searchText: String) {
        doneSearching = false
        var request = URLRequest(url: URL(string: "https://mysterious-coast-36838.herokuapp.com/feed/p")!)
        request.httpMethod = "POST"
        let params: [String: Any] = ["title": searchText]
        request.httpBody = try! JSONSerialization.data(withJSONObject: params)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  error == nil else {                                              // check for fundamental networking error
                print("error", error ?? "Unknown error")
                return
            }
            
            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
            
            do {
                let songs = try JSONDecoder().decode(Results.self, from: data)
                DispatchQueue.main.async {
                    self.results = songs.results
                    self.doneSearching = true
                }
            } catch {
                print("no results")
            }
        }
        task.resume()
    }
}

struct Results: Codable {
    var results: [SongResult]
}

struct SongResult: Identifiable, Codable {
    let _id: String
    var id: String {
        _id
    }
    let baseUrl: String
    let title: String
    let url: String
}
