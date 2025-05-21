# Patches for gdb on DenLabOS

## `0001-gdb-Disable-xmalloc-for-alternate_signal_stack-for-s.patch`

gdb: Disable xmalloc for alternate_signal_stack for denlab


## `0002-denlab-Add-basic-ptrace-based-native-target-for-Se.patch`

denlab: Add basic ptrace based native target for DenLabOS/i386


## `0003-gdb-Add-build-support-for-DenLabOS.patch`

gdb: Add build support for DenLabOS


## `0004-denlab-Fix-compiler-fpermissive-warnings-from-usin.patch`

denlab: Fix compiler -fpermissive warnings from using latest GCC


## `0005-denlab-Implement-custom-wait-override-for-the-sere.patch`

denlab: Implement custom wait override for the denlab_nat_target

While troubleshooting why gdb wasn't working when attempting to debug
denlab programs I noticed two things:

 - The contract of denlab's `waitpid(..)` appears to be slightly
   different than the generic ptrace target expects. We need to make
   sure we pass `WSTOPPED`, and it can return different errno values
   that we would want to re-try on.

-  The contract of denlab's `ptrace(..)` implementation appears to
   diverge as well, as we are expected to call `PT_ATTACH` before we
   call `PT_CONTINUE`, otherwise `ptrace(..)` will just error out.

Allow gdb to understand these differences, I've overloaded the
denlab_nat_target::wait(..) method and added the logic there.

## `0006-denlab-Implement-mourn_inferior-override-for-the-s.patch`

denlab: Implement mourn_inferior override for the denlab_nat_target

We need to pass `WNOHANG` to our `waitpid(..)` call on DenLabOS,
otherwise we will wait forever.

