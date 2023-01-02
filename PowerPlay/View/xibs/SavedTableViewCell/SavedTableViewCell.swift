import UIKit

class SavedTableViewCell: UITableViewCell {
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var leftImage: UIImageView!
    
    @IBOutlet var rightImage: UIImageView!
    
    @IBOutlet var pointsLabel: UILabel!
    
    @IBOutlet var homeNameLabel: UILabel!
    
    @IBOutlet var awayNameLabel: UILabel!
    
    
    
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





