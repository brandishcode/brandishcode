{
  jdt-language-server,
  lib,
  jdk17,
  jdk24,
  ...
}:
let
  projectName = lib.nixvim.mkRaw "vim.fn.expand('~/.workspaces/') .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')";
  rootDir = lib.nixvim.mkRaw "vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])";
  javaSE17 = {
    name = "JavaSE-17";
    path = "${jdk17}/lib/openjdk";
  };
  javaSE24 = {
    name = "JavaSE-24";
    path = "${jdk24}/lib/openjdk";
    default = true;
  };
in
{
  plugins.jdtls = {
    enable = true;
    jdtLanguageServerPackage = jdt-language-server;
    settings = {
      cmd = [
        "${jdt-language-server}/bin/jdtls"
        "-data"
        projectName
      ];
      inherit rootDir;
      settings = {
        java = {
          configuration = {
            runtimes = [
              javaSE17
              javaSE24
            ];
          };
        };
      };
    };
  };
  plugins.conform-nvim = {
    settings.formatters_by_ft = {
      # java = [ javaformatter ];
    };
  };
}
