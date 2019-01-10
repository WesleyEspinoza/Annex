//
//  ViewController.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/8/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view, typically from a nib.
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
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        
        
        return collectionView
    }()
    
    
    let addButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .blue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 37.5
        button.addTarget(self, action: #selector(addButtontapped), for: [.touchUpInside, .touchUpOutside])
        button.addTarget(self, action: #selector(addButtontappedCancelled), for: .touchDown)
        return button
    }()
    
    
    override func viewDidAppear(_ animated: Bool) {
        view.addSubview(collectionView)
        view.addSubview(addButton)
        
        
        
        NSLayoutConstraint.activate([addButton.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -25 ),
                                     addButton.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -35),
                                     addButton.widthAnchor.constraint(equalToConstant: 75),
                                     addButton.heightAnchor.constraint(equalToConstant: 75)])
    }
    
    @objc func addButtontapped(_ sender: AnyObject) -> Void{
        addButton.alpha = 1
    }
    @objc func addButtontappedCancelled(_ sender: AnyObject) -> Void{
        addButton.alpha = 0.5
    }
    
    
    


}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 15, height: collectionView.bounds.height / 8 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 25, left: 10, bottom: 25, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
}


