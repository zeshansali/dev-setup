NO_COLOR='\033[0m'
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN_ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT_GREY='\033[0;37m'
DARK_GREY='\033[1;30m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
WHITE='\033[1;37m'

print_comment_block() {
    local color=${1}
    local message=${2}

    echo -e "${color}
##########################
#
#  -> ${message}
#
####################################################
${NO_COLOR}"
}

successfully_configured() {
    local message=${1}

    print_comment_block ${GREEN} "SUCCESSFULLY CONFIGURED: ${message}"
}

successfully_installed() {
    local message=${1}

    print_comment_block ${GREEN} "SUCCESSFULLY INSTALLED: ${message}"
}