//
//  ProfileCell.swift
//  twitterApp
//
//  Created by javad on 15.04.22.
//

import UIKit


class ProfileCell: UICollectionViewCell {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let profileBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "icons8-settings-100()"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let friendRequestButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "request"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Edit Profile", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let userInformationTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Brian Voong\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22)])
        attributedText.append(NSAttributedString(string: "@buildthatapp\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)]))
        attributedText.append(NSAttributedString(string: "iOS Developer, Instructor\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)]))
        attributedText.append(NSAttributedString(string: "California, USA    ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)]))
        attributedText.append(NSAttributedString(string: "      videos.letsbuildthatapp.com\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.systemBlue]))
        attributedText.append(NSAttributedString(string: "24 ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]))
        attributedText.append(NSAttributedString(string: "FOLLOWING   ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)]))
        attributedText.append(NSAttributedString(string: "  1126", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]))
        attributedText.append(NSAttributedString(string: " FOLLOWERS", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)]))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        let range = NSMakeRange(0, attributedText.string.count)
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        textView.attributedText = attributedText
        return textView
    }()
    
    let separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Tweet", "Media", "Likes"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentTintColor = twitterBlue
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.systemBlue ], for: .normal)
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
        control.selectedSegmentIndex = 0
        return control
    }()
    
   
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(backgroundImageView)
        addSubview(profileBackView)
        addSubview(profileImageView)
        addSubview(userInformationTextView)
        addSubview(settingsButton)
        addSubview(friendRequestButton)
        addSubview(editButton)
        addSubview(separatorLineView)
        addSubview(segmentedControl)
        
        
        // constraints for backgroundImage
        backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: topAnchor /*, constant: -30*/).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        // constraints for profileImage
        profileImageView.leadingAnchor.constraint(equalTo: profileBackView.leadingAnchor, constant: 4).isActive = true
        profileImageView.topAnchor.constraint(equalTo: profileBackView.topAnchor, constant: 4).isActive = true
        profileImageView.trailingAnchor.constraint(equalTo: profileBackView.trailingAnchor, constant: -4).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: profileBackView.bottomAnchor, constant: -4).isActive = true
        
        // constraints for profileBackview
        profileBackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6).isActive = true
        profileBackView.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -35).isActive = true
        profileBackView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        profileBackView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        // constraints for userInformationTextView
        userInformationTextView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 4).isActive = true
        userInformationTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        userInformationTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        userInformationTextView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        // constraints for settingsButton
        settingsButton.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 4).isActive = true
        settingsButton.leadingAnchor.constraint(equalTo: profileBackView.trailingAnchor, constant: 70).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        // constraints for friendRequestButton
        friendRequestButton.topAnchor.constraint(equalTo: settingsButton.topAnchor).isActive = true
        friendRequestButton.leadingAnchor.constraint(equalTo: settingsButton.trailingAnchor, constant: 1).isActive = true
        friendRequestButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        friendRequestButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        // constraints for editButton
        editButton.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 12.5).isActive = true
        editButton.leadingAnchor.constraint(equalTo: friendRequestButton.trailingAnchor, constant: 1).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // constraints for segmentedcontrol
        segmentedControl.bottomAnchor.constraint(equalTo: separatorLineView.topAnchor, constant: -8).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //constraints for separateLineView
        separatorLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separatorLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        separatorLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
        
        
        
    }
    
}
