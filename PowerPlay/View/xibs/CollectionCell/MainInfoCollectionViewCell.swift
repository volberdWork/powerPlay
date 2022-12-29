import UIKit
import Kingfisher
class MainInfoCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet var firstView: UIView!
    @IBOutlet var dateView: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var leftImage: UIImageView!
    @IBOutlet var rightImage: UIImageView!
    @IBOutlet var firstComandLabel: UILabel!
    @IBOutlet var srcondComandLabel: UILabel!
    @IBOutlet var firstPointLabel: UILabel!
    @IBOutlet var secondPointLabel: UILabel!
    
    
    static let identifire = "MainInfoCollectionViewCell"
    
    
    static func nib()-> UINib{
        return UINib(nibName: "MainInfoCollectionViewCell", bundle: nil)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    // MARK: - Public Methods
    
    public func setupView(model: ResponseResult){
        self.dateLabel.text = changeDateFormat(dateString: (model.fixture?.date)!, fromFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toFormat: "dd.MM HH:mm")
        self.firstComandLabel.text = model.teams?.home?.name ?? ""
        self.srcondComandLabel.text = model.teams?.away?.name ?? ""
        self.leftImage.kf.setImage(with: URL(string: model.teams?.home?.logo ?? ""))
        self.rightImage.kf.setImage(with: URL(string: model.teams?.away?.logo ?? ""))
        self.secondPointLabel.text = "0"
        self.firstPointLabel.text = "0"
        dateView.layer.cornerRadius = 10
    }
    
    
    
    
}
