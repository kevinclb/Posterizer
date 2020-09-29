//
//  ViewController.swift
//  Posterizer
//
//  Created by Kevin Babou on 9/26/20.
//  Copyright © 2020 Kevin Babou. All rights reserved.
//
import SideMenu
import UIKit

class ViewController: UIViewController, MenuControllerDelegate {
    
    
    
    
    
    private var sideMenu: SideMenuNavigationController?
    
    private let settingsController = SettingsViewController()
    private let infoController = InfoViewController()
    
    override func viewDidLoad() {
        let menu =  MenuController(with: ["Home","Info","Settings"])
        
        menu.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        addChildControllers()
        
    }
    
    private func addChildControllers(){
        addChild(settingsController)
        addChild(infoController)
        view.addSubview(settingsController.view)
        view.addSubview(infoController.view)
        settingsController.view.frame = view.bounds
        infoController.view.frame = view.bounds
        
        settingsController.didMove(toParent: self)
        infoController.didMove(toParent: self)
        
        settingsController.view.isHidden = true
        infoController.view.isHidden = true
    }
    @IBAction func didTapMenuButton(){
        present(sideMenu!, animated: true)
    }
    
    func didSelectMenuItem(named: String) {
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            
            self?.title = named
            if named == "home" {
                self?.settingsController.view.isHidden = true
                self?.infoController.view.isHidden = true
            }
            else if named == "Info"{
                self?.settingsController.view.isHidden = true
                self?.infoController.view.isHidden = false
            }
            else if named == "Settings"{
                self?.settingsController.view.isHidden = false
                self?.infoController.view.isHidden = true
            }
        })
    }


}


