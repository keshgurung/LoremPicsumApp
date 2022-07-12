//
//  ViewController.swift
//  LoremPicsumApp
//
//  Created by Kesh Gurung on 11/07/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var table: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemRed
        table.dataSource = self
        table.delegate = self
        table.register(LoremIpsumViewCell.self, forCellReuseIdentifier: LoremIpsumViewCell.reuseID)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
     
        // Do any additional setup after loading the view.
    }
    
    
    private func setUpUI(){
        self.view.backgroundColor = .white
        self.title = " Minion Table View"
        self.view.addSubview(self.table)
        self.table.bindToSuperView()
    }

   
    
}
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LoremIpsumViewCell.reuseID, for: indexPath) as? LoremIpsumViewCell else {
            return UITableViewCell()
        }
        
       
            let url = URL(string: "https://picsum.photos/200/300")
        
            
            NetworkManager.shared.getData(url: url) { result in
                
              
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        cell.newImageView.image = UIImage(data: data)
                    }
                case .failure(let error):
                    print(error)
                    DispatchQueue.main.async {
                        cell.newImageView.image = UIImage(named: "X")
                    }
                }
            }
        
        
        NetworkManager.shared.getResponse(url: url) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let newResponse = response as? HTTPURLResponse
                  
                    guard let res = newResponse?.value(forHTTPHeaderField: "picsum-id") else {return}
                    cell.newIndexLabel.text = "The ID is:\(res)"
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    cell.newIndexLabel.text = "under progress"
                }
            }
        }
        
        
        return cell
    }
    

}
extension MainViewController: UITableViewDelegate {

    }




