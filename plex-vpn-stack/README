# Plex vpn stack

Forked from https://github.com/kubealex/k8s-mediaserver-operator.git

```bash
helm upgrade mediaserver ./plex-vpn-stack -n media -f plex-vpn-stack/values.yaml
```

- Add some indexers in Jackett, add password and configure to user flaresolver proxy (http://flaresolverr.media.svc.cluster.local:8191)
- Configure Sonarr (Series) and Radarr (Movies):
 - Settings -> Profile: add a profile with the desired qualities and order it based on your needs
 - Settings -> Custom Formats: add custom formats for preffering French for instance (langage, released title contain "FRENCH", "TRUEFRENCH", "VF", "VOF", "VFI", etc)
 - Settings -> Indexers: add indexers from Jackett (Torznab)
 - Settings -> Download Clients: add Transmission as download client (host: transmission.media.svc.cluster.local, port: 9091)
 - Configure passwords
- Go to Jellyfin, configure passwords and add media libraries pointing to /media/tv and /media/movies