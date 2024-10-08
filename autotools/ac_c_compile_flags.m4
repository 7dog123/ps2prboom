AC_DEFUN([AC_C_COMPILE_FLAGS],[
NEW_CFLAGS="$CFLAGS"
for ac_flag in $1
do
  AC_MSG_CHECKING([whether compiler supports $ac_flag])
  CFLAGS="$NEW_CFLAGS $ac_flag"
  AC_COMPILE_IFELSE(
    [AC_LANG_PROGRAM([], [])],
    [NEW_CFLAGS="$CFLAGS"
     AC_MSG_RESULT([yes])],
    [AC_MSG_RESULT([no])]
  )
done
CFLAGS="$NEW_CFLAGS"
])
