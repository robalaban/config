# Work MacBook — anything only this machine should get goes here.
# List options (homebrew.casks, environment.systemPackages, ...) merge
# with the shared config in darwin/.
{ ... }:
{
  networking = {
    hostName = "robert-work";
    localHostName = "robert-work";
    computerName = "robert-work";
  };
}
