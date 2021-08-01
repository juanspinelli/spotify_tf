FROM ghcr.io/conradludgate/spotify-auth-proxy
RUN export SPOTIFY_CLIENT_REDIRECT_URI=http://localhost:27228/spotify_callback