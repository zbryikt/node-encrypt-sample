require! <[fs crypto]>
# directly use crypto for RSA encryption
# use ssh-keygen to generate RSA key pairs.
# ssh-keygen -f key
# ssh-kengen -f key -e -m pem > key.pem.pub

keypair = do
  private: fs.read-file-sync \key .toString!
  public: fs.read-file-sync \key.pem.pub .toString!

enc = crypto.publicEncrypt keypair.public, new Buffer('hello world')
dec = crypto.privateDecrypt keypair.private, enc

console.log "this is the decoded string: ", dec.toString!
