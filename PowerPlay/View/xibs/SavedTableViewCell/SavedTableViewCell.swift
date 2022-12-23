import UIKit

class SavedTableViewCell: UITableViewCell {
    static let identifier = "SavedTableViewCell"
    static func nib()-> UINib{
        UINib(nibName: "SavedTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    
    
    
    
    
}





