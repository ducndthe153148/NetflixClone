//
//  HomeViewController.swift
//  NetFlixClone
//
//  Created by MacOS on 23/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        table.registerCell(for: "MovieTableViewCell")
        table.delegate = self
        table.dataSource = self
    }

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.textLabel?.text = "Hello world";
        return cell;
    }
    
}

extension UITableView {
    func registerCell(for id: String) {
        let nib = UINib(nibName: id, bundle: nil)
        register(nib, forCellReuseIdentifier: id)
    }
}
