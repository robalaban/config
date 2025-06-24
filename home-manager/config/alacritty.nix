{ config, pkgs, lib, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        decorations = "buttonless";
        opacity = 0.9;
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        size = 12;
      };
      colors = {
        primary = {
          background = "#282c34";
          foreground = "#abb2bf";
        };
        normal = {
          black = "#282c34";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#d19a66";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#abb2bf";
        };
        bright = {
          black = "#5c6370";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#d19a66";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#ffffff";
        };
      };
      cursor = {
        style = "Block";
        unfocused_hollow = true;
      };
      selection = {
        save_to_clipboard = true;
      };
      shell = {
        program = "zsh";
      };
    };
  };
} 