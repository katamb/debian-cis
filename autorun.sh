apt-get update
apt-get upgrade -y
apt-get install git -y
git clone https://github.com/katamb/debian-cis.git
cd debian-cis
cp debian/default /etc/default/cis-hardening
sed -i "s#CIS_ROOT_DIR=.*#CIS_ROOT_DIR='$(pwd)'#" /etc/default/cis-hardening
#./bin/hardening.sh --audit-all-enable-passed --allow-unsupported-distribution
./bin/hardening.sh --set-hardening-level 4 --allow-unsupported-distribution
./bin/hardening.sh --apply --allow-unsupported-distribution
