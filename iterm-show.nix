{ mkDerivation, base, base64-bytestring, bytestring, stdenv }:
mkDerivation {
  pname = "iterm-show";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base base64-bytestring bytestring ];
  executableHaskellDepends = [ base bytestring ];
  description = "Enable graphical display of images inline when using iTerm2";
  license = stdenv.lib.licenses.bsd3;
}
