function brewski {
    brew update
    brew upgrade
    brew cleanup -s
    brew doctor
    brew missing
}

