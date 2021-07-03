IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-zeppelin:
	bash scripts/deploy-zeppelin.sh

deploy-cuda:
	bash scripts/deploy-cuda.sh

deploy-nxlog:
	bash scripts/deploy-nxlog.sh

deploy-x8:
	bash scripts/deploy-x8.sh	

deploy-cuckoo-2004:
	bash scripts/deploy-cuckoo-2004.sh

deploy-cuckoo-1804:
	bash scripts/deploy-cuckoo-1804.sh

deploy-cuckoo-1604:
	bash scripts/deploy-cuckoo-1604.sh

push-image:
	docker push $(IMAGE)
.PHONY: deploy-openesb deploy-dashboard push-image
