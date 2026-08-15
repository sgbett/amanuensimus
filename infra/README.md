# Infrastructure — amanuensimus.com

Static site: a private S3 origin behind CloudFront, with ACM/TLS and Route53 apex + www.
Deliberately minimal, following the sgbett-com *pattern* (S3 + CloudFront, `index.html` root, HTML `max-age=300`) — the pattern only; no code was shared.

## Serving model

- `https://amanuensimus.com` is canonical.
- `www.amanuensimus.com` 301-redirects to the apex, via the CloudFront function in `www-redirect.js`.
- `.org` / `.net` are registered and parked; not yet served (301 them to `.com` when desired).

## Live resources (account 777069377324)

| Resource | Value |
|---|---|
| Origin bucket (private) | `amanuensimus-site` |
| Origin Access Control | `EUTAZWU86XD3A` |
| ACM certificate (us-east-1) | `…/18eea307-d74d-4c6f-a400-37cebd91e0f8` — SANs: `amanuensimus.com`, `www.amanuensimus.com` |
| CloudFront distribution | `E3MTERUUI9KKDW` → `d1lo93p7x210fq.cloudfront.net` |
| CloudFront function | `amanuensimus-www-redirect` (viewer-request; www → apex 301) |
| Route53 hosted zone | `Z01276241SGQ6XQ8NSL64` |

## Files

- `distribution-config.json` — the CloudFront distribution config, as created.
- `www-redirect.js` — the viewer-request redirect function source.
- `deploy.sh` — repeatable content deploy (upload + cache invalidation).

## Deploy (repeatable)

```sh
./infra/deploy.sh
```

## One-time provisioning (already applied; recorded for reproducibility)

1. Private bucket + full public-access block.
2. ACM certificate (us-east-1), DNS-validated through the Route53 zone.
3. Origin Access Control; CloudFront function created and published.
4. Distribution created from `distribution-config.json`.
5. Bucket policy scoped to the distribution ARN (OAC read access only).
6. Route53 apex + www `A`/`AAAA` aliases pointed at the distribution.

## Known follow-ups

- The manifesto's "read further" doors are disabled until VISION and ETHICS are published as web pages.
- No access logging is configured (kept minimal); add later if wanted.
