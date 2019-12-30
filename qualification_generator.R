load("word_index")
load("index_word")
load("transition_matrix")

t = 500

current_index = word_index[["."]]
output = NULL
for (i in 1:t) {
  current_index = sample(1:nrow(transition_matrix), 1, prob = transition_matrix[current_index,])
  output = c(output, current_index)
}

word_output = index_word[output]

title_output = NULL
current_title = ""
for (word in word_output) {
  if (word == ".") {
    title_output = c(title_output, current_title)
    current_title = ""
  }
  else {
    current_title = paste0(current_title, word, " ")
  }
}

print(title_output)

