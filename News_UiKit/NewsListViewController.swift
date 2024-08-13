//
//  NewsListViewController.swift
//  News_UiKit
//

import UIKit

struct Article {
    let title = "Atitle"
}

class NewsListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView?
    
    private var articles: [Article] = Array(repeating: .init(), count: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        tableView?.dataSource = self
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}


extension NewsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }
    

}
