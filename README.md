[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/SPs4PNWX)
# Lab 1 : CEG 3400 Intro to Cyber Security

## Name: Jonathan Owens

### Task 1: Hashing

**Reminder Deliverable:** Is your `salted-data.csv` in this repository?

Answer the following in this file:

* How many unique users are in the data?
  - 42
* How many salts did you create?
  - 42, one unique 5 character salt for each user. 
* How many possible combinations will I need to try to figure out the secret ID
  of all students (assume I know all potential secret IDs and have your 
  `salted-data.csv`)
    - Each salt is 5 characters using A–Z, a–z, and 0–9 (62 characters total).
    So: 62^5 = 916,132,832 combinations per user.
    For 42 users: 916,132,832 × 42 = 38,477,578,944 combinations.
* Instead of salts, if you were to use a nonce (unique number for each hashed
  field) how many possible combinations would I need to try?
    - Each row uses a unique 5-digit nonce (range: 10000–99999), giving 90,000 possible nonces per row. Since there are 1,303 rows: 90,000 × 1,303 = 117,270,000 total combinations. However, because the nonce is stored with the hash, only the ID needs to be guessed.
* Given the above, if this quiz data were *actual* class data, say for example
  your final exam, how would you store this dataset?  Why?
    - I would store that dataset in a secure location using file encryption. Using hashed indentifiers like sha-256 with salt. Then restrict the access to only authorized users. This will ensure unauthorized access to the dataset.
```bash
please put any cool bash one-liners or other piped commands you
learned/struggled with for task 1 here
```

---

### Task 2: Crypto Mining

**Reminder Deliverable:** Is your "mining" code in this repository (`mining/`)?
**Reminder Deliverable:** Is your nonce + word combos in `coins.txt`?

Answer the following:

* Paste your ***nonce+word(s) and hash(s)*** below ( either 3x `000` hashes or 1x `0000`
hash)

```
10Acuff's: 0001f8d6cc04ec4ae67b18d0946458229d1534deaa3bc3f0546d59d59884f042
10Agatha's: 0004d535089deaf15dc43cf71a98a342877fe054ce7232e03b33a50ef4bd116c
10Galileo's: 000bdb842c72dd470c4d5f2095aef1852a961b0e8862f87aad4c55eb55ce929a
10Montanans: 00091a0d931ce7f8b1d5c47ddb5d2cebd1e02610e88489303bf67c01afe49a49
10Nagy: 000486aea0e9717734209a65c68d9048afb5bac7c15bfec94fefdda47fe3957c
10Rabat's: 000b893ae12d1f04c2e09e386b2babb82bcbddf0277f265f72f54af06e99896e
10ballast: 000278e582cf31dd74ca1db5ef0fa36817a031aefcc91e9343b4ed02f8e2f85b
10chariest: 000307e04aa05082168970932e0e187746d8a7610103fdb05c6dd162c3216a9b
10circumlocution's: 00006906ffc51d3f6bdbea780ff9652e686c78cd1028b144d9d1c4918fb13c34

```

* How many words were in your dictionary?
  - 104334 /usr/share/dict/american-english
* How many nonces did your code iterate over?
  - From ( 10 - 9999 ), so 9989.
* What was the maximum number of hashes your code *could* compute given the above?
  - 104,334 words × 9,990 nonces = 1,042,265,660 hashes. I had my code stop after it found a 4 to make it stop.
* What did you think about Task 2?
  - It was really cool to see how rare certain hash patterns are. It can take a very long time to find a valuable hash. 
* Is there a better way than brute force to attempt to get higher valued coins?
  - Not really
* Why or why not?
  - Sha-256 is designed to be irreversable and unpredictable so brute force is the only way to find specific pattern.


```bash
please put any cool bash one-liners or other piped commands you
learned/struggled with for task 2 here
```

