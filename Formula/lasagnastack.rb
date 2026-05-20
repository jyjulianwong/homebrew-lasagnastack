class Lasagnastack < Formula
  desc "An AI pipeline that turns raw video clips into an editable CapCut project for short-form reel editing."
  homepage "https://github.com/jyjulianwong/LasagnaStack"
  url "https://github.com/jyjulianwong/LasagnaStack/releases/download/v1.0.11/lasagnastack-macos-arm64.tar.gz"
  sha256 "768fe17703ec9c04338d5cd17701c4725477013c3754fdc117b8916602c5cf02"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "768fe17703ec9c04338d5cd17701c4725477013c3754fdc117b8916602c5cf02"
    sha256 cellar: :any_skip_relocation, sequoia:       "cfec0d7209bdd1dc294e138db283ff29e2d3502e82f3f75f49f9943c7f81c1e4"
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0000000000000000000000000000000000000000000000000000000000000000"
    sha256 cellar: :any_skip_relocation, sequoia:       "0000000000000000000000000000000000000000000000000000000000000000"
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
