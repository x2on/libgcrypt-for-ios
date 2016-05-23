DESTDIR = $$PWD/lib

TEMPLATE = lib
TARGET = gcrypt
CONFIG += qt warn_off

LIBGCRYPT_VER = libgcrypt-1.5.3
LIBGPG_ERROR_VER = libgpg-error-1.12

INCLUDEPATH += ./inc ../src/$$LIBGCRYPT_VER ../src/$$LIBGCRYPT_VER/cipher ../src/$$LIBGCRYPT_VER/random ../src/$$LIBGCRYPT_VER/src ../src/$$LIBGCRYPT_VER/mpi ../src/$$LIBGPG_ERROR_VER

DEFINES += HAVE_CONFIG_H

CONFIG += staticlib

ios {
    QMAKE_CFLAGS += "-fheinous-gnu-extensions"
}

HEADERS = \
    ../src/$$LIBGCRYPT_VER/src/hmac256.h \
    ../src/$$LIBGCRYPT_VER/src/visibility.h \
    ../src/$$LIBGCRYPT_VER/cipher/bithelp.h \
    ../src/$$LIBGCRYPT_VER/cipher/camellia.h \
    ../src/$$LIBGCRYPT_VER/cipher/hash-common.h \
    ../src/$$LIBGCRYPT_VER/cipher/rijndael-tables.h \
    ../src/$$LIBGCRYPT_VER/cipher/rmd.h \
    ../src/$$LIBGCRYPT_VER/compat/libcompat.h \
    ../src/$$LIBGCRYPT_VER/mpi/longlong.h \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-inline.h \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-internal.h \
    ../src/$$LIBGCRYPT_VER/mpi/sysdep.h \
    ../src/$$LIBGCRYPT_VER/mpi/asm-syntax.h \
    ../src/$$LIBGCRYPT_VER/mpi/mod-source-info.h \
    ../src/$$LIBGCRYPT_VER/mpi/generic/mpi-asm-defs.h \
    ../src/$$LIBGCRYPT_VER/random/rand-internal.h \
    ../src/$$LIBGCRYPT_VER/random/random.h \
    ../src/$$LIBGCRYPT_VER/src/ath.h \
    ../src/$$LIBGCRYPT_VER/src/mpi.h \
    ../src/$$LIBGCRYPT_VER/src/secmem.h \
    ../src/$$LIBGCRYPT_VER/src/stdmem.h \
    ../src/$$LIBGCRYPT_VER/src/types.h \
    ../src/$$LIBGPG_ERROR_VER/src/code-from-errno.h \
    ../src/$$LIBGPG_ERROR_VER/src/code-to-errno.h \
    ../src/$$LIBGPG_ERROR_VER/src/err-codes-sym.h \
    ../src/$$LIBGPG_ERROR_VER/src/err-codes.h \
    ../src/$$LIBGPG_ERROR_VER/src/err-sources.h \
    ../src/$$LIBGPG_ERROR_VER/src/errnos-sym.h \
    ../src/$$LIBGPG_ERROR_VER/src/gettext.h \
    ../src/$$LIBGPG_ERROR_VER/src/init.h \
    ./inc/config.h \
    ./inc/gcrypt-module.h \
    ./inc/gcrypt.h \
    ./inc/gpg-error.h

SOURCES = \
    ../src/$$LIBGCRYPT_VER/src/hmac256.c \
    ../src/$$LIBGCRYPT_VER/src/visibility.c \
    ../src/$$LIBGCRYPT_VER/compat/compat.c \
    ../src/$$LIBGCRYPT_VER/cipher/ac.c \
    ../src/$$LIBGCRYPT_VER/cipher/arcfour.c \
    ../src/$$LIBGCRYPT_VER/cipher/blowfish.c \
    ../src/$$LIBGCRYPT_VER/cipher/camellia-glue.c \
    ../src/$$LIBGCRYPT_VER/cipher/camellia.c \
    ../src/$$LIBGCRYPT_VER/cipher/cast5.c \
    ../src/$$LIBGCRYPT_VER/cipher/cipher.c \
    ../src/$$LIBGCRYPT_VER/cipher/crc.c \
    ../src/$$LIBGCRYPT_VER/cipher/des.c \
    ../src/$$LIBGCRYPT_VER/cipher/dsa.c \
    ../src/$$LIBGCRYPT_VER/cipher/ecc.c \
    ../src/$$LIBGCRYPT_VER/cipher/elgamal.c \
    ../src/$$LIBGCRYPT_VER/cipher/hash-common.c \
    ../src/$$LIBGCRYPT_VER/cipher/hmac-tests.c \
    ../src/$$LIBGCRYPT_VER/cipher/idea.c \
    ../src/$$LIBGCRYPT_VER/cipher/kdf.c \
    ../src/$$LIBGCRYPT_VER/cipher/md.c \
    ../src/$$LIBGCRYPT_VER/cipher/md4.c \
    ../src/$$LIBGCRYPT_VER/cipher/md5.c \
    ../src/$$LIBGCRYPT_VER/cipher/primegen.c \
    ../src/$$LIBGCRYPT_VER/cipher/pubkey.c \
    ../src/$$LIBGCRYPT_VER/cipher/rfc2268.c \
    ../src/$$LIBGCRYPT_VER/cipher/rijndael.c \
    ../src/$$LIBGCRYPT_VER/cipher/rmd160.c \
    ../src/$$LIBGCRYPT_VER/cipher/rsa.c \
    ../src/$$LIBGCRYPT_VER/cipher/seed.c \
    ../src/$$LIBGCRYPT_VER/cipher/serpent.c \
    ../src/$$LIBGCRYPT_VER/cipher/sha1.c \
    ../src/$$LIBGCRYPT_VER/cipher/sha256.c \
    ../src/$$LIBGCRYPT_VER/cipher/sha512.c \
    ../src/$$LIBGCRYPT_VER/cipher/tiger.c \
    ../src/$$LIBGCRYPT_VER/cipher/twofish.c \
    ../src/$$LIBGCRYPT_VER/cipher/whirlpool.c \
    ../src/$$LIBGCRYPT_VER/mpi/ec.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-add.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-bit.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-cmp.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-div.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-gcd.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-inline.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-inv.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-mod.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-mpow.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-mul.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-pow.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpi-scan.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpicoder.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpih-div.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpih-mul.c \
    ../src/$$LIBGCRYPT_VER/mpi/mpiutil.c \
    ../src/$$LIBGCRYPT_VER/random/random-csprng.c \
    ../src/$$LIBGCRYPT_VER/random/random-fips.c \
    ../src/$$LIBGCRYPT_VER/random/random.c \
    ../src/$$LIBGCRYPT_VER/random/rndhw.c \
    ../src/$$LIBGCRYPT_VER/random/rndlinux.c \
    ../src/$$LIBGCRYPT_VER/src/ath.c \
    ../src/$$LIBGCRYPT_VER/src/fips.c \
    ../src/$$LIBGCRYPT_VER/src/global.c \
    ../src/$$LIBGCRYPT_VER/src/hwfeatures.c \
    ../src/$$LIBGCRYPT_VER/src/misc.c \
    ../src/$$LIBGCRYPT_VER/src/missing-string.c \
    ../src/$$LIBGCRYPT_VER/src/module.c \
    ../src/$$LIBGCRYPT_VER/src/secmem.c \
    ../src/$$LIBGCRYPT_VER/src/sexp.c \
    ../src/$$LIBGCRYPT_VER/src/stdmem.c \
    ../src/$$LIBGCRYPT_VER/mpi/generic/mpih-add1.c \
    ../src/$$LIBGCRYPT_VER/mpi/generic/mpih-lshift.c \
    ../src/$$LIBGCRYPT_VER/mpi/generic/mpih-mul1.c \
    ../src/$$LIBGCRYPT_VER/mpi/generic/mpih-mul2.c \
    ../src/$$LIBGCRYPT_VER/mpi/generic/mpih-mul3.c \
    ../src/$$LIBGCRYPT_VER/mpi/generic/mpih-rshift.c \
    ../src/$$LIBGCRYPT_VER/mpi/generic/mpih-sub1.c \
    ../src/$$LIBGPG_ERROR_VER/src/code-from-errno.c \
    ../src/$$LIBGPG_ERROR_VER/src/code-to-errno.c \
    ../src/$$LIBGPG_ERROR_VER/src/init.c \
    ../src/$$LIBGPG_ERROR_VER/src/strerror.c \
    ../src/$$LIBGPG_ERROR_VER/src/strsource.c \
    ../src/$$LIBGPG_ERROR_VER/src/version.c
