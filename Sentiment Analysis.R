# Install necessary packages if not already installed
if (!require("syuzhet")) install.packages("syuzhet", dependencies=TRUE)
if (!require("ggplot2")) install.packages("ggplot2", dependencies=TRUE)
if (!require("tm")) install.packages("tm", dependencies=TRUE)

# Load libraries
library(syuzhet)
library(ggplot2)
library(tm)

# Sample text data
text_data <- c(
  "I love this product!", 
  "This is the worst service ever.", 
  "I'm happy with the quality.", 
  "Very disappointed with the experience."
)

# Perform sentiment analysis using the NRC sentiment dictionary
sentiments <- get_nrc_sentiment(text_data)

# Summarize the results
sentiment_summary <- colSums(sentiments)

# Convert sentiment summary to a data frame for plotting
sentiment_df <- data.frame(sentiment = names(sentiment_summary), count = sentiment_summary)

# Plot the sentiment summary using ggplot2
ggplot(sentiment_df, aes(x = sentiment, y = count, fill = sentiment)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Sentiment Analysis Summary", x = "Sentiment", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Display the sentiment data frame
print(sentiment_df)
