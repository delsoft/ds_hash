module DsHash
    MAJOR = 0
    MINOR = 1
    PATCH = 0
    BUILD = 'pre'
    VERSION = [MAJOR, MINOR, PATCH, BUILD].compact.join('.')
end  