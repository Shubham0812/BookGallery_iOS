//
//  BookTableViewCell.swift
//  BookGallery
//
//  Created by Shubham Singh on 19/03/21.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    // MARK:- outlets
    @IBOutlet weak var bookImageView: UIImageView!
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookRatingLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    // MARK:- variables
    override class func description() -> String {
        return "BookTableViewCell"
    }
    
    // MARK:- lifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK:- functions
    func setupCell(book: Book) {
        self.containerView.layer.cornerRadius = 12
        self.containerView.layer.masksToBounds = false
        self.setShadow()
        
        self.bookImageView.layer.cornerRadius = 8
        self.bookImageView.layer.borderWidth = 0.25
        self.bookImageView.layer.borderColor = UIColor.label.withAlphaComponent(0.2).cgColor
        
        self.bookImageView.image = UIImage(named: book.image)
        self.bookTitleLabel.text = book.name
        self.bookAuthorLabel.text = book.author
        self.bookRatingLabel.text = "\(book.rating)"
    }
    
    func setShadow() {
        self.containerView.layer.shadowColor = UIColor.label.cgColor
        self.containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.containerView.layer.shadowRadius = 4
        self.containerView.layer.shadowOpacity = 0.2
    }
    
}
