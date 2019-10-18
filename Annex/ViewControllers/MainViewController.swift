//
//  ViewController.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/8/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController{
    var forms: Results<Form>! {
        didSet {
            collectionView.reloadData()
        }
    }

    
    lazy var collectionView: UICollectionView = {
        // Instantiating the UICollectionView, using the default flow layout
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: CustomFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.backgroundColor = .white
        
        // Setting the datasource & delegate
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Customization
        collectionView.alwaysBounceVertical = true
        
        //Registering the cell
        collectionView.register(ContractCell.self, forCellWithReuseIdentifier: ContractCell.identifier)
        
        
        return collectionView
    }()
    
    let navigationBar: UINavigationBar = {
        let bar = UINavigationBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.barStyle = .blackTranslucent
        bar.layer.cornerRadius = 15
        return bar
    }()
    
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 37.5
        button.addTarget(self, action: #selector(addButtontapCancelled), for: [.touchCancel, .touchDragExit, .touchUpOutside])
        button.addTarget(self, action: #selector(addButtontapUp), for: [.touchUpInside])
        button.addTarget(self, action: #selector(addButtontapDown), for: [.touchDown])
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(false, animated: true)
        forms = RealmHelper.retrieveForm()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
        view.addSubview(collectionView)
        view.addSubview(addButton)
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.title = "Annex"
        
        if (!didAppAlreadyLaunchedOnce()) {
            let tutVC = TutVC()
            tutVC.modalPresentationStyle = .fullScreen
            navigationController?.present(tutVC, animated: true, completion: nil)
            
            
            
        }
        
        
        
        NSLayoutConstraint.activate([addButton.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -15 ),
                                     addButton.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -35),
                                     addButton.widthAnchor.constraint(equalToConstant: 75),
                                     addButton.heightAnchor.constraint(equalToConstant: 75)])
    }
    
    @objc func addButtontapUp(_ sender: AnyObject) -> Void{
        addButton.alpha = 1
        
    }
    @objc func addButtontapCancelled(_ sender: AnyObject) -> Void{
        addButton.alpha = 1
    }
    @objc func addButtontapDown(_ sender: AnyObject) -> Void{
        addButton.alpha = 0.5
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let nextVC = ContractCreationViewController(collectionViewLayout: layout)
        navigationController?.present(nextVC, animated: true, completion: nil)
    }
}


