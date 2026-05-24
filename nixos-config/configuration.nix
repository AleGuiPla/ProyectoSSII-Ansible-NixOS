{ config, pkgs, ... }:

{
  imports =
    [ # Resultado del escaneo del hardware.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Definir hostname

  # Guest additions para maquina virtual en virtual-box
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.clipboard = true;

  # Activar acceso a la red mediante NetworkManager
  networking.networkmanager.enable = true;

  # Zona horaria
  time.timeZone = "Europe/Madrid";

  # Opciones de idioma y locale
  i18n.defaultLocale = "es_ES.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Activar sistema de ventanas x11
  services.xserver.enable = true;

  # Activar entorno de escritorio KDE Plasma
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configurar el teclado en x11
  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };

  # Configurar el teclado en consola
  console.keyMap = "es";

  # Activar sonido mediante pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Definir una cuenta de usuario. Configurar contraseña con "passwd"!!!
  users.users.alumno = {
    isNormalUser = true;
    description = "alumno";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ # Lista de paquetes instalados para el usuario
      kdePackages.kate
    ];
  };

  # Instalar firefox
  programs.firefox.enable = true;

  # Lista de paquetes instalados en el sistema
  environment.systemPackages = with pkgs; [

  ];

  system.stateVersion = "25.11"; # Version de instalación de la máquina

}
