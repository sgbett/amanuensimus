#!/usr/bin/env bash
# Repeatable content deploy for amanuensimus.com.
# Syncs the site to the origin bucket and invalidates the CloudFront cache.
# One-time provisioning is recorded in infra/README.md.
set -euo pipefail

BUCKET=amanuensimus-site
DIST_ID=E3MTERUUI9KKDW

# HTML is short-lived (max-age=300). When more asset types are added, switch to
# `aws s3 sync` with per-type cache-control rather than a single cp.
aws s3 cp www/index.html "s3://$BUCKET/index.html" \
  --content-type "text/html; charset=utf-8" \
  --cache-control "max-age=300"

aws cloudfront create-invalidation --distribution-id "$DIST_ID" --paths "/*" \
  --query "Invalidation.{Id:Id,Status:Status}" --output table
