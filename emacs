;; Ajout du repository de MELPA
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Chargement du thème
;; (load-theme ' wheatgrass t)

;; Arrière-plan
;; (set-background-color "black")

;; Police
;; (set-default-font "Bitstream Vera Sans Mono-10")

;; Lors des compilations, place le curseur a la fin
(setq compilation-scroll-output t)

;; Indentation
(setq c-basic-offset 4)

;; For xterm
(xterm-mouse-mode 1)

;; kill-this-buffer C-x C-k
(global-set-key (kbd "C-x C-k") `kill-this-buffer)

;; comment-or-uncomment-region C-/
(global-set-key (kbd "C-/") `comment-or-uncomment-region)

;; Lorsque le curseur atteint la fin de la fenêtre, le contenu se
;; déplace d'une seule ligne et non d'une demi-fenêtre.
(setq scroll-step 1)

;; Lorsqu'on saisit un texte alors qu'une zone est sélectionnée, cette dernière est écrasée par le texte saisi.
(delete-selection-mode 1)

;; Affichage du nom du buffer/fichier dans la barre de titre
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

;; Avoir le undo en Ctrl-Z
(global-set-key [(control z)] `undo)

;; Correction du bug de la touche ^
(load-library "iso-transl")

;;;;;;;;;;;;;;;;;;;
;; Programmation ;;
;;;;;;;;;;;;;;;;;;;

;; Compilation
(global-set-key [f9] 'compile)

;; For compilation in c-mode with f9 key
(add-hook 'c-mode-hook
	  (function (lambda ()
		      (local-set-key (quote [f9]) (quote compile)))))

;; Tuareg
(if (and (boundp 'window-system) window-system)
  (require 'font-lock))
(global-font-lock-mode t) 
(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Mode majeur pour éditer du code Caml" t)
(autoload 'camldebug "camldebug" "Exécuter le débogueur Caml" t)
(add-hook 'tuareg-mode-hook
	  '(lambda ()
	     (setq tuareg-lazy-= t) ; indent `=' like a standard keyword
	     (setq tuareg-lazy-paren t)	; indent [({ like standard keywords
	     (setq tuareg-in-indent 0) ; no indentation after `in' keywords
	     (auto-fill-mode 1) ; turn on auto-fill minor mode
	     ; (global-set-key (kbd "C-c C-r") 'tuareg-eval-region) ; [MY] solved
	     (if (featurep 'sym-lock) ; Sym-Lock customization only
	       (setq sym-lock-mouse-face-enabled nil))
	     ; turn off special face under mouse
	     ))

;; Ajout du mode Prolog
(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)
(setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
				("\\.m$" . mercury-mode))
			      auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paramètres ajoutés automatiquement ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-safe-themes (quote ("6e92ca53a22d9b0577ad0b16e07e2e020c8b621197e39fec454048e51b7954cb" default)))
 '(inhibit-startup-screen t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
