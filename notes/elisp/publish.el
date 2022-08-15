;;; publish.el --- Publish my personal notes

;; Copyright (c) 2013 - 2022 Yen-Chin, Lee.
;;
;; Author: coldnew <coldnew.tw@gmail.com>
;; Keywords: converience

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:
;;

;;; Code:


;;; Personal Information

(setq user-full-name "Yen-Chin, Lee")
(setq user-mail-address "coldnew.tw@gmail.com")

;;; Initialize packages

(require 'package)

(setq package-user-dir
      (expand-file-name "packages" "caches"))

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;;; Install packages
(package-install 'htmlize)

;;; Initialize org-mode

(require 'ox-publish)

(setq org-publish-timestamp-directory
      (expand-file-name "org-timestamps" "caches"))

;; extend babel functions
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)
   (ditaa . t)))

(add-to-list 'org-publish-project-alist
	     `("notes-org"
	       :recursive t
	       :base-directory "."
	       :base-extension "org"
	       :publishing-directory "./public/"
	       :publishing-function org-html-publish-to-html
	       ;; :html-head-include-default-style nil
	       ;; :html-head-include-scripts nil
	       ;; :html-head ,sacha/emacs-notes-html-head
	       ;; :auto-sitemap t                  ; Generate sitemap.org automagically...
	       ;; :sitemap-filename "sitemap.org"  ; Call it sitemap.org (it's the default)...
	       ;; :sitemap-title "Sitemap"         ; With title 'Sitemap'.
	       ;; :makeindex t
	       :with-timestamp t
	       :section-numbers nil
	       :html-preamble ""
	       :html-postamble ""
	       :htmlized-source t
	       ))

(add-to-list 'org-publish-project-alist
	     `("images"
	       :recursive t
	       :base-directory "./imgs"
	       :base-extension ".*"
	       :publishing-directory "./public/imgs"
	       :publishing-function org-publish-attachment
	       ))

(org-publish-all t)

;;; publish.el ends here

;; refs:
;; https://github.com/kennyballou/kennyballou.github.io/blob/52a34b1773fe5b8dfd9512bd5600567d6121639f/build-site.el
