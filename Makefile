clean:
	rm -rf download
	rm -rf base

# download/base_pack.zip: base_pack_url.txt
download/base_pack.zip:
	mkdir -p download
	rm download/*.zip || true
	cd download && wget -i ../base_pack_url.txt
	mv download/*.zip download/base_pack.zip

download: download/base_pack.zip

base: download/base_pack.zip
	rm -rf base
	mkdir -p base
	unzip download/base_pack.zip -d base
