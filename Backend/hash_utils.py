import hashlib

def hash_image_bytes(image_bytes):
    return hashlib.sha256(image_bytes).hexdigest()
