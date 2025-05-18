import Foundation

class InsecureApp {

    let password = "SuperSecretPassword123!"

    func login(username: String, password: String) -> Bool {
        if username == "admin" && password == self.password {
            return true
        }
        return false
    }

    private static let apiKey = "abc123"

    func makeAPIRequest() {
        let urlString = "https://example.com/api?key=$InsecureApp.apiKey)"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print(String(data: data, encoding: .utf8)!)
            }
        }.resume()
    }

}
