IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-volatility-latest:
	bash scripts/deploy-volatility-latest.sh

deploy-volatility-2204:
	bash scripts/deploy-volatility-2204.sh

deploy-volatility-2004:
	bash scripts/deploy-volatility-2004.sh

deploy-volatility-1804:
	bash scripts/deploy-volatility-1804.sh
	
# deploy-volatility-1604:
# 	bash scripts/deploy-volatility-1604.sh		

deploy-cuckoo-latest:
	bash scripts/deploy-cuckoo-latest.sh

deploy-cuckoo-2204:
	bash scripts/deploy-cuckoo-2204.sh

deploy-cuckoo-2004:
	bash scripts/deploy-cuckoo-2004.sh

deploy-cuckoo-1804:
	bash scripts/deploy-cuckoo-1804.sh

# deploy-cuckoo-1604:
# 	bash scripts/deploy-cuckoo-1604.sh

push-image:
	docker push $(IMAGE)
.PHONY: deploy-openesb deploy-dashboard push-image
