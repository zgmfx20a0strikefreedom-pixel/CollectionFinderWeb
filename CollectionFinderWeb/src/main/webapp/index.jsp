<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CollectionFinder - 大量画像一括編集＆写真集生成ツール</title>
    <style>
        :root {
            --primary-color: #4f46e5;
            --primary-hover: #4338ca;
            --bg-color: #0f172a;
            --card-bg: #1e293b;
            --text-main: #f8fafc;
            --text-sub: #94a3b8;
            --border-color: #334155;
        }
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-main);
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 5%;
            border-bottom: 1px solid var(--border-color);
        }
        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: #fff;
        }
        .logo span { color: var(--primary-color); }
        .hero {
            text-align: center;
            padding: 80px 20px;
            max-width: 800px;
            margin: 0 auto;
        }
        .hero h1 {
            font-size: 2.8rem;
            margin-bottom: 20px;
            background: linear-gradient(to right, #818cf8, #c084fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .hero p {
            font-size: 1.1rem;
            color: var(--text-sub);
            margin-bottom: 40px;
        }
        .download-btn {
            background-color: var(--primary-color);
            color: white;
            padding: 15px 40px;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 8px;
            text-decoration: none;
            transition: background 0.3s;
            box-shadow: 0 4px 14px rgba(79, 70, 229, 0.4);
            display: inline-block;
        }
        .download-btn:hover {
            background-color: var(--primary-hover);
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        .section-title {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 40px;
        }
        .grid-3 {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            margin-bottom: 60px;
        }
        .card {
            background-color: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 10px;
            padding: 30px;
        }
        .card h3 { color: #818cf8; margin-top: 0; }
        .release-box {
            background-color: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: 40px;
            margin-bottom: 60px;
        }
        .version-badge {
            background-color: rgba(129, 140, 248, 0.2);
            color: #818cf8;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: bold;
        }
        footer {
            text-align: center;
            padding: 40px;
            color: var(--text-sub);
            border-top: 1px solid var(--border-color);
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

    <header>
        <div class="logo">Collection<span>Finder</span></div>
        <div>
            <a href="https://github.com" target="_blank" style="color: var(--text-sub); text-decoration: none;">GitHub Repository</a>
        </div>
    </header>

    <div class="hero">
        <h1>大量の画像を、一瞬で思い通りに。</h1>
        <p>ドラッグ＆ドロップで視覚的に並び替え、リネーム・リサイズ・JPEG圧縮・ウォーターマーク付与をボタン一つで一括処理。写真集の作成も驚くほど短時間に。</p>
        <!-- DBから取得したダウンロードURLを反映 -->
        <a href="${release.downloadUrl}" class="download-btn">今すぐダウンロード (${release.versionName})</a>
    </div>

    <div class="container">
        <h2 class="section-title">使い方 (3ステップ)</h2>
        <div class="grid-3">
            <div class="card">
                <h3>1. ドラッグ＆ドロップ</h3>
                <p>処理したい大量の画像をアプリ画面にまとめて放り込みます。視覚的なグリッドで直感的に並び替えが可能です。</p>
            </div>
            <div class="card">
                <h3>2. 一括設定</h3>
                <p>リネームルール、リサイズ寸法、圧縮率、ウォーターマークのデザインをまとめて設定します。</p>
            </div>
            <div class="card">
                <h3>3. ワンクリック生成</h3>
                <p>ボタンを押すだけで、すべての画像に一括処理を実行。綺麗な写真集や整理済みフォルダが即座に完成します。</p>
            </div>
        </div>

        <!-- PostgreSQLからSELECTして表示する部分 -->
        <div class="release-box">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                <h2 style="margin: 0;">最新リリース情報</h2>
                <span class="version-badge">${release.versionName}</span>
            </div>
            <p style="color: var(--text-sub); margin-bottom: 15px;">リリース日: ${release.releaseDate}</p>
            <div style="background: var(--bg-color); padding: 20px; border-radius: 8px; border: 1px solid var(--border-color);">
                ${release.releaseNotes}
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 CollectionFinder Project. All rights reserved.</p>
    </footer>

</body>
</html>