{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        # Use window manager's recommended size
        dimensions = {
          columns = 0;
          lines = 0;
        };

        option_as_alt = "Both";

        padding = {
          x = 4;
          y = 4;
        };

        # Spread additional padding evenly around the terminal content.
        dynamic_padding = true;

        # Allow terminal applications to change Alacritty's window title.
        dynamic_title = true;

        decorations = "Buttonless";
      };

      scrolling = { multiplier = 3; };

      # Font configuration
      font = {
        size = 14;
        normal.family = "JetBrainsMono Nerd Font";
        normal.style = "Light";
        bold.family = "JetBrainsMono Nerd Font";
        bold.style = "Bold";
        italic.family = "JetBrainsMono Nerd Font";
        italic.style = "Italic";
        offset = {
          y = 3; # increase line height
        };
      };

      # Colors (Gruvbox dark)
      colors = {
        # Default colors
        primary = {
          # hard contrast: background = '0x1d2021'
          background = "#000000";
          # soft contrast: background = '0x32302f'
          foreground = "#c5c8c6";
          bright_foreground = "#ffffff";
        };

        cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };

        search = {
          matches = {
            foreground = "#44475a";
            background = "#50fa7b";
          };
          focused_match = {
            foreground = "#44475a";
            background = "#ffb86c";
          };
        };
        footer_bar = {
          background = "#282a36";
          foreground = "#f8f8f2";
        };
        hints = {
          start = {
            foreground = "#282a36";
            background = "#f1fa8c";
          };
          end = {
            foreground = "#f1fa8c";
            background = "#282a36";
          };
        };

        selection = {
          text = "CellForeground";
          background = "#44475a";
        };

        # Normal colors
        normal = {
          black = "#282A2E";
          red = "#A54242";
          green = "#8C9440";
          yellow = "#DE935F";
          blue = "#5F819D";
          magenta = "#85678F";
          cyan = "#5E8D87";
          white = "#707880";
        };

        # Bright colors
        bright = {
          black = "#373B41";
          red = "#CC6666";
          green = "#B5BD68";
          yellow = "#F0C674";
          blue = "#81A2BE";
          magenta = "#B294BB";
          cyan = "#8ABEB7";
          white = "#C5C8C6";
        };
      };

      # Bell
      bell = {
        animation = "EaseOutExpo";
        duration = 100;
        color = "#999999";
      };

      # Regex hints
      #
      # Terminal hints can be used to find text in the visible part of the terminal
      # and pipe it to other applications.
      hints = {
        # Keys used for the hint labels.
        #alphabet: "jfkdls;ahgurieowpq"

        # List with all available hints
        #
        # Each hint must have a `regex` and either an `action` or a `command` field.
        # The fields `mouse`, `binding` and `post_processing` are optional.
        #
        # The fields `command`, `binding.key`, `binding.mods`, `binding.mode` and
        # `mouse.mods` accept the same values as they do in the `key_bindings` section.
        #
        # The `mouse.enabled` field controls if the hint should be underlined while
        # the mouse with all `mouse.mods` keys held or the vi mode cursor is above it.
        #
        # If the `post_processing` field is set to `true`, heuristics will be used to
        # shorten the match if there are characters likely not to be part of the hint
        # (e.g. a trailing `.`). This is most useful for URIs.
        #
        # Values for `action`:
        #   - Copy
        #       Copy the hint's text to the clipboard.
        #   - Paste
        #       Paste the hint's text to the terminal or search.
        #   - Select
        #       Select the hint's text.
        #   - MoveViModeCursor
        #       Move the vi mode cursor to the beginning of the hint.
        enabled = [{
          regex = ''
            (ipfs:|ipns:|magnet:|mailto:|gemini:|gopher:|https:|http:|news:|file:|git:|ssh:|ftp:)[^\u0000-\u001F\u007F-\u009F<>"\\s{-}\\^⟨⟩`]+'';
          command = "open";
          post_processing = true;
          mouse = {
            enabled = true;
            mods = "None";
          };
          binding = {
            key = "U";
            mods = "Control|Shift";
          };
        }];
      };

      # Mouse bindings
      #
      # Available fields:
      #   - mouse
      #   - action
      #   - mods (optional)
      #
      # Values for `mouse`:
      #   - Middle
      #   - Left
      #   - Right
      #   - Numeric identifier such as `5`
      #
      # All available `mods` and `action` values are documented in the key binding
      # section.
      mouse.bindings = [{
        mouse = "Middle";
        action = "PasteSelection";
      }];

      mouse = {
        # Click settings
        #
        # The `double_click` and `triple_click` settings control the time
        # alacritty should wait for accepting multiple clicks as one double
        # or triple click.
        # If this is `true`, the cursor is temporarily hidden when typing.
        hide_when_typing = false;
      };

      selection = {
        semantic_escape_chars = '',│`|:"' ()[]{}<>'';

        # When set to `true`, selected text will be copied to the primary clipboard.
        save_to_clipboard = false;
      };

      cursor = {
        # Cursor style
        #
        # Values for `style`:
        #   - ▇ Block
        #   - _ Underline
        #   - | Beam
        style = "Block";

        # If this is `true`, the cursor will be rendered as a hollow box when the
        # window is not focused.
        unfocused_hollow = true;
      };

      # Live config reload (changes require restart)
      live_config_reload = true;

      # Shell
      #
      # You can set `shell.program` to the path of your favorite shell, e.g. `/bin/fish`.
      # Entries in `shell.args` are passed unmodified as arguments to the shell.
      #
      # Default:
      #   - (macOS) /bin/bash --login
      #   - (Linux) user login shell
      #   - (Windows) powershell
      shell = {
        program = "zsh";
        args = [ "--login" "-c" "tmux -u new-session -A -s 0-main" ];
      };

      # Send ESC (\x1b) before characters when alt is pressed.
      # alt_send_esc = false;

      # Key bindings
      #
      # Key bindings are specified as a list of objects. Each binding will specify a
      # key and modifiers required to trigger it, terminal modes where the binding is
      # applicable, and what should be done when the key binding fires. It can either
      # send a byte sequence to the running application (`chars`), execute a
      # predefined action (`action`) or fork and execute a specified command plus
      # arguments (`command`).
      #
      # Bindings are always filled by default, but will be replaced when a new binding
      # with the same triggers is defined. To unset a default binding, it can be
      # mapped to the `None` action.
      #
      # Example:
      #   `- { key: V, mods: Control|Shift, action: Paste }`
      #
      # Available fields:
      #   - key
      #   - mods (optional)
      #   - chars | action | command (exactly one required)
      #   - mode (optional)
      #
      # Values for `key`:
      #   - `A` -> `Z`
      #   - `F1` -> `F12`
      #   - `Key1` -> `Key0`
      #
      #   A full list with available key codes can be found here:
      #   https://docs.rs/glutin/*/glutin/enum.VirtualKeyCode.html#variants
      #
      #   Instead of using the name of the keys, the `key` field also supports using
      #   the scancode of the desired key. Scancodes have to be specified as a
      #   decimal number.
      #   This command will allow you to display the hex scancodes for certain keys:
      #     `showkey --scancodes`
      #
      # Values for `mods`:
      #   - Command
      #   - Control
      #   - Option
      #   - Super
      #   - Shift
      #   - Alt
      #
      #   Multiple `mods` can be combined using `|` like this: `mods: Control|Shift`.
      #   Whitespace and capitalization is relevant and must match the example.
      #
      # Values for `chars`:
      #   The `chars` field writes the specified string to the terminal. This makes
      #   it possible to pass escape sequences.
      #   To find escape codes for bindings like `PageUp` ("\x1b[5~"), you can run
      #   the command `showkey -a` outside of tmux.
      #   Note that applications use terminfo to map escape sequences back to
      #   keys. It is therefore required to update the terminfo when
      #   changing an escape sequence.
      #
      # Values for `action`:
      #   - Paste
      #   - PasteSelection
      #   - Copy
      #   - IncreaseFontSizec
      #   - DecreaseFontSize
      #   - ResetFontSize
      #   - ScrollPageUp
      #   - ScrollPageDown
      #   - ScrollLineUp
      #   - ScrollLineDown
      #   - ScrollToTop
      #   - ScrollToBottom
      #   - ClearHistory
      #   - Hide
      #   - Quit
      #   - ClearLogNotice
      #   - SpawnNewInstance
      #   - ToggleFullscreen
      #   - None
      #
      # Values for `action` (macOS only):
      #   - ToggleSimpleFullscreen: Enters fullscreen without occupying another space
      #
      # Values for `command`:
      #   The `command` field must be a map containing a `program` string and
      #   an `args` array of command line parameter strings.
      #
      #   Example:
      #       `command: { program: "alacritty", args: ["-e", "vttest"] }`
      #
      # Values for `mode`:
      #   - ~AppCursor
      #   - AppCursor
      #   - ~AppKeypad
      #   - AppKeypad
      keyboard.bindings = [
        # (Windows/Linux only)
        #{ key = "V";            mods = "Control|Shift";    action = "Paste";            }
        #{ key = "C";            mods = "Control|Shift";    action = "Copy";             }
        #{ key = "Insert";       mods = "Shift";            action = "PasteSelection";   }
        #{ key = "Key0";         mods = "Control";          action = "ResetFontSize";    }
        #{ key = "Equals";       mods = "Control";          action = "IncreaseFontSize"; }
        #{ key = "Add";          mods = "Control";          action = "IncreaseFontSize"; }
        #{ key = "Subtract";     mods = "Control";          action = "DecreaseFontSize"; }
        #{ key = "Minus";        mods = "Control";          action = "DecreaseFontSize"; }
        #{ key = "Return";       mods = "Alt";              action = "ToggleFullscreen"; }

        # (macOS only)
        #{ key = "Key0";         mods = "Command";          action = "ResetFontSize";    }
        #{ key = "Equals";       mods = "Command";          action = "IncreaseFontSize"; }
        #{ key = "Add";          mods = "Command";          action = "IncreaseFontSize"; }
        #{ key = "Minus";        mods = "Command";          action = "DecreaseFontSize"; }
        #{ key = "K";            mods = "Command";          action = "ClearHistory";     }
        #{ key = "K";            mods = "Command";          chars = "\\x0c";             }
        #{ key = "V";            mods = "Command";          action = "Paste";            }
        #{ key = "C";            mods = "Command";          action = "Copy";             }
      ];
    };
  };
}
