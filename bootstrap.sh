#!/bin/ash

DROPBEAR_VERSION="2016.72"
GIT_VERSION="2.9.2"

apk --no-cache add \
    wget \
    autoconf \
    build-base \
    zlib-dev \
    linux-headers \
    ca-certificates \
    python \
    go

mkdir /build
cd /build

wget "https://github.com/mkj/dropbear/archive/DROPBEAR_$DROPBEAR_VERSION.tar.gz"
tar xfz "DROPBEAR_$DROPBEAR_VERSION.tar.gz"
cd "dropbear-DROPBEAR_$DROPBEAR_VERSION"
autoconf && autoheader
./configure --prefix=/opt/dropbear-static
STATIC=1 make
make install

cd ..

wget "https://github.com/git/git/archive/v$GIT_VERSION.tar.gz"
tar xfz "v$GIT_VERSION.tar.gz"
cd "git-$GIT_VERSION"
make configure
./configure --without-curl --without-expat --without-tcltk CFLAGS="-static" --prefix=/opt/git-static
make
make install

ln -sf /opt/git-static/bin/git-upload-pack /opt/git-static/libexec/git-core/git-upload-pack
ln -sf /opt/git-static/bin/git-shell       /opt/git-static/libexec/git-core/git-shell
ln -sf /opt/git-static/bin/git-cvsserver   /opt/git-static/libexec/git-core/git-cvsserver
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-pack-objects
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-remote
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-cherry
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-am
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-gc
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-bundle
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-replace
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-send-pack
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-config
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-cherry-pick
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-checkout-index
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-fetch-pack
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-grep
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-fetch
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-commit-tree
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-update-ref
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-clean
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-branch
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-init
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-ls-tree
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-prune
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-ls-files
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-reset
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-verify-commit
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-rerere
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-checkout
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-mktree
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-annotate
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-mailinfo
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-index-pack
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-rev-list
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-credential
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-show-ref
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-repack
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-show
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-get-tar-commit-id
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-name-rev
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-merge-ours
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-check-ignore
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-help
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-verify-pack
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-merge-index
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-merge-file
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-upload-archive
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-worktree
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-check-attr
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-check-mailmap
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-status
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-interpret-trailers
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-column
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-blame
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-show-branch
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-push
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-prune-packed
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-fmt-merge-msg
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-log
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-ls-remote
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-describe
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-format-patch
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-whatchanged
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-notes
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-stage
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-check-ref-format
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-clone
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-merge-tree
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-archive
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-for-each-ref
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-rev-parse
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-count-objects
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-diff
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-stripspace
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-commit
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-unpack-file
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-fsck
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-remote-fd
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-merge-recursive
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-receive-pack
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-merge
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-cat-file
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-mailsplit
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-pack-redundant
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-fsck-objects
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-init-db
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-reflog
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-revert
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-mktag
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-mv
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-fast-export
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-remote-ext
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-unpack-objects
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-hash-object
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-shortlog
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-apply
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-rm
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-submodule--helper
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-pack-refs
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-read-tree
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-var
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-add
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-diff-index
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-tag
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-update-index
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-pull
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-diff-tree
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-update-server-info
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-verify-tag
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-merge-base
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-merge-subtree
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-bisect--helper
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-write-tree
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-symbolic-ref
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-patch-id
ln -sf /opt/git-static/bin/git             /opt/git-static/libexec/git-core/git-diff-files
ln -sf /opt/git-static/bin/git             /opt/git-static/bin/git-upload-archive
ln -sf /opt/git-static/bin/git             /opt/git-static/bin/git-receive-pack

cd /opt/webhook-deploy
go build
rm *.go
chmod +x /opt/webhook-deploy/sshhelper.sh

for f in $(find /opt -type f -perm +111 -print); do 
    strip "$f" 2>/dev/null
done

rm -rf /build

apk del --purge \
    m4 \
    perl \
    autoconf \
    binutils-libs \
    binutils \
    gmp \
    isl \
    libgomp \
    libatomic \
    libgcc \
    pkgconf \
    pkgconfig \
    mpfr3 \
    mpc1 \
    libstdc++ \
    gcc \
    make \
    musl-dev \
    libc-dev \
    fortify-headers \
    g++ \
    build-base \
    linux-headers \
    wget \
    zlib-dev \
    ca-certificates \
    libbz2 \
    expat \
    libffi \
    gdbm \
    ncurses-terminfo-base \
    ncurses-terminfo \
    ncurses-libs \
    readline \
    sqlite-libs \
    python \
    go

