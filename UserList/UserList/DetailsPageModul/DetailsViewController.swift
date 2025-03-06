
import UIKit

// MARK: Detay Sayfasında API Çağrısı veya Logic işlem yapılmadığı için ViewModel-Model-APIService katmanınlarına gerek duyulmadı.

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var webSiteLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = user?.name
        mailLabel.text = user?.email
        phoneNumberLabel.text = user?.phone
        webSiteLabel.text = user?.website
        
    }
  
}
