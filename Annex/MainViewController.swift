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
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        
        
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
        button.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
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
        let nextVC = ContractCreationViewController()
        navigationController?.present(nextVC, animated: true, completion: nil)
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                numberOfItemsInSection section: Int) -> Int {
        return forms.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
        let form = forms[indexPath.row]
        cell.nameLable.text = ("\(form.lendee)'s Constract")
        cell.moneyLabel.text = "\(form.amount)"
        cell.creationDateLable.text = "\(form.creationDate)"
        cell.dueDateLable.text = "\(form.dueDate)"
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        
        RealmHelper.deleteForm(form: forms[indexPath.row])
        
        forms = RealmHelper.retrieveForm()
    }
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextViewController = ContractDisplayController()
        navigationController?.pushViewController(nextViewController, animated: true)
        let form = forms[indexPath.row]
        nextViewController.lenderAddress = form.lenderAddress
        nextViewController.lendeeAddress = form.lendeeAddress
        nextViewController.dueDate = form.dueDate
        nextViewController.date = form.creationDate
        nextViewController.amount = form.amount
        nextViewController.lenderName = form.lender
        nextViewController.lendeeName = form.lendee
        nextViewController.state = form.state
        nextViewController.city = form.city
        nextViewController.lenderImageData = form.lenderSignatureData
        nextViewController.lendeeImageData = form.lendeeSignatureData
        nextViewController.month = form.month
        nextViewController.day = form.day
        nextViewController.year = form.year
        nextViewController.counter = indexPath.row
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
    
    
    
    func didAppAlreadyLaunchedOnce()->Bool{
        let defaults = UserDefaults.standard
        
        if let _ = defaults.string(forKey: "didAppAlreadyLaunchedOnce"){
            return true
        }else{
            defaults.set(true, forKey: "didAppAlreadyLaunchedOnce")
            return false
        }
    }
    
    
}

