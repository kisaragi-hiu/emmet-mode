all: emmet-mode.elc emmet-data-snippets.el emmet-data-preferences.el

emmet-mode.elc: emmet-mode.el
	/usr/bin/env emacs --batch -L . --eval '(byte-compile-file "emmet-mode.el")'

emmet-data-snippets.el: conf/snippets.json
	tools/json2hash conf/snippets.json -o $@ --defvar 'emmet-snippets'

emmet-data-preferences.el: conf/preferences.json
	tools/json2hash conf/preferences.json -o $@ --defvar 'emmet-preferences'

clean:
	rm -f emmet-mode.elc emmet-data-snippets.el emmet-data-preferences.el

test:
	/usr/bin/env emacs --batch -L . --load test/test.el

docs:
	echo docs

.PHONY: all test docs clean
