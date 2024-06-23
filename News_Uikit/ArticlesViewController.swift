//
//  ArticlesViewController.swift
//  News_Uikit
//
//  Created by Arshif on 19/06/2024.
//

import UIKit

class ArticlesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak private var tableView: UITableView!
    
    private var viewModel = ArticlesViewModel()
    
     private var articles = [Article]() {
         didSet {
             tableView.reloadData()
         }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel.onLoadArticles = { articles in
            self.articles = articles
        }
        viewModel.loadArticle()
    }

    private func setupView() {
        title = "News"
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        cell.article = articles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! ArticleDetailViewController
        detailViewController.article = articles[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
