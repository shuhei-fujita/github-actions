#!/bin/bash

# 作業ディレクトリに移動（GitHub Actionsでは通常'/github/workspace'です）
cd $GITHUB_WORKSPACE

# nbdimeをインストール
pip install nbdime

# リモートリポジトリから最新の情報を取得
git fetch origin

# 差分があるNotebookファイルを確認して、それぞれの差分を表示
for notebook in $(git diff --name-only $BEFORE_COMMIT $AFTER_COMMIT | grep '.ipynb$'); do
    nbdiff <(git show $BEFORE_COMMIT:$notebook) <(git show $AFTER_COMMIT:$notebook)
done
