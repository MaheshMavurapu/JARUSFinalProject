//
//  EquipmentTableViewCell.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import UIKit

// Generic Equipment Table Cell.
class EquipmentTableViewCell : UITableViewCell {
    
    var equipment: EachEquipment? {
        didSet {
            // All Subtitle list
            vinLabel.text = "VIN         " + equipment!.vin
            yearLabel.text = "Year       " + String(equipment!.year)
            makeLabel.text = "Make     " + equipment!.make
            valueLabel.text = "Value    " + "$\(String(equipment!.value))"
            lengthLabel.text = "Length  " + "\(String(equipment!.length)) ft"
        }
    }
    
    // List#1
    private let vinLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    // List#2
    private let yearLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    // List#3
    private let makeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    // List#4
    private let valueLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    // List#5
    private let lengthLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        subTitleTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EquipmentTableViewCell {
    
    func subTitleTextView() {
        addSubview(vinLabel)
        addSubview(yearLabel)
        addSubview(makeLabel)
        addSubview(valueLabel)
        addSubview(lengthLabel)
        
        // Element.1
        vinLabel.anchor(top: topAnchor, left: leftAnchor, bottom: yearLabel.topAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        // Element.2
        yearLabel.anchor(top: vinLabel.bottomAnchor, left: leftAnchor, bottom: makeLabel.topAnchor, right: rightAnchor, paddingTop: 50, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        // Element.3
        makeLabel.anchor(top: yearLabel.bottomAnchor, left: leftAnchor, bottom: valueLabel.topAnchor, right: rightAnchor, paddingTop: 90, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        // Element.4
        valueLabel.anchor(top: makeLabel.bottomAnchor, left: leftAnchor, bottom: lengthLabel.topAnchor, right: rightAnchor, paddingTop: 140, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        // Element.5
        lengthLabel.anchor(top: valueLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
    }
}

