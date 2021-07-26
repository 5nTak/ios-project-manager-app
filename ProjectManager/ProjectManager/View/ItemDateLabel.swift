//
//  ItemDateLabel.swift
//  ProjectManager
//
//  Created by 이영우 on 2021/07/22.
//

import UIKit

class ItemDateLabel: UILabel {
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 1
        self.lineBreakMode = .byTruncatingTail
        self.font = UIFont.preferredFont(forTextStyle: .title1)
    }
    
    func setTextColor(by date: String) {
        let currentDate = DateUtil.formatDate(Date())
        if currentDate <= date {
            self.textColor = .black
        } else {
            self.textColor = .systemRed
        }
    }
}
