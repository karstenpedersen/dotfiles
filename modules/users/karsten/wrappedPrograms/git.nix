{ self, inputs, ... }:

{
  perSystem =
    { pkgs, ... }:
    let
      user = self.meta.users.karsten;
    in
    {
      packages.git = inputs.wrapper-modules.wrappers.git.wrap {
        inherit pkgs;

        settings = {
          user.name = user.githubName;
          user.email = user.email;
        };
      };
    };
}