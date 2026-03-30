# 企業級庫存管理系統資料庫設計 (Inventory Management System)

這是一個完整的後端資料庫開發專案，模擬企業內部的員工管理、供應商採購與產品訂單流程 [cite: 15]。本專案展示了複雜的資料庫正規化設計，並透過多個自定義的 **Stored Procedures (預存程序)** 實作自動化業務邏輯。

---

## 🛠 技術棧
* **資料庫**: MySQL 8.0+ [cite: 15]
* **建模工具**: MySQL Workbench [cite: 15]
* **核心技術**:
    * 預存程序 (Stored Procedures)
    * 遞迴查詢 (Recursive CTE)
    * 事務管理 (Transaction Control)
    * 雜湊加密與 Salt 機制 (Password Hashing & Salt)

---

## 📂 專案結構
```text
/
├── README.md                # 專案說明文件
├── Database_Model/
[cite_start]│   └── db_inventory_system.mwb    # 視覺化 EER 模型檔 [cite: 10]
└── SQL_Scripts/
    └── db_inventory_system.sql    # 包含 DDL、測試資料及預存程序

---

## 🌟 技術亮點與實作功能本專案整合了多項後端邏輯自動化，確保資料一致性與業務效率：

1. 庫存預警與自動化檢查 (sp_CheckInventory)
當建立產品訂單時，系統會自動比對所需零件的現有庫存 。若預期庫存低於設定的 Reorder Level，系統會自動在 Reorder_Alert_Log 插入警示紀錄並回傳建議 。

2. 組織架構遞迴查詢 (sp_ConfirmSupervisor)
使用 Recursive CTE 實作，可以從指定員工出發，向上追蹤其直屬及上層主管階層資訊 。

3. 安全身份驗證系統
    員工註冊 (sp_RegisterEmployee): 實作密碼雜湊與 Salt 儲存，確保使用者敏感資料的安全 。
    登入驗證 (sp_Login): 透過驗證雜湊值進行身份確認，並回傳對應的狀態代碼 。

4. 訂單狀態與流程控制 (sp_UpdateOrderStatus)
實作狀態機邏輯，嚴格控管採購與產品訂單的狀態流轉（如：待處理 -> 運輸中 -> 已完成），防止非法操作 。

🚀 快速開始
1. 確保環境已安裝 MySQL Server。
2. 進入 SQL_Scripts 目錄，執行以下指令匯入專案：
    Bashmysql -u your_username -p < db_inventory_system.sql
3. 匯入後，即可透過 CALL 指令測試各項預存程序功能，例如：
    SQLCALL sp_CheckInventory(1);
