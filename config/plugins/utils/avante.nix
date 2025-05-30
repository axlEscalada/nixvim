{
  plugins.avante = {
    enable = true;
    settings = {
      provider = "gemini";
      gemini = {
        # model = "gemini-2.0-pro-exp-02-05";
        model = "gemini-2.0-flash";
        # model = "gemini-1.5-pro";
        temperature = 0;
        max_tokens = 4096;
      };
      # provider = "deepseek";
      # vendors = {
      #   deepseek = {
      #     __inherited_from = "openai";
      #     api_key_name = "DEEPSEEK_API_KEY";
      #     endpoint = "https://api.deepseek.com";
      #     model = "deepseek-coder";
      #   };
      # };
    };
  };
}
