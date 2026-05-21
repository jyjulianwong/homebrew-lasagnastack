class Lasagnastack < Formula
  desc "An AI pipeline that turns raw video clips into an editable CapCut project for short-form reel editing."
  homepage "https://github.com/jyjulianwong/LasagnaStack"
  license "MIT"

  on_arm do
    url "https://github.com/jyjulianwong/LasagnaStack/releases/download/v1.0.16/lasagnastack-1.0.16-macos-silicon.tar.gz"
    sha256 "c81c0441dde42b6db78ed7abc1461edcb9a91d5cf70a74a333a39608dd8fa3b9"
  end

  on_intel do
    url "https://github.com/jyjulianwong/LasagnaStack/releases/download/v1.0.16/lasagnastack-1.0.16-macos-intel.tar.gz"
    sha256 "ae26524b8be5d6399b246b0d092e4e4fd974e63852dc262accf3dd2ee352036c"
  end

  depends_on "ffmpeg"

  def install
    bin.install "lasagnastack"
  end

  def caveats
    <<~EOS
      ### Authentication

      You will need to provide your own API keys for the LLM APIs you use. The required API key depends on the value of `LSNSTK_LLM_MODEL`.

      #### Gemini (e.g. `gemini/gemini-2.5-flash`)

      Get a key at [aistudio.google.com/apikey](https://aistudio.google.com/apikey) and set it as an environment variable:

      ```bash
      export LSNSTK_LLM_MODEL=gemini/gemini-2.5-flash
      export LSNSTK_LLM_GEMINI_API_KEY=your-key-here
      ```

      #### OpenRouter (e.g. `openrouter/deepseek/deepseek-v3.2`)

      Get a key at [openrouter.ai/settings/keys](https://openrouter.ai/settings/keys) and set these environment variables:

      ```bash
      export LSNSTK_LLM_MODEL=openrouter/deepseek/deepseek-v3.2
      export LSNSTK_LLM_OPENROUTER_API_KEY=your-key-here
      ```
    EOS
  end

  test do
    system bin/"lasagnastack", "--help"
  end
end
