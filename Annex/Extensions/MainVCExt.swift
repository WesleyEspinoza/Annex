//
//  MainVCExt.swift
//  Annex
//
//  Created by Wesley Espinoza on 10/15/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                numberOfItemsInSection section: Int) -> Int {
        return forms.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContractCell.identifier, for: indexPath) as! ContractCell
        let form = forms[indexPath.row]
        cell.nameLabel.text = ("\(form.lendee)'s Constract")
        cell.creationDateLabel.text = "Creation date: \(form.creationDate)"
        cell.dueDateLabel.text = "Due date: \(form.dueDate)"
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
        return CGSize(width: collectionView.bounds.width - 35, height: collectionView.bounds.height / 4 )
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