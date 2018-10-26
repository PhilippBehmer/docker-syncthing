# Simple Syncthing container

To run this container you should add a persistent volume and open at least port 22000 for the file-sync protocol.

# Example

    docker run -d --restart=always \
      -v /persistent-storage/data:/home/syncthing \
      -p 22000:22000 \  # Sync protocol
      -p 8384:8384 \    # Web GUI
      --name syncthing \
      philippbehmer/syncthing
