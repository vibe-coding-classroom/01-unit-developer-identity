針對 `01-unit-developer-identity` (開發者身分) 的 **Assignments (作業)**，在 GitHub Classroom 的部署與管理有其特殊性（因為部分任務涉及個人主頁設定），以下是具體的作業部署建議：

### 🎯 作業 1：打造數位身分通行證 (Digital Profile)

這部分的作業是讓學生在 GitHub Classroom 產生的私有/公開倉庫中進行「練習」，並最終同步回他們個人的「特殊倉庫」。

*   **範本倉庫 (Template Repository)**：
    *   提供一個 `README.md` 作為骨架。
    *   建議包含一個 `/assets/` 資料夾，引導學生練習**上傳頭像或個人圖片**並正確引用路徑。
*   **自動評分 (Autograding) 設置**：
    *   **Markdown 語法檢核**：確認學生是否有練習到「連結 (Link)」與「清單 (List)」。
    *   **腳本建議**：使用 `grep` 比對 `README.md` 是否包含超連結語法 `[` 與 `]`，以及是否有更新範本內容。
*   **評語標準 (Rubric)**：
    *   [ ] 排版是否清晰？
    *   [ ] 導師連結檢視：點開學生提交的 `Profile Link` 看看個人頁面是否有如期呈現。

### 🚀 作業 2：發射第一個訊號 (Hello World)

這個任務的特殊點在於學生需要「手動建立」一個獨立於 Classroom 的 `hello-world` 倉庫。

*   **部署技巧：URL 連結回傳法**：
    *   在 Classroom 作業倉庫中預留一個 `submission.md` 檔案。
    *   要求學生將他們手動建立的 `https://github.com/[UserName]/hello-world` 連結貼回 `submission.md`。
*   **進階自動化檢測**：
    *   您可以設置一個 Action，讀取 `submission.md` 中的 URL，並使用 `curl -I` 指令檢查該連結是否真實存在且為 **Public (200 OK)**。
    *   這能讓學生體會到「自動化整合測試」的雛形。

### 📋 綜合管理建議

1.  **回饋機制 (Feedback Pull Request)**：
    *   開啟 GitHub Classroom 的 **"Feedback Pull Request"** 功能。
    *   導師可以直接在學生的 Markdown 代碼上留言，點評其選圖或排版的細節，建立良好的技術溝通習慣。
2.  **安全性確認 (2FA)**：
    *   雖然無法透過 Git 腳本百分之百確認學生是否開啟了 2FA。
    *   可以要求學生在 `README.md` 的末尾寫下一句：「我已完成兩步驟驗證並保存了恢復代碼」，作為口頭切結。

### 總結給導師的部署建議清單：
| 作業目標 | 建議部署方式 | 評量關鍵項目 |
| :--- | :--- | :--- |
| **Markdown 練習** | Classroom Template | 語法標籤 (H1, Li, Link) |
| **資源管理** | Assets Folder | 圖片路徑引用是否正確 |
| **開源精神** | External Hello-world Repo | 倉庫是否真正設為 Public |
| **數位身分** | Special Repo README | 頭像與個人 Bio 完整度 |

透過這種「Classroom 框架」+「外部手動建庫」的組合，既能利用系統的收集之便，又能讓學生學到真實 GitHub 環境的操作。
