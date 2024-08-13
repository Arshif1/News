//
//  NewsListViewController.swift
//  News_UiKit
//

import UIKit
import News

class NewsListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView?
    
    private var articles: [Article] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    private var viewmodel = NewsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        tableView?.dataSource = self
        tableView?.register(UINib(nibName: "ArticleListCell", bundle: .main), forCellReuseIdentifier: "cell")
        configureViewModel()
    }
    
    private func configureViewModel() {
        viewmodel.onarticlesLoadedClosure = { [weak self] articles in
            self?.articles = articles
        }
        viewmodel.loadNews()
    }
}

extension NewsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleListCell
        cell.labelTitle?.text = articles[indexPath.row].title
        cell.labelDescription?.text = articles[indexPath.row].description
        return cell
    }
}
