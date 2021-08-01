terraform {
  required_providers {
    spotify = {
      version = "~> 0.1.7"
      source  = "conradludgate/spotify"
    }
  }
}

variable "spotify_api_key" {
  type        = string
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_search_track" "by_artist" {
  artists = ["Limp Bizkit"]
}

resource "spotify_playlist" "playlist" {
  name        = "Test2"
  description = "Creacion de playlist usando el provider de Terraform"
  public      = true

  tracks = [
    data.spotify_search_track.by_artist.tracks[4].id,
    data.spotify_search_track.by_artist.tracks[7].id,
    data.spotify_search_track.by_artist.tracks[2].id,
    data.spotify_search_track.by_artist.tracks[5].id,
  ]
}

output "playlist_url" {
  value       = "https://open.spotify.com/playlist/${spotify_playlist.playlist.id}"
}