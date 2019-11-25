//
//  EquipmentListTableViewCell.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import UIKit

protocol EquipmentCellDelegate: class {
    func numberOfProductsSelected(cell: EquipmentListTableViewCell, row: Int, section: Int)
}

class EquipmentListTableViewCell : UITableViewCell {
    weak var delegate: EquipmentCellDelegate?
    let minValue = 0
    var rowNumber: Int!
    var sectionNumber: Int!
    var checkUncheckStatus: Bool!
    // Equipment
    var equipment: EachEquipment? {
        didSet {
            // Header list
            equipmentIdLabel.text = String(equipment!.id)
            equipmentMakeLabel.text = equipment?.make
            // All Subtitle list
            vinLabel.text = "\(vinText)" + equipment!.vin
            yearLabel.text = "\(yearText)" + String(equipment!.year)
            makeLabel.text = "\(makeText)" + equipment!.make
            valueLabel.text = "\(valueText)" + "$\(String(equipment!.value))"
            lengthLabel.text = "\(lengthText)" + "\(String(equipment!.length)) ft"
        }
    }
        
    private let vinText: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightText
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .left
        lbl.text = "VIN"
        return lbl
    }()
    
    private let yearText: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightText
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.text = "Year"
        return lbl
    }()
    
    private let makeText: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightText
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.text = "Make"
        return lbl
    }()
    
    private let valueText: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightText
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.text = "Value"
        return lbl
    }()
    
    private let lengthText: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightText
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.text = "Length"
        return lbl
    }()
    
    private let equipmentIdLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let equipmentMakeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let equipmentSelectButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "Uncheck"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
    private let equipmentDetailButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "Right"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
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
    
    @objc func equipmentSelectionTapped() {
        if checkUncheckStatus {
            checkUncheckStatus = false
            equipmentSelectButton.setImage(#imageLiteral(resourceName: "Check"), for: .normal)
        } else {
            checkUncheckStatus = true
            equipmentSelectButton.setImage(#imageLiteral(resourceName: "Uncheck"), for: .normal)
        }
        print("Selected")
    }
    
    @objc func equipmentDetailTapped() {
        delegate?.numberOfProductsSelected(cell: self, row: rowNumber, section: sectionNumber)
        print("Detail")
    }
        
    func setExpanded() {
        equipmentDetailButton.setImage(#imageLiteral(resourceName: "Down"), for: .normal)
    }

    func setCollapsed() {
        equipmentDetailButton.setImage(#imageLiteral(resourceName: "Right"), for: .normal)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        headerTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EquipmentListTableViewCell {
    func headerTextView() {
        addSubview(equipmentSelectButton)
        addSubview(equipmentIdLabel)
        addSubview(equipmentMakeLabel)
        addSubview(equipmentDetailButton)
        
        // Element.1
        equipmentSelectButton.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: leftAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 30, height: 30, enableInsets: false)
        // Element.2
        equipmentIdLabel.anchor(top: topAnchor, left: equipmentSelectButton.rightAnchor, bottom: nil, right: equipmentMakeLabel.leftAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/8, height: 30, enableInsets: false)
        // Element.3
        equipmentMakeLabel.anchor(top: topAnchor, left: equipmentIdLabel.rightAnchor, bottom: nil, right: equipmentDetailButton.leftAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        // Element.4
        equipmentDetailButton.anchor(top: topAnchor, left: equipmentMakeLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 30, height: 30, enableInsets: false)
        
        equipmentSelectButton.addTarget(self, action: #selector(equipmentSelectionTapped), for: .touchUpInside)
        equipmentDetailButton.addTarget(self, action: #selector(equipmentDetailTapped), for: .touchUpInside)
        
//        subTitleTextView()
    }
    
    func subTitleTextView() {
        addSubview(vinLabel)
        addSubview(yearLabel)
        addSubview(makeLabel)
        addSubview(valueLabel)
        addSubview(lengthLabel)
        
        // Element.1
        vinLabel.anchor(top: topAnchor, left: leftAnchor, bottom: yearLabel.topAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        // Element.2
        yearLabel.anchor(top: topAnchor, left: leftAnchor, bottom: makeLabel.topAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        // Element.3
        makeLabel.anchor(top: topAnchor, left: leftAnchor, bottom: valueLabel.topAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        // Element.4
        valueLabel.anchor(top: topAnchor, left: leftAnchor, bottom: lengthLabel.topAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
        
        // Element.4
        lengthLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width/2, height: 30, enableInsets: false)
    }
}


