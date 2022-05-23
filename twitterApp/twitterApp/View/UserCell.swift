//
//  HomeCell.swift
//  twitterApp
//
//  Created by javad on 14.03.22.
//

import UIKit

let twitterBlue = UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1)


class UserCell: UICollectionViewCell {
    var tapImageHandler: (()->Void)?
    var user: User? {
        didSet {
            guard let unwrappedData = user else {return}
            
            nameLabel.text = unwrappedData.name
            userNameLabel.text = unwrappedData.username
            bioTextView.text = unwrappedData.bioText
            profileImageView.image = unwrappedData.profileImage
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = .clear
        textView.isScrollEnabled = false
        textView.sizeToFit()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(twitterBlue, for: .normal)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let separateLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        self.profileImageView.isUserInteractionEnabled = true
        self.profileImageView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func profileImageTapped() {
        
        tapImageHandler?()
    }
    
    func setupLayout() {
        
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(userNameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        addSubview(separateLineView)
        
        // constraints for profileImageView
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // constraints for nameLabel
        nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: followButton.leadingAnchor, constant: -8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // constraints for userNameLabel
        userNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
       
        // constraints for bioTextView
        bioTextView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: -4).isActive = true
        bioTextView.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor, constant: -4).isActive = true
        bioTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bioTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        // constraints for followButton
        followButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        followButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        // constraints for separateLineview
        separateLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separateLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        separateLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        separateLineView.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
    }
}

class SectionHeader: UICollectionReusableView  {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separateLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        headerLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func headerLayout(){
        addSubview(headerLabel)
        addSubview(separateLineView)
        
        headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        
        separateLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separateLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        separateLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        separateLineView.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
        
    }
}

class SectionFooter: UICollectionReusableView {
    
    let whiteBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let footerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = twitterBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        footerLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func footerLayout() {
        addSubview(whiteBackgroundView)
        addSubview(footerLabel)
        
        whiteBackgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        whiteBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        whiteBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        whiteBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14).isActive = true
        
        footerLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        footerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 12).isActive = true
    }
}

