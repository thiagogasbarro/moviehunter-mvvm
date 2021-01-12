//
//  MainViewController.swift
//  Movie Hunter
//
//  Created by Thiago Gasbarro Jesus on 12/01/21.
//  Copyright © 2021 Thiago Gasbarro Jesus. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var listaDeFilme: [Filme] = []
    @IBOutlet weak var collectionFilmes: UICollectionView!
    
    // MARK: - Visual Elements
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaDeFilme.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "filmeCell", for: indexPath) as! CollectionViewCell
        
        let filmeAtual = listaDeFilme[indexPath.item]
        celulaFilme.configuraCelula(filmeAtual)
    
        return celulaFilme
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filme = listaDeFilme[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalheFilme") as! DetalhesViewController
        controller.filmeSelecionado = filme
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Properties
    

    
    // MARK: - Constructors
    
    

    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionFilmes.dataSource = self
        collectionFilmes.delegate = self
        FilmeAPI().recuperaFilmes { (listaDeFilme) in
            self.listaDeFilme = listaDeFilme
            self.collectionFilmes.reloadData()
        }
        
    }
    
}
