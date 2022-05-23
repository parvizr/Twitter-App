//
//  NotificationCell.swift
//  twitterApp
//
//  Created by javad on 01.04.22.
//

import UIKit


class NotificationCell: UITableViewCell {
    
    var notification: Notification? {
        didSet {
            guard let unwrappedData = notification else {return}
            
            profileImageView.image = unwrappedData.user.profileImage
            
            let attributedText = NSMutableAttributedString(string: "\(unwrappedData.user.name)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
            attributedText.append(NSAttributedString(string: " \(unwrappedData.user.username)\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor : UIColor.gray]))
            
            attributedText.append(NSAttributedString(string: "\(unwrappedData.notification)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]))
                                  
            notificationTextView.attributedText = attributedText
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let notificationTextView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.sizeToFit()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(profileImageView)
        addSubview(notificationTextView)
        
        //constraints for profileImageView
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //constraints for notificationTextView
        notificationTextView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 4).isActive = true
        notificationTextView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        notificationTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        notificationTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        notificationTextView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}
