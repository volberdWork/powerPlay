import UIKit

class StandingsTableViewCell: UITableViewCell {
    

    @IBOutlet var rankLabel: UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var logoTeam: UIImageView!
    static let identifier = "StandingsTableViewCell"
    static func nib()-> UINib{
        UINib(nibName: "StandingsTableViewCell", bundle: nil)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    

        
    
}
