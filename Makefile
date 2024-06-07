all: apk release

release:
	python release.py

apk:
	flutter build apk

clean:
	rm -rf build
