{
  plugins = {
    avante = {
      enable = true;
      settings = {
        provider = "claude";
        providers = {
          claude = {
            endpoint = "https://api.anthropic.com";
            model = "claude-sonnet-4-20250514";
            extra_request_body = {
              temperature = 0;
              max_tokens = 4096;
            };
          };
        };
        mappings = {
          diff = {
            ours = "co";
            theirs = "ct";
            none = "c0";
            both = "cb";
            next = "]x";
            prev = "[x";
          };
        };
        hints.enabled = true;
        windows = {
          wrap = true;
          width = 30;
          sidebar_header = {
            align = "center";
            rounded = true;
          };
        };
        highlights.diff = {
          current = "DiffText";
          incoming = "DiffAdd";
        };
        diff = {
          debug = false;
          autojump = true;
          list_opener = "copen";
        };
      };
    };
  };
}
