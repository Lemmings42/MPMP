import json
txt = ''
with open('data.json') as f:
  data = json.load(f)
  for arr in data:
    for n in arr:
      txt += str(n)+','
    txt = txt[:-1]
    txt += '\n'

with open('data.csv', 'w') as f:
  f.write(txt)