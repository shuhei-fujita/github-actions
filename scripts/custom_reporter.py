import sys
import json

for line in sys.stdin:
    issue = json.loads(line)
    path = issue["source"]["file"]
    line = issue["source"]["line"]
    message = issue["message"]

    # GitHub Suggestionフォーマットに変換
    suggestion = f"```suggestion\n{message}\n```"

    print(f"::error file={path},line={line}::{suggestion}")
