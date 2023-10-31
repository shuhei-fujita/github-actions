#!/bin/bash

# 自分自身に実行権限を付与
chmod +x /app/startup.sh

cd /app  # 作業ディレクトリを/appに設定

# 以降は同じ
if [ -d .git ]; then
    pip install nbdime
    git fetch origin
    for notebook in $(git diff --name-only FETCH_HEAD HEAD | grep '.ipynb$'); do
    nbdiff <(git show FETCH_HEAD:$notebook) $notebook
    done
else
    echo 'Not a git repository'
fi
tail -f /dev/null
