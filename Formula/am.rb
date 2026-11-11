class Am < Formula
  desc "終端機選單與本機網站，管理 Claude Code 的服務商與模型設定"
  homepage "https://github.com/wayne90040/AM"
  version "0.0.0"

  on_macos do
    on_arm do
      url "https://github.com/wayne90040/AM/releases/download/v0.0.0/am-macos-arm64.zip"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/wayne90040/AM/releases/download/v0.0.0/am-macos-x64.zip"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  depends_on :macos

  def install
    bin.install "am"
  end

  service do
    run [opt_bin/"am", "server"]
    keep_alive true
    log_path var/"log/am/server.log"
    error_log_path var/"log/am/server.log"
  end

  def caveats
    <<~EOS
      這是佔位版本，尚未被正式 release 覆蓋。請看 https://github.com/wayne90040/AM/releases
    EOS
  end
end
