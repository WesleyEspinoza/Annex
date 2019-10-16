//
//  OnboardingTut.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/14/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit

class TutVC: UIViewController, UIScrollViewDelegate {
    let viewH: CGFloat = 250
    let viewW: CGFloat = 300
    var offSet: CGFloat = 0
    let imageSize = CGSize(width: 100, height: 200)
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = false
        view.showsHorizontalScrollIndicator = true
        view.isPagingEnabled = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let slide1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.backgroundColor = .white
        
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 2
        lable.text = """
        Using Annex is a simple,
        Here's how
        """
        lable.font = .systemFont(ofSize: 24)
        lable.textAlignment = .center
        
        view.addSubview(lable)
        NSLayoutConstraint.activate([lable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                     lable.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
                                     ])
        
        return view
        
    }()
    
    let pictureSlide1: UIImageView = {
        var screenShot = UIImage(named: "screenShot1")
        let imageview = UIImageView(image: screenShot)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = 75
        imageview.layer.shadowOpacity = 0.5
        imageview.layer.shadowRadius = 5
        imageview.layer.shadowOffset = CGSize(width: 0, height: 5)
        imageview.backgroundColor = .white
        return imageview
    }()
    
    
    let pictureSlide2: UIImageView = {
        var screenShot = UIImage(named: "screenShot2")
        let imageview = UIImageView(image: screenShot)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = 75
        imageview.layer.shadowOpacity = 0.5
        imageview.layer.shadowRadius = 5
        imageview.layer.shadowOffset = CGSize(width: 0, height: 5)
        imageview.backgroundColor = .white
        return imageview
    }()
    
    let pictureSlide3: UIImageView = {
        var screenShot = UIImage(named: "screenShot3")
        let imageview = UIImageView(image: screenShot)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = 75
        imageview.layer.shadowOpacity = 0.5
        imageview.layer.shadowRadius = 5
        imageview.layer.shadowOffset = CGSize(width: 0, height: 5)
        imageview.backgroundColor = .white
        return imageview
    }()
    
    let pictureSlide4: UIImageView = {
        var screenShot = UIImage(named: "screenShot4")
        let imageview = UIImageView(image: screenShot)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = 75
        imageview.layer.shadowOpacity = 0.5
        imageview.layer.shadowRadius = 5
        imageview.layer.shadowOffset = CGSize(width: 0, height: 5)
        imageview.backgroundColor = .white
        return imageview
    }()
    
    let pictureSlide5: UIImageView = {
        var screenShot = UIImage(named: "screenShot5")
        let imageview = UIImageView(image: screenShot)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = 75
        imageview.layer.shadowOpacity = 0.5
        imageview.layer.shadowRadius = 5
        imageview.layer.shadowOffset = CGSize(width: 0, height: 5)
        imageview.backgroundColor = .white
        return imageview
    }()
    
    let pictureSlide6: UIImageView = {
        var screenShot = UIImage(named: "screenShot6")
        let imageview = UIImageView(image: screenShot)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = 75
        imageview.layer.shadowOpacity = 0.5
        imageview.layer.shadowRadius = 5
        imageview.layer.shadowOffset = CGSize(width: 0, height: 5)
        imageview.backgroundColor = .white
        return imageview
    }()
    
    let pictureSlide7: UIImageView = {
        var screenShot = UIImage(named: "screenShot7")
        let imageview = UIImageView(image: screenShot)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = 75
        imageview.layer.shadowOpacity = 0.5
        imageview.layer.shadowRadius = 5
        imageview.layer.shadowOffset = CGSize(width: 0, height: 5)
        imageview.backgroundColor = .white
        return imageview
    }()
    
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        button.layer.borderWidth = 1
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(nextButtontapCancelled), for: [.touchCancel, .touchDragExit, .touchUpOutside])
        button.addTarget(self, action: #selector(nextButtontapUp), for: [.touchUpInside])
        button.addTarget(self, action: #selector(nextButtontapDown), for: [.touchDown])
        return button
    }()
    
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        button.layer.borderWidth = 1
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(backButtontapCancelled), for: [.touchCancel, .touchDragExit, .touchUpOutside])
        button.addTarget(self, action: #selector(backButtontapUp), for: [.touchUpInside])
        button.addTarget(self, action: #selector(backButtontapDown), for: [.touchDown])
        return button
    }()
    
    let finishButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get started", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        button.layer.borderWidth = 1
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(finishButtontapCancelled), for: [.touchCancel, .touchDragExit, .touchUpOutside])
        button.addTarget(self, action: #selector(finishButtontapUp), for: [.touchUpInside])
        button.addTarget(self, action: #selector(finishButtontapDown), for: [.touchDown])
        return button
    }()
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        button.layer.borderWidth = 1
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(finishButtontapCancelled), for: [.touchCancel, .touchDragExit, .touchUpOutside])
        button.addTarget(self, action: #selector(finishButtontapUp), for: [.touchUpInside])
        button.addTarget(self, action: #selector(finishButtontapDown), for: [.touchDown])
        return button
    }()

    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        	
        let gradient = CAGradientLayer()
        
        gradient.frame = UIScreen.main.bounds
        gradient.colors = [UIColor.init(hexString: "#00d4ff").cgColor, UIColor.init(hexString: "#0015ff").cgColor]
        
         view.layer.insertSublayer(gradient, at: 0)
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(slide1)
        scrollView.addSubview(pictureSlide1)
        scrollView.addSubview(pictureSlide2)
        scrollView.addSubview(pictureSlide3)
        scrollView.addSubview(pictureSlide4)
        scrollView.addSubview(pictureSlide5)
        scrollView.addSubview(pictureSlide6)
        scrollView.addSubview(pictureSlide7)
        scrollView.addSubview(finishButton)
        view.addSubview(nextButton)
        view.addSubview(skipButton)
        view.addSubview(backButton)
        scrollView.delegate = self
        
        
        
        let totalViews = scrollView.subviews.count
        let viewWidth = view.bounds.width
        let width = viewWidth * CGFloat(totalViews)
        scrollView.contentSize = CGSize(width:width, height: 1)
        
        NSLayoutConstraint.activate([
                                     scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                                     scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
                                     scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                                     scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
                                     
                                     
                                     slide1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0),
                                     slide1.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: 0),
                                     slide1.heightAnchor.constraint(equalToConstant: viewH),
                                     slide1.widthAnchor.constraint(equalToConstant: viewW),
                                     
                                     
                                     pictureSlide1.leadingAnchor.constraint(equalTo: slide1.trailingAnchor, constant: 125),
                                     pictureSlide1.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -75),
                                     pictureSlide1.heightAnchor.constraint(equalToConstant: 400),
                                     pictureSlide1.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     
                                     pictureSlide2.leadingAnchor.constraint(equalTo: pictureSlide1.trailingAnchor, constant: 175),
                                     pictureSlide2.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -75),
                                     pictureSlide2.heightAnchor.constraint(equalToConstant: 400),
                                     pictureSlide2.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     
                                     pictureSlide3.leadingAnchor.constraint(equalTo: pictureSlide2.trailingAnchor, constant: 175),
                                     pictureSlide3.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -75),
                                     pictureSlide3.heightAnchor.constraint(equalToConstant: 400),
                                     pictureSlide3.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     
                                     pictureSlide4.leadingAnchor.constraint(equalTo: pictureSlide3.trailingAnchor, constant: 175),
                                     pictureSlide4.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -75),
                                     pictureSlide4.heightAnchor.constraint(equalToConstant: 400),
                                     pictureSlide4.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     
                                     pictureSlide5.leadingAnchor.constraint(equalTo: pictureSlide4.trailingAnchor, constant: 175),
                                     pictureSlide5.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -75),
                                     pictureSlide5.heightAnchor.constraint(equalToConstant: 400),
                                     pictureSlide5.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     
                                     pictureSlide6.leadingAnchor.constraint(equalTo: pictureSlide5.trailingAnchor, constant: 175),
                                     pictureSlide6.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -75),
                                     pictureSlide6.heightAnchor.constraint(equalToConstant: 400),
                                     pictureSlide6.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     
                                     pictureSlide7.leadingAnchor.constraint(equalTo: pictureSlide6.trailingAnchor, constant: 175),
                                     pictureSlide7.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -75),
                                     pictureSlide7.heightAnchor.constraint(equalToConstant: 400),
                                     pictureSlide7.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     
                                     finishButton.leadingAnchor.constraint(equalTo: pictureSlide7.trailingAnchor, constant: 150),
                                     finishButton.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: 0),
                                     finishButton.heightAnchor.constraint(equalToConstant: viewW),
                                     finishButton.widthAnchor.constraint(equalToConstant: viewH),
                                     
                                     
                                     
                                     nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
                                     nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -125),
                                     nextButton.widthAnchor.constraint(equalToConstant: 75),
                                     
                                     
                                     skipButton.trailingAnchor.constraint(equalTo: nextButton.trailingAnchor, constant: 0),
                                     skipButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
                                     skipButton.leadingAnchor.constraint(equalTo: backButton.leadingAnchor, constant: 0),
                                     
                                     
                                     backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
                                     backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -125),
                                     backButton.widthAnchor.constraint(equalToConstant: 75),])
    }

    
    @objc func nextButtontapUp(_ sender: AnyObject) -> Void{
        nextButton.alpha = 1
        let pageWidth:CGFloat = self.scrollView.frame.width
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        let slideToX = contentOffset + pageWidth
        nextButton.isUserInteractionEnabled = false
        self.scrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollView.frame.height), animated: true)
        
    }
    
    @objc func nextButtontapCancelled(_ sender: AnyObject) -> Void{
        nextButton.alpha = 1
    }
    @objc func nextButtontapDown(_ sender: AnyObject) -> Void{
        nextButton.alpha = 0.5
    }
    
    @objc func backButtontapUp(_ sender: AnyObject) -> Void{
        backButton.alpha = 1
        
        
        let pageWidth:CGFloat = self.scrollView.frame.width
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        
        let slideToX = (contentOffset - pageWidth)
        backButton.isUserInteractionEnabled = false
        self.scrollView.scrollRectToVisible(CGRect (x:slideToX, y:0, width:pageWidth, height:self.scrollView.frame.height), animated: true)
        
    }
    
    @objc func backButtontapCancelled(_ sender: AnyObject) -> Void{
        backButton.alpha = 1
    }
    @objc func backButtontapDown(_ sender: AnyObject) -> Void{
        backButton.alpha = 0.5
    }
    
    @objc func finishButtontapUp(_ sender: AnyObject) -> Void{
        finishButton.alpha = 1
        }
    
    
    @objc func finishButtontapCancelled(_ sender: AnyObject) -> Void{
        finishButton.alpha = 1
    }
    @objc func finishButtontapDown(_ sender: AnyObject) -> Void{
        finishButton.alpha = 0.5
        self.dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        nextButton.isUserInteractionEnabled = true
        backButton.isUserInteractionEnabled = true
    }
}
