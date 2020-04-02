train-nlu-bert-service:
	rasa train nlu -u data/training_data.md -c configs/config_bert_service.yml --out models/nlu_bert_service

train-nlu-kashgari:
	rasa train nlu -u data/training_data.md -c configs/config_kashgari.yml --out models/nlu_kashgari

eval-nlu-bert-service:
	rasa test nlu \
	--nlu data/test_data.md \
	--report result/bert_service/ \
	--errors result/bert_service/errors.json \
	--histogram result/bert_service/hist.png \
	--confmat result/bert_service/confmat.png \
	--config configs/config_bert_service.yml \
	-m models/nlu_bert_service

eval-nlu-kashgari:
	rasa test nlu \
	--nlu data/test_data.md \
	--report result/kashgari/ \
	--errors result/kashgari/errors.json \
	--histogram result/kashgari/hist.png \
	--confmat result/kashgari/confmat.png \
	--config configs/config_kashgari.yml \
	-m models/nlu_kashgari

run-nlu-bert-service:
	rasa run --enable-api -m models/nlu_bert_service

run-nlu-kashgari:
	rasa run --enable-api -m models/nlu_kashgari