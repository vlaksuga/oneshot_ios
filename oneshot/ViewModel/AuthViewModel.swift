//
//  AuthViewModel.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/25.
//

import Firebase
import GoogleSignIn

class AuthViewModel : ObservableObject {
    
    let db = Firestore.firestore()
    
    enum SignInState {
        case reg
        case firebaseSignIn
        case appSignIn
        case signOut
    }
    
    @Published var accountId : String = "NOACCOUNTID"
    @Published var state : SignInState = .reg
    @Published var me : Account = Account()
    
    
    func checkFirebaseAuth() {
        guard let uid = Auth.auth().currentUser?.uid else {
            self.state = .signOut
            return
        }
        self.accountId = uid
        self.state = .firebaseSignIn
    }
    
    func checkFirestoreAccount() {
        DispatchQueue.main.async {
            self.db.collection("accounts").document(self.accountId).getDocument { snapshot, error in
                if error == nil {
                    self.me = snapshot.map({ doc in
                        return Account(
                            id: doc.documentID,
                            accountId: doc["accountId"] as? String ?? "NOACCOUNTID",
                            accountName: doc["accountName"] as? String ?? "NOACCOUNTNAME",
                            accountSearchHint: doc["accountSearchHint"] as? [String] ?? []
                        )
                    }) ?? Account()
                    self.state = .appSignIn
                } else {
                    print(error.debugDescription)
                }
            }
        }
    }
    
    func getAccount() {
        DispatchQueue.main.async {
            self.db.collection("accounts").document(self.accountId).getDocument { snapshot, error in
                if error == nil {
                    self.me = snapshot.map { doc in
                        return Account(
                            id: doc.documentID,
                            accountId: doc["accountId"] as? String ?? "NOACCOUNTID",
                            accountName: doc["accountName"] as? String ?? "NOACCOUNTNAME",
                            accountSearchHint: doc["accountSearchHint"] as? [String] ?? ["NOACCOUNTSEARCHHINT"])
                    } ?? Account()
                    self.state = .appSignIn
                } else {
                    print(error.debugDescription)
                }
            }
        }
    }
    
    
    func firestoreCreateAccount(accountName name : String, searchHint hints : [String]) {
        let data = [
            "accountId" : self.accountId,
            "accountName" : name,
            "accountSearchHint" : hints
        ] as [String : Any]
        
        DispatchQueue.main.async {
            self.db.collection("accounts").document(self.accountId).setData(data) { error in
                if error == nil {
                    self.getAccount()
                } else {
                    print(error.debugDescription)
                }
            }
        }
    }
    
    func googleLogIn() {
      if GIDSignIn.sharedInstance.hasPreviousSignIn() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
            firebaseAuthSignIn(for: user, with: error)
        }
      } else {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let configuration = GIDConfiguration(clientID: clientID)
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
        
        GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
          firebaseAuthSignIn(for: user, with: error)
        }
      }
    }
    
    private func firebaseAuthSignIn(for user: GIDGoogleUser?, with error: Error?) {
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
      
      let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
      
      Auth.auth().signIn(with: credential) { [unowned self] (res, error) in
        if let error = error {
          print(error.localizedDescription)
        } else {
            guard let uid = res?.user.uid else { return }
            self.accountId = uid
            self.state = .firebaseSignIn
        }
      }
    }

}
