class Lasagnastack < Formula
  desc "An AI pipeline that turns raw video clips into an editable CapCut project for short-form reel editing."
  homepage "https://github.com/jyjulianwong/LasagnaStack"
  url "https://files.pythonhosted.org/packages/source/l/lasagnastack/lasagnastack-1.0.0.tar.gz"
  sha256 "37e63e90af568792055b44ff0f2bc6a2bc944be58209e78f279d92d4da752ec6"
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
