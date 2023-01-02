import UIKit
import Alamofire
import Kingfisher
class SavedViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    var array: [Response] = []
    var firstId = 0
    var secondId = 0
    var awaylogoLink = ""
    var homeLogoLink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        headToHeadData(first: firstId, second: secondId)
        
        
    }
    
    
    
    func configure(){
        view.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        tableView.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        tableView.register(SavedTableViewCell.nib(), forCellReuseIdentifier: SavedTableViewCell.identifier )
    }
    
    func headToHeadData(first: Int, second: Int){
        let url = "https://v3.football.api-sports.io/fixtures/headtohead?h2h=\(first)-\(second)"
        let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
        AF.request(url, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            do {
                let data = try decoder.decode(HeadToHeadBase.self, from: respponseData)
                self.array = data.response!
                self.tableView.reloadData()
                print(data)
            } catch {
                print("Щось пішло не так")
            }
            
        }
    }
    
    
    
    
}





extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SavedTableViewCell") as? SavedTableViewCell else { return UITableViewCell() }
        let data = array[indexPath.row]
        cell.selectionStyle = .none
        cell.awayNameLabel.text = data.teams?.away?.name ?? ""
        cell.homeNameLabel.text = data.teams?.home?.name ?? ""
        cell.dateLabel.text = changeDateFormat(dateString: (data.fixture?.date)!, fromFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toFormat: "dd MMMM HH:mm")
        cell.pointsLabel.text = "\(String(describing: data.goals?.home ?? 0)):\(String(describing: data.goals?.away ?? 0))"
        cell.awaylogoLink = data.teams?.away?.logo ?? ""
        cell.homelogoLink = data.teams?.home?.logo ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}

