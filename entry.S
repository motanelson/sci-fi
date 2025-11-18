.section .init

.option norvc

.type start, @function
.global start
start:
	.cfi_startproc
	
.option push
.option norelax
	la gp, global_pointer
.option pop
	
	/* Reset satp */
	csrw satp, zero
	
	/* Setup stack */
	la sp, stack_top
	
	/* Clear the BSS section */
	la t5, bss_start
	la t6, bss_end

	call _starts
	
	.cfi_endproc

.end
