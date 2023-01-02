import UIKit
import Alamofire
class StandingsViewController: UIViewController{
    
    
    @IBOutlet var tableView: UITableView!
    var array : [ResponseStandings] = []
    var leagueId = 0
    var season = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        standingsBase(league: 39, season: 2019)
    }
    
    
    
    func configure(){
        view.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        tableView.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        tableView.register(StandingsTableViewCell.nib(), forCellReuseIdentifier: StandingsTableViewCell.identifier )
    }
    
    
    
    func standingsBase(league: Int, season: Int){
        let url = "https://v3.football.api-sports.io/standings?league=\(league)&season=\(season)"
        let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
        AF.request(url, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            do {
                let data = try decoder.decode(StandingBase.self, from: respponseData)
                self.array = data.response!
                self.tableView.reloadData()
                print("Finish")
            } catch {
                print("Щось пішло не так")
            }
            
        }
    }
    
    
    
    
}









extension StandingsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StandingsTableViewCell") as? StandingsTableViewCell else { return UITableViewCell() }
        let data = array[indexPath.row].league?.standings
        cell.selectionStyle = .none
        cell.labelta.text = "YTYT"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
}
