//
//  ViewController.swift
//  BookGallery
//
//  Created by Shubham Singh on 19/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- variables
    
    /// sample data set
    var bookshelves: [BookShelf] = [
        BookShelf(id: 0, books: [
            Book(id: 232, name: "Brave New World", author: "Aldous Huxley", chapterCount: 20, image: "bird", rating: 4.86),
            Book(id: 535, name: "Sword Art Online: Invading", author: "Reki Kawahara", chapterCount: 12, image: "vinci", rating: 4.9),
            Book(id: 656, name: "Steve Jobs", author: "Walter Isaacson", chapterCount: 23, image: "killing", rating: 4.78),
            Book(id: 676, name: "Angels & Demons", author: "Dan Brown", chapterCount: 20, image: "think", rating: 4.82),
            Book(id: 123, name: "Ichigo Ichie", author: "Francecs Miralles", chapterCount: 20, image: "work", rating: 4.74),
            Book(id: 535, name: "Thinking with Type", author: "Ellen Lupton", chapterCount: 12, image: "thinking", rating: 4.8),
        ], shelfTitle: "Favorites"),
        BookShelf(id: 1, books: [
            Book(id: 123, name: "The Book Thief", author: "Markus Zusak", chapterCount: 21, image: "theif", rating: 4.7),
            Book(id: 2235, name: "1984", author: "George Orwell", chapterCount: 12, image: "1984", rating: 4.75),
            Book(id: 1233, name: "The Hobbit", author: "J.R.R. Tolkien", chapterCount: 9, image:  "hobbit", rating: 4.64),
            Book(id: 4233, name: "The Subtle Art of Not Giving a Fuck", author: "Mark Manson", chapterCount: 12, image: "subtle", rating: 4.89),
        ],
        shelfTitle: "Popular Titles")
    ]
    
    /// diffable data source
    private var dataSource: UITableViewDiffableDataSource<String,Book>?
    
    // MARK:- lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: BookTableViewCell.description(),
                                      bundle: nil), forCellReuseIdentifier: BookTableViewCell.description())
        self.tableView.delegate = self
        
        dataSource = UITableViewDiffableDataSource<String, Book>(tableView: tableView) { (tableView, indexPath, book)
            -> BookTableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.description(),
                                                     for: indexPath) as! BookTableViewCell
            cell.setupCell(book: book)
            return cell
        }
        dataSource?.defaultRowAnimation = .fade
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.applySnapshot(animated: false)
    }
    
    
    // MARK:- outlets & objc functions
    @IBAction func shuffleButtonPressed(_ sender: Any) {
        for ix in 0 ..< bookshelves.count {
            bookshelves[ix].books = bookshelves[ix].books.shuffled()
        }        
        self.applySnapshot(animated: true)
    }
    
    // MARK:- functions
    private func applySnapshot(animated: Bool = true){
        var snapshot = NSDiffableDataSourceSnapshot<String, Book>()
        
        for bookshelf in bookshelves {
            snapshot.appendSections([bookshelf.shelfTitle])
            snapshot.appendItems(bookshelf.books)
        }
        dataSource?.apply(snapshot, animatingDifferences: animated)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 68))
        headerView.backgroundColor = UIColor.systemBackground
        
        let sectionLabel = UILabel()
        sectionLabel.text = bookshelves[section].shelfTitle
        sectionLabel.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        sectionLabel.frame = CGRect(x: 24, y: 34 - sectionLabel.intrinsicContentSize.height / 2, width: sectionLabel.intrinsicContentSize.width + 12, height: sectionLabel.intrinsicContentSize.height)
        
        headerView.addSubview(sectionLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 68
    }
}






