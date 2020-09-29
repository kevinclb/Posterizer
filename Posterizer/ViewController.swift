//
//  ViewController.swift
//  Posterizer
//
//  Created by Kevin Babou on 9/26/20.
//  Copyright © 2020 Kevin Babou. All rights reserved.
//
import SideMenu
import UIKit

class ViewController: UIViewController {
    
    private let sideMenu = SideMenuNavigationController(rootViewController: MenuController(with: ["Home","Info","Settings"]))
    
    @IBAction func didTapMenuButton(){
        present(sideMenu, animated: true)
    }
    
    override func viewDidLoad() {
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
    }
    


}

class MenuController: UITableViewController{
    private let menuItems: [String]
    private let graycolor = UIColor(displayP3Red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = graycolor
        view.backgroundColor = graycolor
    }
    
    
    
    init(with menuItems: [String]){
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Table
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = graycolor
        cell.contentView.backgroundColor = graycolor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Relay to delegate about menu item selection
    }
}
