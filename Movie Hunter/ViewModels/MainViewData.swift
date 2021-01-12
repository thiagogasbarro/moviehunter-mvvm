//
//  MainViewData.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 12/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

protocol MovieViewDataType {
    var titleMovie: String { get }
    var description: String { get }
    var posterMovie: String { get }
    var backgroundMovie: String { get }
}

class MovieViewData {
    
    // MARK: - Properties
    private let model: Filme
    
    // MARK: - Constructors
    init(model: Filme) {
        self.model = model
    }
}

extension MovieViewData: MovieViewDataType {
    var description: String {
        return model.overview!
    }
    
    var posterMovie: String {
        return model.posterPath
    }
    
    var backgroundMovie: String {
        return model.backdropPath!
    }
    
    var titleMovie: String {
        return model.title!
    }
    

}
