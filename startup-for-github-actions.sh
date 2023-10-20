#!/bin/bash

# 自分自身に実行権限を付与
chmod +x /app/startup.sh

cd /app  # 作業ディレクトリを/appに設定

# 以降は同じ
if [ -d .git ]; then
    pip install nbdime
    git fetch origin
    BEFORE_COMMIT=${{ github.event.before }}
    AFTER_COMMIT=${{ github.event.after }}
    for notebook in $(git diff --name-only $BEFORE_COMMIT $AFTER_COMMIT | grep '.ipynb$'); do
        nbdiff <(git show $BEFORE_COMMIT:$notebook) <(git show $AFTER_COMMIT:$notebook)
    done
else
    echo 'Not a git repository'
fi
tail -f /dev/null
