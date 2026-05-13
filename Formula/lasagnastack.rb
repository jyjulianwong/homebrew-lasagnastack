class Lasagnastack < Formula
  desc "An AI pipeline that turns raw video clips into an editable CapCut project for short-form reel editing."
  homepage "https://github.com/jyjulianwong/LasagnaStack"
  url "https://files.pythonhosted.org/packages/source/l/lasagnastack/lasagnastack-1.0.1.tar.gz"
  sha256 "143ef6f9cc90397f33c8d9496ef0f70d0dfddd3f33c4f2f1b4262919483c580b"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install_and_link buildpath
  end

  def caveats
    <<~EOS
      lasagnastack requires a Gemini API key at runtime:

        export LSNSTK_LLM_GEMINI_API_KEY="your-api-key"

      Get a key at https://aistudio.google.com/apikey
    EOS
  end

  test do
    system bin/"lasagnastack", "--help"
  end
end
