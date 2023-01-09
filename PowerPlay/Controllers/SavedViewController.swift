import UIKit
import Alamofire
import Kingfisher
import RealmSwift
class SavedViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    let realm = try? Realm()
    var realmArray: [InfoBaseRealm] = []
    var awaylogoLink = ""
    var homeLogoLink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.realmArray = []
        guard let infoMatchesResult = realm?.objects(InfoBaseRealm.self) else {return}
        for match in infoMatchesResult{
            self.realmArray.append(match)
        }
        self.tableView.reloadData()
        
    }
    func configure(){
        view.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        tableView.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        tableView.register(SavedTableViewCell.nib(), forCellReuseIdentifier: SavedTableViewCell.identifier )
    }
    
}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realmArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SavedTableViewCell") as? SavedTableViewCell else { return UITableViewCell() }
        let data = realmArray[indexPath.row]
        cell.selectionStyle = .none
        cell.awaylogoLink = data.awayLogoLink
        cell.homelogoLink = data.homeLogoLink
        cell.homeNameLabel.text = data.homaName
        cell.dateLabel.text = data.date
        cell.pointsLabel.text = ""
        cell.awayNameLabel.text = data.awayName
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}

