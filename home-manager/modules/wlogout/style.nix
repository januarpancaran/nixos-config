{
  home.file.".config/wlogout/assets" = {
    source = ./assets;
    recursive = true;
  };

  programs.wlogout.style = ''
    * {
    	background-image: none;
    	box-shadow: none;
    }
    
    window {
    	background-color: rgba(12, 12, 12, 0.9);
    }
    
    button {
    	border-radius: 12px;
    	border-color: #cba6f7;
    	text-decoration-color: #cdd6f4;
    	color: #cdd6f4;
    	background-color: #1e1e2e;
    	border-style: solid;
    	border-width: 2px;
    	background-repeat: no-repeat;
    	background-position: center;
    	background-size: 25%;
    }
    
    button:focus,
    button:active,
    button:hover {
    	background-color: #cba6f7;
    	color: #1e1e2e;
    	outline-style: none;
    }
    
    #lock {
    	background-image: image(url("./assets/padlock.png"));
    }
    
    #logout {
    	background-image: image(url("./assets/logout.png"));
    }
    
    #suspend {
    	background-image: image(url("./assets/pause-button.png"));
    }
    
    #hibernate {
    	background-image: image(url("./assets/sleeping.png"));
    }
    
    #shutdown {
    	background-image: image(url("./assets/power-button.png"));
    }
    
    #reboot {
    	background-image: image(url("./assets/refresh.png"));
    }
  '';
}
