
download/base_pack.zip:
	rm -rf download
	mkdir -p download
	cd download && wget http://df.wicked-code.com/PeridexisErrant%27s%20Starter%20Pack%200.47.04-r06.zip
	mv download/*.zip download/base_pack.zip

base: download/base_pack.zip
	rm -rf base
	mkdir -p base
	unzip download/base_pack.zip -d base
