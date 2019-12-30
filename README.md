# qualification-title-generator
Generates fake qualification titles using a Markov model trained on the Ofqual register

A CSV file of all the qualifications regulated by Ofqual can be downloaded from the Ofqual website. markov_model.R takes this list of qualifications and constructs an order 1 Markov Language Model, which is then saved.

qualification_generator.R takes this model and generates fake qualification titles.
