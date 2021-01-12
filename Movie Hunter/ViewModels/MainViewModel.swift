//
//  MainViewModel.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 12/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import Foundation

protocol MainViewModelDelegate {
    func reloadData(movie: CollectionViewCell)
}

class MainViewModel {
    
    // MARK: - Properties
    private let cliente: FilmeAPI
    var delegate: MainViewModelDelegate?
    
    // MARK: - Constructors
    init(client: FilmeAPI) {
        self.cliente = client
    }
    
    // MARK: - Methods
    var listaDeFilme: [Filme] = []
    func loadMovie() {
        FilmeAPI().recuperaFilmes { (listaDeFilme) in
            self.listaDeFilme = listaDeFilme
        }
    }
}
