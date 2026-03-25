let
  omen15 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINofodqXvKreO1iGsAlgBekVgre4V987+mTiYCyqochG";
in
{
  "secret1.age".publicKeys = [ omen15 ];
}