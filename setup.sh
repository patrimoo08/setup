#!/bin/bash

#initial update packages
apt-get update

#install git
#grab latest version of git and store as variable
gitlatest=$(apt-cache policy git | awk '/Candidate/ {print $2;}')
#grab installed version of git and store as variable
gitversion=$(apt-cache policy git | awk '/Installed/ {print $2;}')
#if the two versions match, print the version else install
    if [ "$gitversion" ==  "$gitlatest" ]
        then echo "$gitversion"
        else apt-get install -y git
        echo "$gitversion"
    fi

#install go
#grab latest version of go and store as variable
golatest=$(apt-cache policy golang | awk '/Candidate/ {print $2;}')
#grab installed version of go and store as variable
goversion=$(apt-cache policy golang | awk '/Installed/ {print $2;}')
#if the two versions match, print the version else install
    if [ "$goversion" ==  "$golatest" ]
        then echo "$goversion"
        else apt-get install -y golang
        echo "$goversion"
    fi

#install docker
#grab latest version of docker and store as variable
dockerlatest=$(apt-cache policy docker.io | awk '/Candidate/ {print $2;}')
#grab installed version of docker and store as variable
dockerversion=$(apt-cache policy docker.io | awk '/Installed/ {print $2;}')
#if the two versions match, print the version else install
    if [ "$dockerversion" ==  "$dockerlatest" ]
        then echo "$dockerversion"
        else apt-get install -y docker.io
        echo "$dockerversion"
    fi

#install fzf
#grab latest version of fzf and store as variable
fzflatest=$(apt-cache policy fzf | awk '/Candidate/ {print $2;}')
#grab installed version of fzf and store as variable
fzfversion=$(apt-cache policy fzf | awk '/Installed/ {print $2;}')
#if the two versions match, print the version else install
    if [ "$fzfversion" ==  "$fzflatest" ]
        then echo "$fzfversion"
        else apt-get install -y fzf
        echo "$fzfversion"
    fi

#add kubectl to repo
apt-get update && apt-get install -y apt-transport-https gnupg2
apt-get install -y curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
#install kubectl
#grab latest version of kubectl and store as variable
kubectllatest=$(apt-cache policy kubectl | awk '/Candidate/ {print $2;}')
#grab installed version of kubectl and store as variable
kubectlversion=$(apt-cache policy kubectl | awk '/Installed/ {print $2;}')
#if the two versions match, print the version else install
    if [ "$kubectlversion" ==  "$kubectllatest" ]
        then echo "$kubectlversion"
        else apt-get install -y kubectl
        echo "$kubectlversion"
    fi 

#kind install
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.8.1/kind-linux-amd64
chmod +x ./kind
#FIGURE OUT KIND VERIFY VERSION

#install nodejs
#grab latest version of nodejs and store as variable
nodejslatest=$(apt-cache policy nodejs | awk '/Candidate/ {print $2;}')
#grab installed version of nodejs and store as variable
nodejsversion=$(apt-cache policy nodejs | awk '/Installed/ {print $2;}')
#if the two versions match, print the version else install
    if [ "$nodejsversion" ==  "$nodejslatest" ]
        then echo "$nodejsversion"
        else apt-get install -y nodejs
        echo "$nodejsversion"
    fi

#add terraform repo
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt install -y software-properties-common
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update 

#install terraform
#grab latest version of terraform and store as variable
terraformlatest=$(apt-cache policy terraform | awk '/Candidate/ {print $2;}')
#grab installed version of terraform and store as variable
terraformversion=$(apt-cache policy terraform | awk '/Installed/ {print $2;}')
#if the two versions match, print the version else install
    if [ "$terraformversion" ==  "$terraformlatest" ]
        then echo "$terraformversion"
        else apt-get install -y terraform
        echo "$terraformversion"
    fi

#install VS Code
apt-get install -y wget
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get install apt-transport-https
apt-get update
apt-get install -y code
#code acts funny on docker windows in ubuntu

#install terminology
#grab latest version of terminology and store as variable
terminologylatest=$(apt-cache policy terminology | awk '/Candidate/ {print $2;}')
#grab installed version of terminology and store as variable
terminologyversion=$(apt-cache policy terminology | awk '/Installed/ {print $2;}')
#if the two versions match, print the version else install
    if [ "$terminologyversion" ==  "$terminologylatest" ]
        then echo "$terminologyversion"
        else apt-get install -y terminology
        echo "$terminologyversion"
    fi