#!/bin/bash

# Assignment 1 Check: Digital Profile
echo "--- Checking Assignment 1: Digital Profile ---"

# 1. Check for Links
if grep -E "\[.*\]\(.*\)" README.md > /dev/null; then
    echo "✅ Found links in README.md"
else
    echo "❌ No links found in README.md"
    exit 1
fi

# 2. Check for Lists
if grep -E "^[-*+] " README.md > /dev/null; then
    echo "✅ Found lists in README.md"
else
    echo "❌ No lists found in README.md"
    exit 1
fi

# 3. Check for Assets
if [ "$(ls -A assets/ 2>/dev/null)" ]; then
    echo "✅ Found files in assets/ folder"
else
    echo "❌ assets/ folder is empty or missing"
    exit 1
fi

# 4. Check for 2FA note
if grep -Ei "2FA|兩步驟驗證" README.md > /dev/null; then
    echo "✅ Found 2FA confirmation"
else
    echo "❌ Missing 2FA confirmation note"
    exit 1
fi

# Assignment 2 Check: Hello World Repo
echo "--- Checking Assignment 2: Hello World Repo ---"

# Extract URL from submission.md
URL=$(grep -Eo "https://github.com/[^ ]+/hello-world" submission.md | head -n 1)

if [ -z "$URL" ]; then
    echo "❌ No valid hello-world URL found in submission.md"
    exit 1
fi

echo "🔍 Checking URL: $URL"

# Check if URL exists and is public (200 OK)
STATUS=$(curl -o /dev/null -s -w "%{http_code}" -I "$URL")

if [ "$STATUS" == "200" ]; then
    echo "✅ Repository is public and accessible (200 OK)"
else
    echo "❌ Repository check failed with status: $STATUS (Ensure it is Public)"
    exit 1
fi

echo "🎉 All checks passed!"
exit 0
