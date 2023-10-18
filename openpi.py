import openai
import os
import sys

# Set up the OpenAI API key
openai.api_key = "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"

# Set up the file path where the response will be saved
folder_path = os.path.expanduser("~/Desktop/")
if not os.path.exists(folder_path):
    os.makedirs(folder_path)
file_path = os.path.join(folder_path, "que.txt")

# Set up the prompt and generate a response
#prompt1 = sys.argv[1]
prompt1 = input("ask: ")
with open(file_path, "r") as f:
    prompt2 = f.read()

prompt = prompt1 + ":\n"+ prompt2
print(prompt)

response = openai.Completion.create(
    engine="text-davinci-003",
    prompt=prompt,
    max_tokens=1024,
    n=1,
    stop=None,
    temperature=0.5,
)
text = response.choices[0].text

print(text)

# Save the response to a text file
# with open(file_path, "w") as f:
#     f.write(text)

# Print a message indicating where the response was saved
# print(f"Response saved to {file_path}")
