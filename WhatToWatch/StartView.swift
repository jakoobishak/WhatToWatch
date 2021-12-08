//
//  ContentView.swift
//  WhatToWatch
//
//  Created by Jakoob Ishak on 2021-11-27.
//

import SwiftUI
import CoreData

struct StartView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    //@FetchRequest(
    //    sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    //    animation: .default)
    //private var items: FetchedResults<Item>
    
    @StateObject var movieModel = MovieModel()
    @StateObject var genreModel = GenreModel()
    
    
    var body: some View {
        NavigationView {

            VStack{
                
               /* Button{
                    //movieModel.changeMoviesPage()
                    //movieModel.remote.fetch()
                   
                } label: {
                    Text("Start swiping")
                }*/

                if let movies = movieModel.remote.data?.results {
                    ForEach(movies) { index in
                        NavigationLink(destination: MainView(movie: index)) {
                            Text("Start swiping")
                        }
                    }
                        
                }
            }
            .onAppear {
                movieModel.remote.fetch()
                genreModel.remote.fetch()
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            //newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
           // offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
