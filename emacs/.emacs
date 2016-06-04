;; path where settings files are kept
(add-to-list 'load-path "~/.emacs.d/settings")
;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")

;; define various custom functions
(require 'custom-functions)

;; configure general settings
(require 'general-settings)

;; install dependencies with el-get
(require 'el-get-settings)

;---------------;
;;; Utilities ;;;
;---------------;

;; Popup
(include-elget-plugin "popup")
(require 'popup)

;; Websocket
(include-plugin "websocket")
(require 'websocket)

;; Request
(include-plugin "request")
(require 'request)

;; yasnippet
(require 'yasnippet-settings)

;; Auto complete
(require 'auto-complete-settings)

;; Helm
(require 'helm-settings)

;-----------;
;;; Modes ;;;
;-----------;

;; Ido mode
(require 'ido)
(ido-mode 1)

;; Markdown mode
(require 'markdown-settings)

;; Python mode 
(require 'python-settings)

;; SCSS Mode
(require 'scss-settings)

;; Javascript
(require 'js-settings)

;; YAML mode
(require 'yaml-settings)

;------------------;
;;; Old settings ;;;
;------------------,

;; Ajout du repository de MELPA
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Indentation
(setq c-basic-offset 4)
(setq sgml-basic-offset 2)

;; Chargement du thème
(load-theme ' deeper-blue t)

;; Lors des compilations, place le curseur a la fin
(setq compilation-scroll-output t)

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

;---------------------------------------------------------------------
;;; Put auto 'custom' changes in a separate file (this is stuff like
;;; ;; custom-set-faces and custom-set-variables) 
(load 
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)

