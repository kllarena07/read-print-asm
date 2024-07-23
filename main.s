.global _main
.align 4

_main:
  mov x0, #0
  adrp x1, buffer@PAGE
  add x1, x1, buffer@PAGEOFF
  mov x2, #4
  mov x16, #3
  svc 0

  mov x9, #0
  bl _print
  b _terminate


_print:
  mov x0, #1
  adrp x1, buffer@PAGE
  add x1, x1, buffer@PAGEOFF
  add x1, x1, x9
  mov x2, #1
  mov x16, #4
  svc 0

  cmp x9, #4
  bge end
  add x9, x9, 1
  bl _print

end:
  ret

_terminate:
  mov x0, #0
  mov x16, #1
  svc 0

.data
buffer: .space 4