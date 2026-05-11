class Lasagnastack < Formula
  desc "An AI pipeline that turns raw video clips into an editable CapCut project for short-form reel editing."
  homepage "https://github.com/jyjulianwong/LasagnaStack"
  url "https://files.pythonhosted.org/packages/source/l/lasagnastack/lasagnastack-0.1.0.tar.gz"
  sha256 "7433f1f584aaa16540631dbd7ea668b59d66871995b541386bd26d51212a3756"
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
