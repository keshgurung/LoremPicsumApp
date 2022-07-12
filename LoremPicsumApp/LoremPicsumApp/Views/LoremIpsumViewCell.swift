//
//  LoremIpsumViewCell.swift
//  LoremPicsumApp
//
//  Created by Kesh Gurung on 11/07/2022.
//


import UIKit

class LoremIpsumViewCell: UITableViewCell {

    static let reuseID = "\(LoremIpsumViewCell.self)"

    lazy var newImageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray
        return imageView
    }()

    lazy var newIndexLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .systemPink
        return label
    }()
    
   

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setUpUI()

    }

//    always required
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setUpUI(){
        let vstackView = UIStackView(frame: .zero)
        vstackView.translatesAutoresizingMaskIntoConstraints = false
        vstackView.spacing = 8
        vstackView.axis = .vertical
        vstackView.distribution = .equalCentering

        vstackView.addArrangedSubview(self.newIndexLabel)
       

        let hstackView = UIStackView(frame: .zero)
        hstackView.translatesAutoresizingMaskIntoConstraints = false
        hstackView.spacing = 8
        hstackView.axis = .horizontal


        hstackView.addArrangedSubview(self.newImageView)
        hstackView.addArrangedSubview(vstackView)

        self.newImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        self.newImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true

        self.contentView.addSubview(hstackView)

        hstackView.bindToSuperView()

    }





}
