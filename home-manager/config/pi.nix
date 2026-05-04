{ config, pkgs, lib, ... }:

# Pi coding agent (https://pi.dev) extensions, skills, and prompt templates.
# Pi auto-discovers from ~/.pi/agent/{extensions,skills,prompts}; we symlink
# from this repo so customizations are version-controlled.
#
# settings.json is intentionally NOT managed here — `pi install` and `/settings`
# mutate it at runtime, which conflicts with read-only nix-store symlinks.

{
  home.file.".pi/agent/extensions" = {
    source = ../../pi/extensions;
    recursive = true;
  };
  home.file.".pi/agent/skills" = {
    source = ../../pi/skills;
    recursive = true;
  };
  home.file.".pi/agent/prompts" = {
    source = ../../pi/prompts;
    recursive = true;
  };
}
