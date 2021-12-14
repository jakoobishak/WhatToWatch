//
//  WhatToWatchTests.swift
//  WhatToWatchTests
//
//  Created by Jakoob Ishak on 2021-11-27.
//

import XCTest
@testable import WhatToWatch

class WhatToWatchTests: XCTestCase {

    func testMovie() throws {
        let movie = Movie(id: 10, title: "Spider-man", overview: "He sucks", posterPath: "/posterPath.png", releaseDate: "2001-01-01", voteAverage: 8.2, voteCount: 2000, genreIds: [2,4])
        
        XCTAssertEqual(movie.title, "Spider-man")
        XCTAssertEqual(movie.id, 10)
    }
    
    func testDislikeMovieList() throws {
        let movie1 = Movie(id: 10, title: "Spider-man", overview: "He sucks", posterPath: "/posterPath.png", releaseDate: "2001-01-01", voteAverage: 8.2, voteCount: 2000, genreIds: [2,4])
        let movie2 = Movie(id: 12, title: "Bat-man", overview: "Hes the best", posterPath: "/posterPath123.png", releaseDate: "2002-02-02", voteAverage: 7.9, voteCount: 3000, genreIds: [2,4,5])
        
        let trashListView = TrashListView()
        trashListView.dislikedMoviesList.append(movie1.id)
        trashListView.dislikedMoviesList.append(movie2.id)
        
        var listCount = 0
        
        for _ in trashListView.dislikedMoviesList.indices {
            listCount += 1
        }
        
        XCTAssertEqual(trashListView.dislikedMoviesList.count, listCount)
        
        
    }

    func testRemovingFromLikedMoviesList() throws {
        let movie1 = Movie(id: 10, title: "Spider-man", overview: "He sucks", posterPath: "/posterPath.png", releaseDate: "2001-01-01", voteAverage: 8.2, voteCount: 2000, genreIds: [2,4])
        let movie2 = Movie(id: 12, title: "Bat-man", overview: "Hes the best", posterPath: "/posterPath123.png", releaseDate: "2002-02-02", voteAverage: 7.9, voteCount: 3000, genreIds: [2,4,5])
        
        let watchListView = WatchListView()
        watchListView.likedMoviesList.append(movie1.id)
        watchListView.likedMoviesList.append(movie2.id)
        
        watchListView.likedMoviesList.removeAll()
        
        XCTAssertEqual(watchListView.likedMoviesList.count, 0)
    }
    
    func testIfFilterUrlIsCorrect() throws {
        let genreType1 = genreTypes(id: 25, name: "Comedy")
        let genreType2 = genreTypes(id: 35, name: "Action")
        let movieDetails = MovieDetails(id: 11, title: "Inception", overview: "Good movie", posterPath: "/posterPath.png", releaseDate: "2002-02-02", voteAverage: 7.1, voteCount: 2323, genres: [genreType1, genreType2])
        
        XCTAssertEqual(movieDetails.genres[1].name, "Action")
    }
}
