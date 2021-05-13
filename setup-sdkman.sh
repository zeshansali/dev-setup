#!/bin/bash

source ./colors.sh

# install sdkman
curl -s "https://get.sdkman.io" | bash \
&& source ~/.sdkman/bin/sdkman-init.sh \
&& successfully_installed "sdkman"

# install java 8
java_version=$(sdk ls java | grep "8.*adpt" | awk '{ print $NF }' | head -n 1)
yes | sdk i java ${java_version} \
&& successfully_installed "java"


# install scala 2.13
scala_version=$(sdk list scala | awk '{ print $1 }' | grep '^2' | head -n 1)
yes | sdk i scala ${scala_version} \
&& successfully_installed "scala"

# install groovy sdk
sdk install groovy \
&& successfully_installed "groovy"
