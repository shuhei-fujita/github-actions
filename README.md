## Jupyter Notebook の差分チェックの実行方法

### ローカル環境での実行

1. **Docker Compose ファイルの配置**: `docker-compose.yaml` と `startup.sh` をプロジェクトのルートディレクトリに配置します。

2. **スクリプトの実行権限**: `startup.sh` に実行権限を付与します。
    ```bash
    chmod +x startup.sh
    ```

3. **Docker Compose の起動**: 以下のコマンドで Docker Compose を起動します。
    ```bash
    docker-compose up -d
    ```

4. **コンテナ内での操作**: コンテナに入り、`/app` ディレクトリで Notebook の差分を確認します。
    ```bash
    docker-compose exec notebook-test /bin/bash
    ```

### GitHub Actions での自動実行

1. **GitHub Actions 設定ファイルの配置**: `notebook-diff-check.yaml` を `.github/workflows/` ディレクトリに配置します。

2. **プルリクエストの作成**: `.ipynb` ファイルに変更を加えた後、プルリクエストを作成します。

3. **自動チェック**: プルリクエスト作成時に GitHub Actions が自動的に Notebook の差分をチェックします。

以上の手順で、ローカル環境と GitHub Actions で Jupyter Notebook の差分を確認できます。
