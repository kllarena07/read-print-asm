.global _main
.align 4

_main:
  mov x0, #0
  adrp x1, buffer@PAGE
  add x1, x1, buffer@PAGEOFF
  mov x2, #4
  mov x16, #3
  svc 0

  b _terminate

_terminate:
  mov x0, #0
  mov x16, #1
  svc 0

.data
buffer: .space 4