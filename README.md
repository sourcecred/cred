# SourceCred's Own Cred

This repository contains SourceCred's own cred instance.

Since our tooling for maintaining independent cred instances is still
nascent, the repo was generated (and may be re-generated) by running the
following from within a SourceCred clone:

```
./scripts/build_static_site.sh \
    --target "PATH_TO_THIS_REPOSITORY/docs" \
    --project @filecoin-project \
    --project @libp2p \
    --project @sourcecred \
    ;
```

replacing `PATH_TO_THIS_REPOSITORY` with the actual path.

You'll need to blow away the existing `docs` directory first.
