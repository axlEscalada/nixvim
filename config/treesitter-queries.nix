{
  extraFiles = {
    "after/queries/typescript/highlights.scm" = {
      text = ''
        ; This should make ALL identifiers red - very obvious test
        ((identifier) @error)
      '';
    };
  };
}
