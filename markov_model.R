rits = read.csv("Qualifications_export_20191121.csv", stringsAsFactors = FALSE)

titles = rits$Qualification.Title

all_titles = NULL
for (title in titles) {
  all_titles = c(all_titles, strsplit(title, " ")[[1]], ".")
}

word_index = list()
index_word = NULL
counter = 1
for (word in all_titles) {
  if (is.null(word_index[[word]])) {
    word_index[[word]] = counter
    index_word = c(index_word, word)
    counter = counter + 1
  }
}

transition_matrix = array(0, c(length(word_index), length(word_index)))

for (i in 1:(length(all_titles) - 1)) {
  transition_matrix[unlist(word_index[all_titles[i]]), unlist(word_index[all_titles[i+1]])] = transition_matrix[unlist(word_index[all_titles[i]]), unlist(word_index[all_titles[i+1]])] + 1
}

for (i in 1:nrow(transition_matrix)) {
  transition_matrix[i,] = transition_matrix[i,] / sum(transition_matrix[i,])
}

save(transition_matrix, file = "transition_matrix")
save(word_index, file = "word_index")
save(index_word, file = "index_word")