
import Foundation
import Alamofire


// MARK: - Networking

class APIService {
    static let shared = APIService()
    private let URL = "https://jsonplaceholder.typicode.com/users"
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        AF.request(URL).responseDecodable(of: [User].self) { response in
            switch response.result {
            case .success(let users):
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
