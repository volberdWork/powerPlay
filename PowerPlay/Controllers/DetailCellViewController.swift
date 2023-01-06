import UIKit
import Kingfisher
import RealmSwift


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
    
    @IBOutlet var saveButton: UIButton!
    let realm = try? Realm()
    
    var fixtersId = 0
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
    var awayId = 0
    var homeId = 0
    var season = 0
    var league = 0
  
    
    
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
        saveButton.backgroundColor = .red
    }
    
    
    @IBAction func headToheadButtonPressed(_ sender: UIButton) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "HeadToHeadViewController") as? HeadToHeadViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.firstId = homeId
            vc.secondId = awayId
            vc.homeLogoLink = homeLogoLink
            vc.awaylogoLink = awaylogoLink
            vc.title = "H2H"
        }
        if SetingsViewController().userSettingsVibration.bool(forKey: "onOffKey"){
            UIDevice.vibrate()
            print("vibrate on")
        } else{
            return
        }
        
    }
    
    @IBAction func standingsPressed(_ sender: UIButton) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "StandingsViewController") as? StandingsViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.season = season
            vc.leagueId = league
            
        }
        if SetingsViewController().userSettingsVibration.bool(forKey: "onOffKey"){
            UIDevice.vibrate()
            print("vibrate on")
        } else{
            return
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        let infoBaseRealm = InfoBaseRealm()
        infoBaseRealm.fixtersId = self.fixtersId
        infoBaseRealm.homeLogoLink = self.homeLogoLink
        infoBaseRealm.awayLogoLink = self.awaylogoLink
        infoBaseRealm.homaName = self.homeTeamName
        infoBaseRealm.awayName = self.awayTeamName
        infoBaseRealm.homePoint = self.homePoint
        infoBaseRealm.awayPoint = self.awayPoint
        infoBaseRealm.date = self.dataText
        
        try? self.realm?.write{
            self.realm?.add(infoBaseRealm, update: .all)
        }
        if saveButton.backgroundColor != .green{
            saveButton.backgroundColor = .green
        }
        if SetingsViewController().userSettingsVibration.bool(forKey: "onOffKey"){
            UIDevice.vibrate()
            print("vibrate on")
        } else{
            return
        }
    }
}

