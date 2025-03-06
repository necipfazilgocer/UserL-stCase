import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = MainPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        bindViewModel()
        viewModel.fetchUsers()
    }
    
    private func bindViewModel() {
           viewModel.update = { [weak self] in
               DispatchQueue.main.async {
                   self?.tableView.reloadData()
               }
           }
       }
    
}



extension MainPageViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell") as! MainPageTableViewCell
        let user = viewModel.users[indexPath.row]
        cell.nameLabel.text = user.name
        cell.mailLabel.text = user.email
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetails", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? IndexPath
        let nextVC = segue.destination as! DetailsViewController
        nextVC.user = viewModel.users[index?.row ?? 0]
        
    }
    
}
