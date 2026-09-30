package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class ReleaseDao {
    // 接続情報はご自身の環境に合わせて変更してください
    private final String URL = "jdbc:postgresql://localhost:5432/your_database_name";
    private final String USER = "postgres";
    private final String PASS = "your_password";

    public Map<String, String> getLatestRelease() {
        Map<String, String> releaseInfo = new HashMap<>();
        String sql = "SELECT version_name, release_date, release_notes, download_url FROM app_releases WHERE is_latest = TRUE";

        // PostgreSQLのJDBCドライバー読み込み
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            if (rs.next()) {
                releaseInfo.put("versionName", rs.getString("version_name"));
                releaseInfo.put("releaseDate", rs.getString("release_date"));
                releaseInfo.put("releaseNotes", rs.getString("release_notes"));
                releaseInfo.put("downloadUrl", rs.getString("download_url"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            releaseInfo.put("versionName", "v0.93"); // エラー時のフォールバック
            releaseInfo.put("releaseDate", "2026-06-01");
            releaseInfo.put("releaseNotes", "データベース接続エラーのためサンプル表示です。");
            releaseInfo.put("downloadUrl", "#");
        }

        return releaseInfo;
    }
}