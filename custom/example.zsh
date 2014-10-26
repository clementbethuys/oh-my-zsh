# l'éditeur par défaut
export EDITOR=vim

# brew settings
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export HOMEBREW_GITHUB_API_TOKEN=$REPLACE_ME

# java settings (needed for EC2)
export JAVA_HOME=$(/usr/libexec/java_home)

# rbenv settings
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# EC2 command line tool settings
export EC2_HOME="$HOME/.aws/EC2"
export PATH="$EC2_HOME/bin:$PATH"

# Terraform path
export PATH="$HOME/.terraform/bin:$PATH"

export AWS_ACCESS_KEY=$REPLACE_ME
export AWS_SECRET_KEY=$REPLACE_ME

export EC2_REGION=us-east-1

# RUBY AWS SDK settings
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY

# RDS command line tool settings
export AWS_RDS_HOME="$HOME/.aws/RDS"
export PATH="$AWS_RDS_HOME/bin:$PATH"
export AWS_CREDENTIAL_FILE="$HOME/.aws/aws_credential.csv"

# AS command line tool settings
export AWS_AUTO_SCALING_HOME="$HOME/.aws/AS"
export PATH="$AWS_AUTO_SCALING_HOME/bin:$PATH"

# AWS key location (for chef knife.rb)
export AWS_KEY_NAME="clementkeypair"
export AWS_KEY_DIR="~/.aws"
export AWS_KEY_PATH="$AWS_KEY_DIR/$AWS_KEY_NAME"

# Virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Chef client with Vagrant
export chef_server_url='https://chef.filechat.com'
export validation_client_name='clement-validator'
export validation_key='.chef/clement-validator.pem'
export cookbook_path='/Users/clement/Documents/Repository/devops/chef_recipes'

# Alias
alias sshec2="ssh -i $AWS_KEY_PATH -l ubuntu "
alias moshec2="mosh --ssh='ssh -i ~/.aws/clementkeypair -l ubuntu'"
alias repo="cd /Users/clement/Documents/Repository/chef_recipes"
alias repo2="cd /Users/clement/Documents/Repository/chef_recipes-europe"
alias devops="cd /Users/clement/Documents/Repository/devops"
alias filechat="cd /Users/clement/Documents/Repository/filechat"
alias fcgrep='grep --exclude-dir _test --exclude-dir node_modules --exclude-dir public'
alias ipaws="aws ec2 describe-instances | jq '.Reservations[] | .Instances[].PrivateIpAddress'"
alias staging_bag="cd ~/Documents/Repository/chef_recipes && knife data bag show -F json --secret-file .chef/encrypted_data_bag_secret filechat staging && cd -"
alias prod_bag="cd ~/Documents/Repository/chef_recipes && knife data bag show -F json --secret-file .chef/encrypted_data_bag_secret filechat production && cd -"
alias staging_chef_version="cd ~/Documents/Repository/chef_recipes && knife environment show -F json staging  && cd -"
alias prod_chef_version="cd ~/Documents/Repository/chef_recipes && knife environment show -F json production && cd -"
alias version="cd ~/Documents/Repository/chef_recipes && knife data bag show -F json filechat version && cd -"

# Editor
export EDITOR=vim

alias perso='ssh perso.clementbethuys.fr'
alias nas='ssh 192.168.0.21'
alias coursera='cd "/Volumes/Macintosh HD/Documents/Cours/Coursera"'
alias repo='cd /Users/clement/Documents/Repository/chef_recipes'
alias bench='cd /Users/clement/Documents/Repository/devops/benchmark/lib/benchmark'
alias tmp='cd /Users/clement/Documents/Repository/tmp'
alias benchmark='cd /Users/clement/Documents/Repository/devops/benchmark'
alias sshec2='ssh -i ~/.aws/clementkeypair -l ubuntu '
alias encrypt='knife file encrypt -F json --secret-file ../../.chef/encrypted_data_bag_secret'
alias decrypt='knife file decrypt -F json --secret-file ../../.chef/encrypted_data_bag_secret'
alias listport='lsof -i -P | grep -i "listen"'

# shortcut to list aws instances
alias list-instances-id="aws ec2 describe-instances --region us-east-1 | jq '.Reservations[] | .Instances[] | .InstanceId'"
alias list-instances-ip="aws ec2 describe-instances --region us-east-1 | jq '.Reservations[] | .Instances[] |.NetworkInterfaces[] | .PrivateIpAddresses[] | .PrivateIpAddress '"

# Chef/Berkshelf SSL
export SSL_CERT_FILE=/Users/clement/Documents/Repository/chef_recipes/.chef/chef.h42.fr.pem

# Capstone import
export DYLD_LIBRARY_PATH=/usr/local/opt/capstone/lib/:$DYLD_LIBRARY_PATH

# For Check DK
#export PATH=/opt/chefdk/bin:/Users/clement/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/embedded/bin:$PATH
alias workchef='eval "$(chef shell-init bash)"'
# automatically run workchef for my chef directory
cd () {
  builtin cd "$@"
  parent_dir=$(dirname $PWD)
    case $parent_dir in
    /Users/clement/Documents/Repository/devops/chef_recipes/cookbooks ) workchef ;;
  esac
}
export SSL_CERT_FILE=/opt/chefdk/embedded/ssl/cert.pem

# Docker configuration
export DOCKER_HOST=tcp://127.0.0.1:2375
# export DOCKER_CERT_PATH=/Users/clement/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1

# to enter docker namespace
docker-enter() {
  boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
    boot2docker ssh -t sudo /var/lib/boot2docker/docker-enter "$@"
}
alias drun='docker run --rm -i -t'

# Go related settings
export GOROOT=`go env GOROOT`
export GOPATH="/Users/clement/Documents/go"
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
alias gowork='/Users/clement/Documents/go/src'

# to go in go repo quickly
gocd () { cd `go list -f '{{.Dir}}' $1` }

# function to swap accounts for aws command line tool
H43() {
  export AWS_ACCESS_KEY=$REPLACE_ME
  export AWS_SECRET_KEY=$REPLACE_ME
  export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY
  export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY
}

H42() {
  export AWS_ACCESS_KEY=$REPLACE_ME
  export AWS_SECRET_KEY=$REPLACE_ME
  export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY
  export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY
}
