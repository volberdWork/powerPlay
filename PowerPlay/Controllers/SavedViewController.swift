import UIKit
import Alamofire
class SavedViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    var array: [Response] = []
    var firstId = 0
    var secondId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        headToHeadData()
        
        
    }
    
    
    
    func configure(){
        view.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        tableView.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        tableView.register(SavedTableViewCell.nib(), forCellReuseIdentifier: SavedTableViewCell.identifier )
    }
    
    func headToHeadData(){
        let url = "https://v3.football.api-sports.io/fixtures/headtohead?h2h=33-34"
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}
