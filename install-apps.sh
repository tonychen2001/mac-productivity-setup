#!/usr/bin/env bash
declare -A productivityApps

# map to get the app name in brew
productivityApps[Alfred]="alfred"
productivityApps[AltTab]="alt-tab"
productivityApps[Dropzone]="dropzone"
productivityApps[HiddenBar]="hiddenbar"
productivityApps[Clipy]="clipy"

# loop to prompt user if they want to install each app
for app in "${!productivityApps[@]}"; do
    while true; do
        read -p "Do you wish to install ${app} (Y/n)? " yn
        case $yn in
            "" | Y | y )
                brew install --cask "${productivityApps[$app]}" || true
                break;;
            N | n )
                break;;
            * ) echo "Invalid input";;
        esac
    done
done

# install Oh My ZSH
while true; do
    read -p "Do you wish to install Oh My Zsh (Y/n)? " yn
    case $yn in
        "" | Y | y )
            sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
            break;;
        N | n )
            break;;
        * ) echo "Invalid input";;
    esac
done