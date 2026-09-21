{ self, ... }:
{
  flake.wrappers.jujutsu =
    { wlib, ... }:
    let
      user = self.meta.users.karsten;
    in
    {
      imports = [ wlib.wrapperModules.jujutsu ];

      settings = {
        user.name = user.githubName;
        user.email = user.email;

        ui.editor = "hx";
        ui.default-command = "log";
      };
    };
}
