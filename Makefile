.PHONY: clean download base install_requirements update_requirements

clean:
	rm base_pack.zip || true
	rm -rf download
	rm -rf base

base_pack.zip: base_pack_url.txt
	mkdir -p download
	# wget -i base_pack_url.txt -O base_pack.zip --progress=dot:giga
	xargs -n 1 -t curl -o base_pack.zip -O < base_pack_url.txt
	touch base_pack.zip

download: base_pack.zip

base: base_pack.zip
	rm -rf base
	mkdir -p base
	# unzip -q base_pack.zip -d base
	7z x base_pack.zip -obase

install_requirements: requirements.txt
	pip3 install -r requirements.txt

update_requirements: requirements.txt
	pip3 install -U -r requirements.txt
