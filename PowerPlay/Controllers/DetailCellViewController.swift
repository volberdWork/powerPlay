import UIKit
import Kingfisher
class DetailCellViewController: UIViewController {
    
    @IBOutlet var darkRectangle: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var yearView: UIView!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var leagueLabel: UILabel!
    @IBOutlet var seasonLabel: UILabel!
    @IBOutlet var homeImage: UIImageView!
    @IBOutlet var homeNameLabel: UILabel!
    @IBOutlet var pointLabel: UILabel!
    @IBOutlet var awayImage: UIImageView!
    @IBOutlet var awayNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var yearText = ""
    var leagueText = ""
    var seasonText = ""
    var homeImageId = ""
    var homeTeamName = ""
    var awayImageId = ""
    var awayTeamName = ""
    var dataText = ""
    var homePoint = 0
    var awayPoint = 0
    var awaylogoLink = ""
    var homeLogoLink = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        
        
    }
    
    
    
    func configure(){
        darkRectangle.layer.cornerRadius = 50
        yearView.layer.cornerRadius = 20
        for button in buttons{
            button.layer.cornerRadius = 12
        }
        darkRectangle.layer.masksToBounds = true
        darkRectangle.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        yearLabel.text = yearText
        leagueLabel.text = leagueText
        seasonLabel.text = seasonText
        homeNameLabel.text = homeTeamName
        awayNameLabel.text = awayTeamName
        dateLabel.text = dataText
        pointLabel.text = "\(homePoint):\(awayPoint)"
        awayImage.kf.setImage(with: URL(string: awaylogoLink))
        homeImage.kf.setImage(with: URL(string: homeLogoLink))
    }
    
}

