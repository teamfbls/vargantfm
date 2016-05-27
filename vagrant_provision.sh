sudo apt-get update

echo "Installing Apache.."

sudo apt-get install -y apache2

echo "Installing Tomcat.."

sudo apt-get install -y tomcat7

echo "Installing Tomcat7 docs.."

sudo apt-get install -y tomcat7-docs

echo "Installing Tomcat7 administration webapps.."

sudo apt-get install -y tomcat7-admin

echo "Installing Tomcat7 examples webapps.."

sudo apt-get install tomcat7-examples

echo "Installing Git.."

sudo apt-get install -y git  git-core

git clone https://github.com/teamfbls/FabulousCar.git



echo "Installing Maven.."

sudo apt-get install -y maven

echo "Install JDK8"
 sudo add-apt-repository -y ppa:webupd8team/java
 sudo apt-get update
 sudo apt-get -y upgrade
 echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections 
 echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
 sudo apt-get -y install oracle-java8-installer

 
echo "Preparing MySQL"

sudo apt-get install debconf-utils -y > /dev/null
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
echo "Installing MySQL"
apt-get install mysql-server -y > /dev/null

mysql -u root --password=root < FabulousCar/autover.sql

sudo cp FabulousCar/Fbls.war /var/lib/tomcat7/webapps
sudo service tomcat7 restart