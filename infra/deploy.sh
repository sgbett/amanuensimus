#!/usr/bin/env bash
# Repeatable content deploy for amanuensimus.com.
# Syncs the site to the origin bucket and invalidates the CloudFront cache.
# One-time provisioning is recorded in infra/README.md.
# The OG image www/og.png is generated from assets/og-card.html (headless Chrome).
set -euo pipefail

BUCKET=amanuensimus-site
DIST_ID=E3MTERUUI9KKDW

# HTML is short-lived so edits appear quickly.
aws s3 cp www/index.html "s3://$BUCKET/index.html" \
  --content-type "text/html; charset=utf-8" \
  --cache-control "max-age=300"

# Static assets (favicon, OG image, …) — longer cache; content-type auto-detected.
aws s3 sync www/ "s3://$BUCKET/" \
  --exclude "index.html" \
  --cache-control "max-age=86400"

aws cloudfront create-invalidation --distribution-id "$DIST_ID" --paths "/*" \
  --query "Invalidation.{Id:Id,Status:Status}" --output table
