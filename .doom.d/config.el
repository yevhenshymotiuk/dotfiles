;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Font
(setq doom-font (font-spec :family "Fira Code" :size 15))


;; Theme
(setq doom-theme 'doom-peacock)


;; evil-escape-key-sequence
(setq evil-escape-key-sequence "fd")


;; web-mode
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html.eex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

(setq web-mode-enable-auto-pairing nil)

(sp-with-modes '(web-mode)
  (sp-local-pair "%" "%" :post-handlers '(("| " "SPC")))
  (sp-local-pair "=" "" :post-handlers '(("| " "SPC"))))

(sp-local-pair 'web-mode "<" ">" :actions nil)

(add-hook 'web-mode-hook 'emmet-mode)

(map! (:after web-mode
        (:map web-mode-map
          "TAB" nil
          "TAB" 'emmet-expand-yas)))


;; Company
(add-hook 'text-mode-hook 'global-company-mode)

(setq company-idle-delay 0.2
      company-minimum-prefix-length 2)

(map! (:after company
        (:map company-active-map
          "<tab>" nil
          "TAB" 'company-complete-selection)))


;; cursor
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "DarkGoldenrod1")))))


;; dart-mode
;; (map! (:after dart-mode
;;         (:map dart-mode-map
;;           "TAB" 'dart-expand)))

;; (sp-local-pair 'dart-mode "<" ">")


;; Org-Latex
(setq org-latex-packages-alist
      '(("AUTO" "babel" t)
        ("T2A" "fontenc" t)))


;; term
(defun current-directory()
    "Returns current directory"
    (file-name-directory (buffer-file-name)))

(defun term-send-cd()
    (term-send-string
        (get-buffer-process "*terminal*")
        (format "cd %s\n%s\n" (current-directory) "clear")))

(defun open-terminal()
    "Opens terminal in a new window"
    (interactive)
    (cond
        ((not (get-buffer-window "*terminal*"))
        (progn
            (pop-to-buffer (save-window-excursion (+term/here)))
            (evil-window-set-height 15)))

        (t (progn
                (term-send-cd)
                (select-window (get-buffer-window "*terminal*"))))))

(defun open-popup-terminal()
    (interactive)
    (+term/toggle t)
    (evil-window-set-height 15))


;; Trello
(defun org-trello-sync-buffer-from-trello()
    (interactive)
    (org-trello-sync-buffer t))



;; <leader>
(map! :leader
      :desc "Open swiper" "S" 'swiper
      :desc "Toggle terminal in popup" "o t" 'open-popup-terminal
      :desc "Open mu4e" "m" 'mu4e)


;; python
(add-hook 'python-mode-hook (λ! (electric-indent-local-mode -1)))
(setq pylint-options '("--rcfile=~/.config/pylint/pylintrc"))


;; snippets
(require 'yasnippet)
(doom-snippets-initialize)


;; flycheck
(setq-default flycheck-disabled-checkers
              '(python-pycompile
                python-mypy))


;; agenda
(setq org-agenda-files '("~/Documents/org/"))

(setq org-agenda-custom-commands
      '(("c" "Custom agenda view"
         ((agenda ""
            ((org-agenda-overriding-header "Today's agenda")
             (org-agenda-start-day "4d")
             (org-agenda-span 1)))
          (agenda "" ((org-agenda-overriding-header "10 days' agenda")))
          (alltodo "" ((org-agenda-overriding-header "All tasks")))))))


;; ligatures
(when (featurep! :ui pretty-code)
  (after! org
    (set-pretty-symbols! 'org-mode
      :name "#+NAME:"
      :src_block "#+BEGIN_SRC"
      :src_block_end "#+END_SRC"
      :alist '(("[ ]" . "")
               ("[X]" . "")
               ("[-]" . "")
               ("SCHEDULED:" . "")
               ("DEADLINE:" . "")
               ("#+begin_src" . "«")
               ("#+end_src" . "»")))))


;; plantuml
(setq org-plantuml-jar-path (expand-file-name "/usr/share/java/plantuml/plantuml.jar"))


;; mu4e
;; (after! mu4e
;;   (setq mu4e-get-mail-command "/home/yevhens/.local/bin/offlineimap.sh")
;;   (setq mu4e-update-interval 300))

;; (mu4e-alert-set-default-style 'libnotify)
;; (add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
;; (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)


;; nasm
(require 'nasm-mode)
(add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode))


;; magit
(add-hook 'magit-mode-hook 'magit-todos-mode)

;; (setq +pretty-code-symbols nil)

(add-hook 'rustic-mode-hook 'rust-mode)
(add-hook 'rust-mode-hook 'lsp)
