{ ... }:

{
  # Enable CUPS to print documents
  services.printing.enable = true;
  
  hardware.printers = {
    # ...
  };
}
