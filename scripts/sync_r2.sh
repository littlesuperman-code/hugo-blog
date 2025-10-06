#!/bin/bash
set -a
source .env
set +a

aws s3 sync static/images s3://$CF_BUCKET_NAME \
  --endpoint-url https://$CF_ACCOUNT_ID.r2.cloudflarestorage.com \
  --profile r2 \
  --size-only \
  --exclude ".DS_Store"

echo "✅ 增量同步完成：static/images → R2/$BUCKET_NAME"
