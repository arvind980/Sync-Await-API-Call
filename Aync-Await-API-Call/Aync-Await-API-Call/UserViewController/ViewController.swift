//
//  ViewController.swift
//  Aync-Await-API-Call
//
//  Created by Arvind kumar Singh on 08/04/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userTblView: UITableView!
    let viewModel = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.viewModel.fetchUser()
    }

    func registerCell(){
        userTblView.register(UINib(nibName: "UserTblCell", bundle: nil), forCellReuseIdentifier: "UserTblCell")
        self.userTblView.delegate = self
        self.userTblView.dataSource = self
        self.viewModel.delegate = self
    }

    @IBAction func tapOnBtn(_ sender: Any) {
        self.viewModel.fetchUser()
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTblCell") as? UserTblCell else {return UITableViewCell()}
        cell.updateCell(user: viewModel.usersList[indexPath.row])
        return cell
    }
}

extension ViewController: UserViewModelDelegate {
    func relodeTblview() {
        userTblView.reloadData()
    }
}
