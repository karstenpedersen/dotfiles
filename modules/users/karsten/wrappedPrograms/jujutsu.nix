{ self, inputs, ... }:

{
  perSystem =
    { pkgs, ... }:
    let
      user = self.meta.users.karsten;
    in
    {
      packages.jujutsu = inputs.wrapper-modules.wrappers.jujutsu.wrap {
        inherit pkgs;

        settings = {
          user.name = user.githubName;
          user.email = user.email;

          ui.default-command = "log";
        };
      };
    };
}