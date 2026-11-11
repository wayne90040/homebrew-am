class Am < Formula
  desc "終端機選單與本機網站，管理 Claude Code 的服務商與模型設定"
  homepage "https://github.com/wayne90040/AM"
  version "1.2.0"

  on_macos do
    on_arm do
      url "https://github.com/wayne90040/AM/releases/download/v1.2.0/am-macos-arm64.zip"
      sha256 "e6b5daab1e05eeec4f254611ea8a9347106449f0ab5f1b86b27cba2e332a6f05"
    end
    on_intel do
      url "https://github.com/wayne90040/AM/releases/download/v1.2.0/am-macos-x64.zip"
      sha256 "20299def554c9c9a236846ccbdbcd8d7dd97fba322e6160e8dffb3594dd179d5"
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
      開機自動執行管理網站（建議 Homebrew 使用者改用這個，不要再用 `am autostart`，避免兩份開機設定互相衝突）：
        brew services start am
        brew services stop am

      移除前建議先執行（停止管理網站與開機自動執行；設定會保留在 ~/.am）：
        am uninstall --keep-config --yes
      再執行：
        brew uninstall am
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/am --version")
  end
end
