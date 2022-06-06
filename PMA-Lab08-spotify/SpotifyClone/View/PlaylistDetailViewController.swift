//
//  PlaylistDetailViewController.swift
//  SpotifyClone
//
//  Created by MAC46 on 20/05/22.
//

import UIKit
import SDWebImage

class PlaylistDetailViewController: UIViewController {
    
    let playlistDetailViewModel = PlaylistDetailViewModel()
    
    var id: String? = nil
    
    // si va antes es un outlet
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblFollowers: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await setUpData()
        }
        setUpTable()
    }
    func setUpData() async {
        await playlistDetailViewModel.getPlaylistDetail(id: id!)
        
        let detail = playlistDetailViewModel.playlistDetail
        lblTitle.text = detail?.name
        lblDescription.text = detail?.description
        lblFollowers.text = HelperString.setFormatNumber(number: detail?.followers.total ?? 0)
        tableView.reloadData()
    }
    
    func setUpTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    //si va despues del viewDidload es un action
    @IBAction func onTappedBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension PlaylistDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return playlistDetailViewModel.playlistDetail?.tracks.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemPlaylistDetailTableViewCell
        
        let playlist = playlistDetailViewModel.playlistDetail?.tracks.items[indexPath.row].track.album
                
        cell.lblName.text = playlist?.name
//        cell.lblAuthor.text = playlist?.artist[0].name
        cell.coverImage.sd_setImage(with: URL(string: (playlist?.images[0].url)!))
                
        return cell
    }
}
