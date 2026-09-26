class BohorRunner < Formula
  include Language::Python::Virtualenv

  desc "Decentralized execution runner for the Bohor autonomous coding fleet"
  homepage "https://bohor.com.au"
  url "https://github.com/gUBII/bohor-runner/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f1086c28a1d40faeca8538a96d0a2b17ff9dcaae490a2a832388e618a40706f6"
  license "Apache-2.0"
  head "https://github.com/gUBII/bohor-runner.git", branch: "main"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  service do
    run [opt_bin/"bohor-runner", "--headless"]
    keep_alive true
    log_path var/"log/bohor-runner.log"
    error_log_path var/"log/bohor-runner.error.log"
    working_dir var/"lib/bohor-runner"
  end

  test do
    assert_match "Bohor decentralized runner", shell_output("#{bin}/bohor-runner --help")
  end
end
