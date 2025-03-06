
// MARK: - MainPageViewModel

class MainPageViewModel{
    
    var users: [User] = []
    var update: (() -> Void)?
      
      func fetchUsers() {
          APIService.shared.fetchUsers { [weak self] result in
              switch result {
              case .success(let users):
                  self?.users = users
                  self?.update?()
              case .failure(let error):
                  print("Error fetching users: \(error)")
              }
          }
      }
}
