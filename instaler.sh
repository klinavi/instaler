echo "Actualizando el sistema..."
sudo pacman -Syu --noconfirm

echo "Instalando paquetes esenciales..."
sudo pacman -S --needed --noconfirm git base-devel

echo "Instalando yay..."
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
else
    echo "yay ya está instalado."
fi

echo "Instalando paquetes oficiales de Arch..."
sudo pacman -S --needed --noconfirm - < paquetes.txt

echo "Instalando paquetes de AUR con yay..."
yay -S --needed --noconfirm - < paquetes_aur.txt

echo "Instalación completa. ¡Disfruta tu nuevo sistema!"
