# My Modern & Minimalist Dotfiles

```
    ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
    ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
    ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
    ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
    ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
    ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
```

Bienvenidos a mi repositorio de configuraciones personales. Este es un entorno de escritorio altamente personalizado para Linux (Arch Linux) diseñado con un enfoque absoluto en la utilidad real, la eficiencia diaria y la optimización del flujo de trabajo guiado por teclado. Cada módulo y herramienta ha sido seleccionado y configurado para maximizar el rendimiento y la productividad en la terminal, anteponiendo la practicidad y la solidez técnica sobre cualquier adorno superficial.

> [!NOTE]
> Esto es para mi uso personal, pero sientete libre de "tomar inspiracion" (lease: robarte todo lo que te guste) jajajaja.

---

## Tech Stack & Highlights

*   **Window Manager:** [Hyprland](https://hyprland.org/) configurado de forma modular 100% en [Lua](https://www.lua.org/) (aprovechando las capacidades nativas v0.55+).
*   **Terminal:** [Ghostty](https://ghostty.org/) GPU-accelerated con shaders personalizados para el cursor (cursor_tail.glsl).
*   **Dynamic Theme Engine:** [Matugen](https://github.com/Inotia00/Matugen) (Material You) para generar esquemas de color dinámicos basados en el wallpaper activo.
*   **Shell & Command Line:** [Zsh](https://www.zsh.org/) + [Zinit](https://github.com/zdharma-continuum/zinit) (gestor de plugins) + [Starship](https://starship.rs/) Prompt + [Fzf-Tab](https://github.com/Aloxaf/fzf-tab) + [Zoxide](https://github.com/ajeetds/zoxide).
*   **Panel / Barra Superior:** [Quickshell](https://quickshell.gitlab.io/quickshell/) desarrollado en QML/QtQuick, con lectura en tiempo real del esquema de colores de [Matugen](https://github.com/Inotia00/Matugen).
*   **Multiplexer:** [Tmux](https://github.com/tmux/tmux) potenciado con [Sesh](https://github.com/joshmedeski/sesh) + [Gum](https://github.com/charmbracelet/gum) para flujos de trabajo veloces y autoguardado de sesiones.
*   **Gestor de Enlaces:** [GNU Stow](https://www.gnu.org/software/stow/) para un despliegue limpio y modular.

---

## Mapa de los Dotfiles

Así está estructurada la configuración modular de mi entorno:

```
.
├── dunst/              # Notificaciones del sistema minimalistas y consistentes
├── ghostty/            # Terminal GPU de Rust + shaders dinámicos y temas automáticos
├── git/                # Configuración de Git portable y segura (GPG/SSH mediante config.local)
├── hypr/               # Entorno Hyprland modularizado en Lua con scripts de cambio de wallpaper
├── install.sh          # Script interactivo de automatización y despliegue (Stow / TPM)
├── kanata/             # Remapeador de teclado inteligente a nivel de sistema
├── matugen/            # Plantillas de Material You para colorear Ghostty, Tmux, Neovim, etc.
├── nvim/               # Neovim (Editor principal con lazy.nvim e ignorado de lockfiles)
├── quickshell/         # Panel superior interactivo en QML sincronizado con Matugen
├── rofi/               # Menú de aplicaciones y selector de wallpapers con tema Material You
├── starship/           # Prompt de terminal moderno, rápido e informativo
├── tmux/               # Multiplexor de terminales con TPM, resurrect, continuum y comandos pop-up
├── yazi/               # Navegador de archivos en terminal ultra-rápido en Rust
└── zsh/                # Zsh supercargada con alias, exports limpios y secretos protegidos
```

---

## Instalacion y Despliegue Rapido

He creado un instalador robusto para automatizar toda la configuración, incluyendo la creación de directorios base del sistema (~/.config, ~/.local/opt, etc.), el bootstrap de variables privadas seguras y la instalación automática de gestores de plugins (como TPM para Tmux).

Para instalar todo de una sola vez:

1.  Clona este repositorio en tu directorio de inicio:
    ```bash
    git clone https://github.com/santiagohernandezs/dotfiles.git ~/dotfiles
    ```
2.  Entra al directorio y dale permisos de ejecución al script:
    ```bash
    cd ~/dotfiles
    chmod +x install.sh
    ```
3.  Ejecuta el script:
    ```bash
    ./install.sh
    ```

---

## Privacidad por Diseño (Security First)

Este repositorio utiliza una arquitectura de configuración dividida para asegurar la confidencialidad de datos sensibles:
*   **Git:** Utiliza un archivo git/.config/git/config.local para almacenar tu firma de commits SSH, nombre y correo real.
*   **Zsh:** Utiliza un archivo zsh/.config/zsh/.zsh_secrets para almacenar tus llaves de API (como Gemini API) y tokens.
*   **Temas Dinámicos:** Los archivos autogenerados de color por Matugen están agregados a .gitignore para evitar conflictos en git status al cambiar de wallpaper.

Ambos archivos de secretos se autogeneran a partir de plantillas .example durante la instalación y están estrictamente ignorados por Git para que nunca los subas a la nube por error.
