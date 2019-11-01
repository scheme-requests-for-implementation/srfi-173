(define-library (hook)

  (export make-hook
          hook?
          list->hook
          list->hook!
          hook-add!
          hook-delete!
          hook-reset!
          hook->list
          hook-run)

  (import (scheme base))

  (import (srfi 145))

  (include "hook.body.scm"))
