IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-zeppelin:
	bash scripts/deploy-zeppelin.sh

deploy-cuda:
	bash scripts/deploy-cuda.sh

deploy-nxlog:
	bash scripts/deploy-nxlog.sh

push-image:
	docker push $(IMAGE)
.PHONY: deploy-openesb deploy-dashboard push-image
