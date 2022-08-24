// Copyright © 2021 Tokenary. All rights reserved.

import UIKit
import BlockiesSwift

protocol AccountTableViewCellDelegate: AnyObject {
    
    func didTapMoreButton(accountCell: AccountTableViewCell)
    
}

class AccountTableViewCell: UITableViewCell {

    private weak var cellDelegate: AccountTableViewCellDelegate?
    private var initialBackgroundColor: UIColor?
    
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let backgroundView = UIView()
        backgroundView.backgroundColor = tintColor.withAlphaComponent(0.45)
        selectedBackgroundView = backgroundView
    }
    
    func setup(title: String, image: UIImage?, isDisabled: Bool, delegate: AccountTableViewCellDelegate) {
        if initialBackgroundColor == nil {
            initialBackgroundColor = backgroundColor
        }
        
        cellDelegate = delegate
        avatarImageView.image = image
        titleLabel.text = title
        setDisabled(isDisabled)
    }
    
    private func setDisabled(_ disabled: Bool) {
        let alpha: CGFloat = disabled ? 0.35 : 1
        backgroundColor = disabled ? initialBackgroundColor?.withAlphaComponent(alpha) : initialBackgroundColor
        contentView.alpha = alpha
    }
    
    @IBAction func moreButtonTapped(_ sender: Any) {
        cellDelegate?.didTapMoreButton(accountCell: self)
    }
    
}
