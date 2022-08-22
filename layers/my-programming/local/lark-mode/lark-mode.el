;;; lark-mode.el --- Highlight mode for Lark

;; Copyright (C) 2020 Glenn Hutchings

;; Author: Glenn Hutchings <zondo42@gmail.com>
;; Keywords: faces
;; URL: https://hg.sr.ht/~zondo/lark-mode

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This major mode provides basic syntax highlighting for Lark grammars
;; (see https://github.com/lark-parser/lark).

;;; Code:

;;;###autoload
(define-generic-mode 'lark-mode
  '()
  '()
  '(
    ;; Comments and strings.
    ("//.*$" . font-lock-comment-face)
    ("[\"].*?[\"]" . font-lock-string-face)

    ;; Directives.
    ("^%[a-z]+" . font-lock-preprocessor-face)

    ;; Definitions.
    ("[A-Za-z][A-Za-z_]+[ \t]*:" . font-lock-function-name-face)

    ;; Non-terminals.
    ("[a-z][a-z_]+" . font-lock-variable-name-face)

    ;; Terminals.
    ("[A-Z][A-Z_]+" . font-lock-constant-face)

    ;; Definition prefix characters.
    ("^[_?]" . font-lock-type-face)

    ;; Regexps.
    ("/[^/]+?/[imslux]*" . font-lock-variable-name-face)

    ;; Punctuation.
    ("[][(){}|*+]" . font-lock-type-face)

    ;; Import aliases.
    ("->" . font-lock-type-face)
    )
  '("\\.lark\\'")
  `(,(lambda ()
       (setq mode-name "Lark")
       (setq comment-start "// ")
       (setq comment-end "")
       (setq comment-column 0)))
  "Major mode for Lark grammar text highlighting.")

(provide 'lark-mode)
;;; lark-mode.el ends here
