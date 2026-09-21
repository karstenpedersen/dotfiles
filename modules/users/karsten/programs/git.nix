{ self, inputs, ... }:

{
  perSystem =
    { pkgs, ... }:
    let
      user = self.meta.users.karsten;
    in
    {
      packages.git = inputs.wrappers.wrappers.git.wrap {
        inherit pkgs;

        settings = {
          user.name = user.githubName;
          user.email = user.email;
        };
      };
    };
}
