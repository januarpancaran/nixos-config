{
  programs.waybar.style = '' 
    * {
      border: none;
      border-radius: 0;
      font-family: SpaceMono Nerd Font;
      min-height: 20px;
    }
    
    window#waybar {
      background: transparent;
    }
    
    #workspaces {
      margin-right: 8px;
      border-radius: 10px;
      transition: none;
      color: #cdd6f4;
      background: #1e1e2e;
      border-style: solid;
      border-width: 2px;
      border-color: #cba6f7;
    }
    
    #workspaces button {
      transition: none;
      color: #cdd6f4;
      background: transparent;
      font-size: 12px;
    }
    
    #workspaces button.persistent {
      color: #cdd6f4;
      font-size: 12px;
    }
    
    #workspaces button:hover {
      transition: none;
      box-shadow: inherit;
      text-shadow: inherit;
      border-radius: inherit;
      color: #1e1e2e;
      background: #cba6f7;
    }
    
    #workspaces button.active {
      color: #1e1e2e;
      background-color: #cba6f7;
      margin-right: 8px;
      border-radius: 8px;
      transition: none;
    }
    
    #workspaces button.urgent {
      background-color: #cba6f7;
      color: #1e1e2e;
      margin-right: 8px;
      border-radius: 8px;
      transition: none;
    }
    
    #clock {
      padding-left: 16px;
      padding-right: 16px;
      border-radius: 10px;
      transition: none;
      color: #cdd6f4;
      background: #1e1e2e;
      border-style: solid;
      border-width: 2px;
      border-color: #cba6f7;
    }
    
    #window, #mpris, #pulseaudio, #bluetooth, #network, #backlight, #battery, #custom-notification, #tray {
      margin-right: 8px;
      padding-left: 16px;
      padding-right: 16px;
      border-radius: 10px;
      transition: none;
      color: #cdd6f4;
      background: #1e1e2e;
      border-style: solid;
      border-width: 2px;
      border-color: #cba6f7;
    }
    
    #custom-power {
      margin-right: 8px;
      padding-left: 16px;
      padding-right: 16px;
      border-radius: 10px;
      transition: none;
      color: #1e1e2e;
      background: #cba6f7;
    }
    
    #battery.charging {
      color: #1e1e2e;
      background-color: #cba6f7;
    }
    
    #battery.warning:not(.charging) {
      background-color: #cba6f7;
      color: #1e1e2e;
    }
    
    #battery.critical:not(.charging) {
      background-color: #cba6f7;
      color: #1e1e2e;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }
    
    @keyframes blink {
      to {
        background-color: #ffffff;
        color: #000000;
      }
    }
  '';
}
