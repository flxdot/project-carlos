###########
# grafana #
###########

wget https://dl.grafana.com/oss/release/grafana_6.2.5_amd64.deb
sudo dpkg -i grafana_6.2.5_amd64.deb

# grafana autostart
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable grafana-server

# start grafana
sudo /bin/systemctl start grafana-server
