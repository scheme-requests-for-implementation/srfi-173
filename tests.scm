(import (chibi test))


;; test hook->list and make-hook
(test 0 (length (hook->list (make-hook 0))))

;; test hook-add!
(test 1 (let ((hook (make-hook 0))
              (counter 0))
          (hook-add! hook (lambda () (set! counter (+ counter 1))))
          (length (hook->list hook))))

;; test hook-delete!
(test 0 (let ((hook (make-hook 0))
              (counter 0))
          (let ((increment (lambda () (set! counter (+ counter 1)))))
            (hook-add! hook increment)
            (hook-delete! hook increment)
            (length (hook->list hook)))))

;; test hook-reset!
(test 0 (let ((hook (make-hook 0))
              (counter 0))
          (let ((increment (lambda () (set! counter (+ counter 1))))
                (decrement (lambda () (set! counter (- counter 1)))))
            (hook-add! hook increment)
            (hook-reset! hook)
            (length (hook->list hook)))))

;; test hook-run
(test 0 (let ((hook (make-hook 0))
              (counter 0))
          (let ((increment (lambda () (set! counter (+ counter 1))))
                (decrement (lambda () (set! counter (- counter 1)))))
            (hook-add! hook increment)
            (hook-run hook)
            counter)))
