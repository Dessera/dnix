{
  default = final: prev: {
    plasma-widgets = {
      andromeda-launcher = prev.stdenvNoCC.mkDerivation (finalAttrs: {
        name = "AndromedaLauncher";
        src = prev.fetchFromGitHub {
          owner = "EliverLara";
          repo = "AndromedaLauncher";
          rev = "5d6b2beda79519a86cbede0110408790a87d683b";
          hash = "sha256-N6rS7zlcRDvaKWeGQTR0FgaqGyf7ExN1cfWL0Wz+YgE=";
        };
        installPhase = ''
          runHook preInstall
          mkdir -p $out/share/plasma/plasmoids/AndromedaLauncher
          cp -r ./* $out/share/plasma/plasmoids/AndromedaLauncher/
          runHook postInstall
        '';
        passthru.updateScript = prev.nix-update-script { };
      });
    };

    plasma-panel-colorizer = prev.plasma-panel-colorizer.overrideAttrs (_: {
      postInstall = ''
        chmod +x -R $out/share/plasma/plasmoids/luisbocanegra.panel.colorizer/contents/ui/tools/
      '';
    });
  };
}
