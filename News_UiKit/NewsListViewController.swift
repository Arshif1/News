//
//  NewsListViewController.swift
//  News_UiKit
//

import UIKit
import News

class NewsListViewController: UIViewController, UITableViewDelegate {
    
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
        title = "News"
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(UINib(nibName: "ArticleListCell", bundle: .main), forCellReuseIdentifier: "cell")
        configureViewModel()
    }
    
    private func configureViewModel() {
        viewmodel.onarticlesLoadedClosure = { [weak self] articles in
            self?.articles = articles
        }
        viewmodel.loadNews()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! ArticleDetailViewController
        detailViewController.article = articles[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}


extension NewsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleListCell
        cell.article = articles[indexPath.row]
        return cell
        
   
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            viewmodel.loadNews()
        }
    }
    
}
