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
    
    var textButtonSaveOrDelete = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let playAttributed = NSAttributedString(string: textButtonSaveOrDelete, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25.0), NSAttributedString.Key.foregroundColor: UIColor.white])

        saveButton.setAttributedTitle(playAttributed, for: .normal)
        
      
        navigationItem.backButtonTitle = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        saveButton.titleLabel?.font = .systemFont(ofSize: 10)
      
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
    
    
    @IBAction func headToheadButtonPressed(_ sender: UIButton) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "HeadToHeadViewController") as? HeadToHeadViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.firstId = homeId
            vc.secondId = awayId
            vc.homeLogoLink = homeLogoLink
            vc.awaylogoLink = awaylogoLink
            vc.title = "H2H"
//            vc.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
    
    func loadAlert(){
        let alertUpdating = UIAlertController(title: "Updating saved data", message: "Please wait...", preferredStyle: .alert)
        
        alertUpdating.view.tintColor = UIColor.black
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10,y: 5,width: 50, height: 50)) as UIActivityIndicatorView
        loadingIndicator.hidesWhenStopped = true
        
        loadingIndicator.startAnimating()
        
        alertUpdating.view.addSubview(loadingIndicator)
        
        self.present(alertUpdating, animated: true) {
            self.dismiss(animated: true, completion: {
                let alertMessage = UIAlertController(title: "", message: "Saved events has been updated", preferredStyle: .alert)
                alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alertMessage, animated: true, completion: nil)
            })
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        if buttons[2].titleLabel?.text == "Save"{
            let infoBaseRealm = InfoBaseRealm()
            infoBaseRealm.fixtersId = self.fixtersId
            infoBaseRealm.homeLogoLink = self.homeLogoLink
            infoBaseRealm.awayLogoLink = self.awaylogoLink
            infoBaseRealm.homaName = self.homeTeamName
            infoBaseRealm.awayName = self.awayTeamName
            infoBaseRealm.homePoint = self.homePoint
            infoBaseRealm.awayPoint = self.awayPoint
            infoBaseRealm.date = self.dataText
            infoBaseRealm.yearText = self.yearText
            infoBaseRealm.homeId = self.homeId
            infoBaseRealm.awayId = self.awayId
            infoBaseRealm.season = self.season
            infoBaseRealm.league = self.league
            try? self.realm?.write{
                self.realm?.add(infoBaseRealm, update: .all)
            }

            loadAlert()
        } else if buttons[2].titleLabel?.text == "Delete"{
            realmDelete(idObjToDel: self.fixtersId)
            self.navigationController?.popViewController(animated: true)
            }
        


        if SetingsViewController().userSettingsVibration.bool(forKey: "onOffKey"){
            UIDevice.vibrate()
            print("vibrate on")
        } else{
            return
        }
        
    }
    
    func realmDelete(idObjToDel: Int) {
            do {
              let realm = try Realm()
              let object = realm.objects(InfoBaseRealm.self).first
              try! realm.write {
                if let obj = object {
                  realm.delete(obj)
                }
              }
            } catch let error as NSError {
              // handle error
             
            }
          }
}
            
            
            
            
        
    
