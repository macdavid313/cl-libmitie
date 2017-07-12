;;;; cl-libmitie.lisp
(in-package #:cl-libmitie)

(cl:eval-when (:load-toplevel)
  (cffi:define-foreign-library libmitie
    (:darwin (:or "libmitie.dylib"))
    (:unix  (:or "libmitie.so"))
    (cl:t (:default "libmitie")))
  
  (cl:unless (cffi:foreign-library-loaded-p 'libmitie)
    (cffi:use-foreign-library libmitie)))

(cffi:defcfun ("mitie_free" #.(swig-lispify "mitie_free" 'function)) :void
  (object :pointer))

(cffi:defcfun ("mitie_load_entire_file" #.(swig-lispify "mitie_load_entire_file" 'function)) :string
  (filename :string))

(cffi:defcfun ("mitie_tokenize" #.(swig-lispify "mitie_tokenize" 'function)) :pointer
  (text :string))

(cffi:defcfun ("mitie_tokenize_file" #.(swig-lispify "mitie_tokenize_file" 'function)) :pointer
  (filename :string))

(cffi:defcfun ("mitie_tokenize_with_offsets" #.(swig-lispify "mitie_tokenize_with_offsets" 'function)) :pointer
  (text :string)
  (token_offsets :pointer))

(cffi:defcfun ("mitie_load_named_entity_extractor" #.(swig-lispify "mitie_load_named_entity_extractor" 'function)) :pointer
  (filename :string))

(cffi:defcfun ("mitie_get_num_possible_ner_tags" #.(swig-lispify "mitie_get_num_possible_ner_tags" 'function)) :unsigned-long
  (ner :pointer))

(cffi:defcfun ("mitie_get_named_entity_tagstr" #.(swig-lispify "mitie_get_named_entity_tagstr" 'function)) :string
  (ner :pointer)
  (idx :unsigned-long))

(cffi:defcfun ("mitie_extract_entities" #.(swig-lispify "mitie_extract_entities" 'function)) :pointer
  (ner :pointer)
  (tokens :pointer))

(cffi:defcfun ("mitie_ner_get_num_detections" #.(swig-lispify "mitie_ner_get_num_detections" 'function)) :unsigned-long
  (dets :pointer))

(cffi:defcfun ("mitie_ner_get_detection_position" #.(swig-lispify "mitie_ner_get_detection_position" 'function)) :unsigned-long
  (dets :pointer)
  (idx :unsigned-long))

(cffi:defcfun ("mitie_ner_get_detection_length" #.(swig-lispify "mitie_ner_get_detection_length" 'function)) :unsigned-long
  (dets :pointer)
  (idx :unsigned-long))

(cffi:defcfun ("mitie_ner_get_detection_tag" #.(swig-lispify "mitie_ner_get_detection_tag" 'function)) :unsigned-long
  (dets :pointer)
  (idx :unsigned-long))

(cffi:defcfun ("mitie_ner_get_detection_tagstr" #.(swig-lispify "mitie_ner_get_detection_tagstr" 'function)) :string
  (dets :pointer)
  (idx :unsigned-long))

(cffi:defcfun ("mitie_ner_get_detection_score" #.(swig-lispify "mitie_ner_get_detection_score" 'function)) :double
  (dets :pointer)
  (idx :unsigned-long))

(cffi:defcfun ("mitie_load_binary_relation_detector" #.(swig-lispify "mitie_load_binary_relation_detector" 'function)) :pointer
  (filename :string))

(cffi:defcfun ("mitie_binary_relation_detector_name_string" #.(swig-lispify "mitie_binary_relation_detector_name_string" 'function)) :string
  (detector :pointer))

(cffi:defcfun ("mitie_entities_overlap" #.(swig-lispify "mitie_entities_overlap" 'function)) :int
  (arg1_start :unsigned-long)
  (arg1_length :unsigned-long)
  (arg2_start :unsigned-long)
  (arg2_length :unsigned-long))

(cffi:defcfun ("mitie_extract_binary_relation" #.(swig-lispify "mitie_extract_binary_relation" 'function)) :pointer
  (ner :pointer)
  (tokens :pointer)
  (arg1_start :unsigned-long)
  (arg1_length :unsigned-long)
  (arg2_start :unsigned-long)
  (arg2_length :unsigned-long))

(cffi:defcfun ("mitie_classify_binary_relation" #.(swig-lispify "mitie_classify_binary_relation" 'function)) :int
  (detector :pointer)
  (relation :pointer)
  (score :pointer))

(cffi:defcfun ("mitie_save_named_entity_extractor" #.(swig-lispify "mitie_save_named_entity_extractor" 'function)) :int
  (filename :string)
  (ner :pointer))

(cffi:defcfun ("mitie_save_binary_relation_detector" #.(swig-lispify "mitie_save_binary_relation_detector" 'function)) :int
  (filename :string)
  (detector :pointer))

(cffi:defcfun ("mitie_create_ner_training_instance" #.(swig-lispify "mitie_create_ner_training_instance" 'function)) :pointer
  (tokens :pointer))

(cffi:defcfun ("mitie_ner_training_instance_num_tokens" #.(swig-lispify "mitie_ner_training_instance_num_tokens" 'function)) :unsigned-long
  (instance :pointer))

(cffi:defcfun ("mitie_ner_training_instance_num_entities" #.(swig-lispify "mitie_ner_training_instance_num_entities" 'function)) :unsigned-long
  (instance :pointer))

(cffi:defcfun ("mitie_overlaps_any_entity" #.(swig-lispify "mitie_overlaps_any_entity" 'function)) :int
  (instance :pointer)
  (start :unsigned-long)
  (length :unsigned-long))

(cffi:defcfun ("mitie_add_ner_training_entity" #.(swig-lispify "mitie_add_ner_training_entity" 'function)) :int
  (instance :pointer)
  (start :unsigned-long)
  (length :unsigned-long)
  (label :string))

(cffi:defcfun ("mitie_create_ner_trainer" #.(swig-lispify "mitie_create_ner_trainer" 'function)) :pointer
  (filename :string))

(cffi:defcfun ("mitie_ner_trainer_size" #.(swig-lispify "mitie_ner_trainer_size" 'function)) :unsigned-long
  (trainer :pointer))

(cffi:defcfun ("mitie_add_ner_training_instance" #.(swig-lispify "mitie_add_ner_training_instance" 'function)) :int
  (trainer :pointer)
  (instance :pointer))

(cffi:defcfun ("mitie_ner_trainer_set_beta" #.(swig-lispify "mitie_ner_trainer_set_beta" 'function)) :void
  (trainer :pointer)
  (beta :double))

(cffi:defcfun ("mitie_ner_trainer_get_beta" #.(swig-lispify "mitie_ner_trainer_get_beta" 'function)) :double
  (trainer :pointer))

(cffi:defcfun ("mitie_ner_trainer_set_num_threads" #.(swig-lispify "mitie_ner_trainer_set_num_threads" 'function)) :void
  (trainer :pointer)
  (num_threads :unsigned-long))

(cffi:defcfun ("mitie_ner_trainer_get_num_threads" #.(swig-lispify "mitie_ner_trainer_get_num_threads" 'function)) :unsigned-long
  (trainer :pointer))

(cffi:defcfun ("mitie_train_named_entity_extractor" #.(swig-lispify "mitie_train_named_entity_extractor" 'function)) :pointer
  (trainer :pointer))

(cffi:defcfun ("mitie_create_binary_relation_trainer" #.(swig-lispify "mitie_create_binary_relation_trainer" 'function)) :pointer
  (relation_name :string)
  (ner :pointer))

(cffi:defcfun ("mitie_binary_relation_trainer_num_positive_examples" #.(swig-lispify "mitie_binary_relation_trainer_num_positive_examples" 'function)) :unsigned-long
  (trainer :pointer))

(cffi:defcfun ("mitie_binary_relation_trainer_num_negative_examples" #.(swig-lispify "mitie_binary_relation_trainer_num_negative_examples" 'function)) :unsigned-long
  (trainer :pointer))

(cffi:defcfun ("mitie_add_positive_binary_relation" #.(swig-lispify "mitie_add_positive_binary_relation" 'function)) :int
  (trainer :pointer)
  (tokens :pointer)
  (arg1_start :unsigned-long)
  (arg1_length :unsigned-long)
  (arg2_start :unsigned-long)
  (arg2_length :unsigned-long))

(cffi:defcfun ("mitie_add_negative_binary_relation" #.(swig-lispify "mitie_add_negative_binary_relation" 'function)) :int
  (trainer :pointer)
  (tokens :pointer)
  (arg1_start :unsigned-long)
  (arg1_length :unsigned-long)
  (arg2_start :unsigned-long)
  (arg2_length :unsigned-long))

(cffi:defcfun ("mitie_binary_relation_trainer_set_beta" #.(swig-lispify "mitie_binary_relation_trainer_set_beta" 'function)) :void
  (trainer :pointer)
  (beta :double))

(cffi:defcfun ("mitie_binary_relation_trainer_get_beta" #.(swig-lispify "mitie_binary_relation_trainer_get_beta" 'function)) :double
  (trainer :pointer))

(cffi:defcfun ("mitie_binary_relation_trainer_set_num_threads" #.(swig-lispify "mitie_binary_relation_trainer_set_num_threads" 'function)) :void
  (trainer :pointer)
  (num_threads :unsigned-long))

(cffi:defcfun ("mitie_binary_relation_trainer_get_num_threads" #.(swig-lispify "mitie_binary_relation_trainer_get_num_threads" 'function)) :unsigned-long
  (trainer :pointer))

(cffi:defcfun ("mitie_train_binary_relation_detector" #.(swig-lispify "mitie_train_binary_relation_detector" 'function)) :pointer
  (trainer :pointer))


