# Enigma

## Final project for Mod 1.

## Functionality:
Enigma Class includes #encrypt & #decrypt, and work as described in the project requirements. Encrypt.rb and Decrypt.rb runner files accept the anticipated arguments. This meets expectations.

## Object Oriented Programming:
The project is broken into additional classes for clarity. The `key` `offset` and `shift` classes are of decent sizes and are justifiable for their intended roles. The code between classes is dry with a minor exception being the `#remove_and_pad` method, which is similar but not identical. The law of demeter appears to be followed throughout objects. No inheritance or module was used, so while this project meets expectations, it is not above expectations.

## Ruby Conventions and Mechanics
The methods are vey well names and are clear in the jobs they are doing. Appropriate enumerables were used for specific instances. Multiple hashes are used. The only method that is longer than 10 lines is `#replace_all` in the enigma class, which is 11. That single method denies the project's above expectations status, and instead will strongly meet expectations.
Note: I was introduced to a linter on my final refactor. If this was not allowed, the branch prior can be recalled.

## Test Driven Development
No mocks or stubs are used in the project testing, so therefore the project is not above expectations. Tests were written prior to implementing code as much as possible. Edge cases were addressed. Methods are individually tested. SimpleCov is 100%. This meets expectations.

## Version Control
Over 40 commits and well over 4 pull requests. Branching was done for separate features, and for separate hotfix / refactor sessions. This is above expectations.
