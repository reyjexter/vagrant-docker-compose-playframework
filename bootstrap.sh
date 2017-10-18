add-apt-repository ppa:openjdk-r/ppa -y

apt-get update
apt-get install -y --force-yes python-software-properties
apt-get install -y --force-yes git

apt-get install -y --force-yes openjdk-8-jdk
update-alternatives --config java
update-alternatives --config javac
update-ca-certificates -f

cd /vagrant/
./sbt clean dependencies
./sbt run