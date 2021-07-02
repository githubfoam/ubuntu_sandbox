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

push-image:
	docker push $(IMAGE)
.PHONY: deploy-openesb deploy-dashboard push-image
