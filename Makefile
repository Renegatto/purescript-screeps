
psa: src/Main.purs
	psa --censor-codes=ImplicitImport,UnusedExplicitImport \
	    'src/**/*.purs' \
	    '.spago/purescript-*/src/**/*.purs'

format:
	@npx purs-tidy format-in-place "src/**/*.purs"

deploy: src/Main.purs
	spago build --to localScripts/main.js # -- --censor-codes=ImplicitImport

output: Main.purs
	psc Main.purs 'src/**/.purs' '.spago/purescript-*/src/**/*.purs'

