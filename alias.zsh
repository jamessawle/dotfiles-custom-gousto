#!/bin/zsh

######################
#  AWS Codeartifact  #
######################

alias npm-aws="aws sso login --profile codeartifact && export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain gousto --domain-owner 472493421475 --query authorizationToken --output text --profile codeartifact` && aws codeartifact login --tool npm --repository proxy-repository --domain gousto --domain-owner 472493421475 --profile codeartifact"
alias npm-reset="npm config set registry https://registry.npmjs.org/"
alias npm-rm="rm ~/.npmrc"

#########
#  Git  #
#########

alias gcbd="git checkout bento-develop"


#########
#  VPN  #
#########

function vpn() {
    if [ -f "$XDG_CONFIG_HOME/custom/.vpnconfig.tpl" ]; then
        # Delete .vpnconfig file after 30 seconds as it will contain raw credentials
        ((sleep 30 && rm $XDG_CONFIG_HOME/custom/.vpnconfig)&)
        op inject -i $XDG_CONFIG_HOME/custom/.vpnconfig.tpl -o $XDG_CONFIG_HOME/custom/.vpnconfig -f && sudo openfortivpn -c $XDG_CONFIG_HOME/custom/.vpnconfig
    else
        echo "'.vpnconfig.tpl' must be configured to run 'setup vpn' command"
    fi
}
