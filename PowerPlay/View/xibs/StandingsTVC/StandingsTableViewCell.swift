import UIKit

class StandingsTableViewCell: UITableViewCell {
    

    @IBOutlet var rankLabel: UILabel!

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var logoTeam: UIImageView!

    
    @IBOutlet var playersLabel: UILabel!
    
    @IBOutlet var winLabel: UILabel!
    @IBOutlet var drawLabel: UILabel!
    
    @IBOutlet var goalsDiffLAbel: UILabel!
    @IBOutlet var ageinstLAbel: UILabel!
    @IBOutlet var forLabel: UILabel!
    @IBOutlet var loseLabel: UILabel!
    var logoLink = ""
    static let identifier = "StandingsTableViewCell"
    static func nib()-> UINib{
        UINib(nibName: "StandingsTableViewCell", bundle: nil)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        logoTeam.kf.setImage(with: URL(string: logoLink))
    }
    

        
    
}
