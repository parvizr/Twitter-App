//
//  TweetCell.swift
//  twitterApp
//
//  Created by javad on 16.03.22.
//

import UIKit

class TweetCell: UICollectionViewCell {
    
    var tweet: Tweet? {
        didSet {
            
            guard let unwrappedData = tweet else {return}
            
            profileImageView.image = unwrappedData.user.profileImage
            
            let attributedText = NSMutableAttributedString(string: unwrappedData.user.name, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
            attributedText.append(NSAttributedString(string: " \(unwrappedData.user.username)\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor : UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
            
            attributedText.append(NSAttributedString(string: "\(unwrappedData.message)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]))
        
            messageTextView.attributedText = attributedText
        }
    }
    
    
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let separateLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.sizeToFit()
        return textView
    }()
    
    // Buttons for the stackView
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let directMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let replyButtonContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    let retweetButtonContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    let likeButtonContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    let directMessageContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupLayout()
        setupBottomButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(){
             
        addSubview(profileImageView)
        addSubview(separateLineView)
        addSubview(messageTextView)

   
        // constraints for profileImageView
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
        // constraints for separateLineview
        separateLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separateLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        separateLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        separateLineView.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
        
        // constraints for messageTextView
        messageTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        messageTextView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 4).isActive = true
        messageTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        messageTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupBottomButtons() {
        
        let bottomButtonsStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directMessageContainerView])
        bottomButtonsStackView.axis = .horizontal
        bottomButtonsStackView.distribution = .fillEqually
        bottomButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bottomButtonsStackView)
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)
        
        // constraints for bottomButtonsStackView
        bottomButtonsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        bottomButtonsStackView.leadingAnchor.constraint(equalTo: messageTextView.leadingAnchor).isActive = true
        bottomButtonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomButtonsStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // constraints for replyButton
        replyButton.topAnchor.constraint(equalTo: replyButtonContainerView.topAnchor).isActive = true
        replyButton.leadingAnchor.constraint(equalTo: replyButtonContainerView.leadingAnchor).isActive = true
        replyButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        replyButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // constraints for retweetButton
        retweetButton.topAnchor.constraint(equalTo: retweetButtonContainerView.topAnchor).isActive = true
        retweetButton.leadingAnchor.constraint(equalTo: retweetButtonContainerView.leadingAnchor).isActive = true
        retweetButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        retweetButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        // constraints for likeButton
        likeButton.topAnchor.constraint(equalTo: likeButtonContainerView.topAnchor).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: likeButtonContainerView.leadingAnchor).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        // constraints for directMessageButton
        directMessageButton.topAnchor.constraint(equalTo: directMessageContainerView.topAnchor).isActive = true
        directMessageButton.leadingAnchor.constraint(equalTo: directMessageContainerView.leadingAnchor).isActive = true
        directMessageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        directMessageButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
}
