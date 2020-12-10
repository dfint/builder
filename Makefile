.PHONY: clean download base install_requirements update_requirements

clean:
	rm -rf download
	rm -rf base

download/base_pack.zip: base_pack_url.txt
	mkdir -p download
	rm download/*.zip || true
	cd download && wget -i ../base_pack_url.txt
	mv download/*.zip download/base_pack.zip
	touch download/base_pack.zip

download: download/base_pack.zip

base: download/base_pack.zip
	rm -rf base
	mkdir -p base
	unzip download/base_pack.zip -d base

install_requirements: requirements.txt
	pip3 install -r requirements.txt

update_requirements: requirements.txt
	pip3 install -U -r requirements.txt
