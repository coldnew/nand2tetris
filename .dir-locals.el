;; If you have problem with this `.dir-locals.el' file, please make sure you use
;; `Emacs 24' and the `(package-initialize)' is called by your .emacs.d.
((nil . ((tab-width . 4)
         (eval .
			   (progn
 				 (require 'package)
				 (package-initialize)

				 (when (not (require 'nand2tetris))
				   (package-install 'nand2tetris))
				 (when (not (require 'nand2tetris-assembler))
				   (package-install 'nand2tetris-assembler))

 				 (setq nand2tetris-core-base-dir
 					   (concat
						(locate-dominating-file default-directory ".dir-locals.el")
						"nand2tetris"))

				 (setq nand2tetris-tools-dir  (expand-file-name "tools" nand2tetris-core-base-dir))
				 (setq nand2tetris-hardware-simulator (expand-file-name "HardwareSimulator.sh" nand2tetris-tools-dir))
				 (setq nand2tetris-assembler (expand-file-name "Assembler.sh" nand2tetris-tools-dir))
				 (setq nand2tetris-cpu-emulator (expand-file-name "CPUEmulator.sh" nand2tetris-tools-dir))
				 (setq nand2tetris-jack-compiler (expand-file-name "JackCompiler.sh" nand2tetris-tools-dir))
				 (setq nand2tetris-text-comparer (expand-file-name "TextComparer.sh" nand2tetris-tools-dir))
 				 (setq nand2tetris-vm-emulator (expand-file-name "VMEmulator.sh" nand2tetris-tools-dir))
				 (add-to-list 'auto-mode-alist
							  (cons (concat (expand-file-name nand2tetris-core-base-dir) ".*\\.hdl")
									'nand2tetris-mode))
				 (add-to-list 'auto-mode-alist
							  (cons (concat (expand-file-name nand2tetris-core-base-dir) ".*\\.asm")
									'nand2tetris-assembler-mode))
				 ))
		 )))

