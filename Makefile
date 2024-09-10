run:
		flutter run \
		--flavor $(flavor) \
		--target lib/main_$(flavor).dart \
clean_gen:
		   dart run build_runner clean
		   dart run build_runner build --delete-conflicting-outputs

gen:
	 dart run build_runner build --delete-conflicting-outputs		