local ffi	= require("ffi")

ffi.cdef [[
typedef void CURL;

typedef enum {
	CURLE_OK = 0,
	CURLE_UNSUPPORTED_PROTOCOL,
	CURLE_FAILED_INIT,
	CURLE_URL_MALFORMAT,
	CURLE_NOT_BUILT_IN,
	CURLE_COULDNT_RESOLVE_PROXY,
	CURLE_COULDNT_RESOLVE_HOST,
	CURLE_COULDNT_CONNECT,
	CURLE_WEIRD_SERVER_REPLY,
	CURLE_REMOTE_ACCESS_DENIED,
	CURLE_FTP_ACCEPT_FAILED,
	CURLE_FTP_WEIRD_PASS_REPLY,
	CURLE_FTP_ACCEPT_TIMEOUT,
	CURLE_FTP_WEIRD_PASV_REPLY,
	CURLE_FTP_WEIRD_227_FORMAT,
	CURLE_FTP_CANT_GET_HOST,
	CURLE_HTTP2,
	CURLE_FTP_COULDNT_SET_TYPE,
	CURLE_PARTIAL_FILE,
	CURLE_FTP_COULDNT_RETR_FILE,
	CURLE_OBSOLETE20,
	CURLE_QUOTE_ERROR,
	CURLE_HTTP_RETURNED_ERROR,
	CURLE_WRITE_ERROR,
	CURLE_OBSOLETE24,
	CURLE_UPLOAD_FAILED,
	CURLE_READ_ERROR,
	CURLE_OUT_OF_MEMORY,
	CURLE_OPERATION_TIMEDOUT,
	CURLE_OBSOLETE29,
	CURLE_FTP_PORT_FAILED,
	CURLE_FTP_COULDNT_USE_REST,
	CURLE_OBSOLETE32,
	CURLE_RANGE_ERROR,
	CURLE_HTTP_POST_ERROR,
	CURLE_SSL_CONNECT_ERROR,
	CURLE_BAD_DOWNLOAD_RESUME,
	CURLE_FILE_COULDNT_READ_FILE,
	CURLE_LDAP_CANNOT_BIND,
	CURLE_LDAP_SEARCH_FAILED,
	CURLE_OBSOLETE40,
	CURLE_FUNCTION_NOT_FOUND,
	CURLE_ABORTED_BY_CALLBACK,
	CURLE_BAD_FUNCTION_ARGUMENT,
	CURLE_OBSOLETE44,
	CURLE_INTERFACE_FAILED,
	CURLE_OBSOLETE46,
	CURLE_TOO_MANY_REDIRECTS,
	CURLE_UNKNOWN_OPTION,
	CURLE_SETOPT_OPTION_SYNTAX,
	CURLE_OBSOLETE50,
	CURLE_OBSOLETE51,
	CURLE_GOT_NOTHING,
	CURLE_SSL_ENGINE_NOTFOUND,
	CURLE_SSL_ENGINE_SETFAILED,
	CURLE_SEND_ERROR,
	CURLE_RECV_ERROR,
	CURLE_OBSOLETE57,
	CURLE_SSL_CERTPROBLEM,
	CURLE_SSL_CIPHER,
	CURLE_PEER_FAILED_VERIFICATION,
	CURLE_BAD_CONTENT_ENCODING,
	CURLE_OBSOLETE62,
	CURLE_FILESIZE_EXCEEDED,
	CURLE_USE_SSL_FAILED,
	CURLE_SEND_FAIL_REWIND,
	CURLE_SSL_ENGINE_INITFAILED,
	CURLE_LOGIN_DENIED,
	CURLE_TFTP_NOTFOUND,
	CURLE_TFTP_PERM,
	CURLE_REMOTE_DISK_FULL,
	CURLE_TFTP_ILLEGAL,
	CURLE_TFTP_UNKNOWNID,
	CURLE_REMOTE_FILE_EXISTS,
	CURLE_TFTP_NOSUCHUSER,
	CURLE_CONV_FAILED,
	CURLE_OBSOLETE76,
	CURLE_SSL_CACERT_BADFILE,
	CURLE_REMOTE_FILE_NOT_FOUND,
	CURLE_SSH,
	CURLE_SSL_SHUTDOWN_FAILED,
	CURLE_AGAIN,
	CURLE_SSL_CRL_BADFILE,
	CURLE_SSL_ISSUER_ERROR,
	CURLE_FTP_PRET_FAILED,
	CURLE_RTSP_CSEQ_ERROR,
	CURLE_RTSP_SESSION_ERROR,
	CURLE_FTP_BAD_FILE_LIST,
	CURLE_CHUNK_FAILED,
	CURLE_NO_CONNECTION_AVAILABLE,
	CURLE_SSL_PINNEDPUBKEYNOTMATCH,
	CURLE_SSL_INVALIDCERTSTATUS,
	CURLE_HTTP2_STREAM,
	CURLE_RECURSIVE_API_CALL,
	CURLE_AUTH_ERROR,
	CURLE_HTTP3,
	CURLE_QUIC_CONNECT_ERROR,
	CURLE_PROXY,
	CURLE_SSL_CLIENTCERT,
	CURLE_UNRECOVERABLE_POLL,
	CURL_LAST
} CURLcode;

typedef enum {
	CURLOPT_WRITEDATA = 10001,
	CURLOPT_URL = 10002,
	CURLOPT_PORT = 3,
	CURLOPT_PROXY = 10004,
	CURLOPT_USERPWD = 10005,
	CURLOPT_PROXYUSERPWD = 10006,
	CURLOPT_RANGE = 10007,
	CURLOPT_READDATA = 10009,
	CURLOPT_ERRORBUFFER = 10010,
	CURLOPT_WRITEFUNCTION = 20011,
	CURLOPT_READFUNCTION = 20012,
	CURLOPT_TIMEOUT = 13,
	CURLOPT_INFILESIZE = 14,
	CURLOPT_POSTFIELDS = 10015,
	CURLOPT_REFERER = 10016,
	CURLOPT_FTPPORT = 10017,
	CURLOPT_USERAGENT = 10018,
	CURLOPT_LOW_SPEED_LIMIT = 19,
	CURLOPT_LOW_SPEED_TIME = 20,
	CURLOPT_RESUME_FROM = 21,
	CURLOPT_COOKIE = 10022,
	CURLOPT_HTTPHEADER = 10023,
	CURLOPT_HTTPPOST = 10024,
	CURLOPT_SSLCERT = 10025,
	CURLOPT_KEYPASSWD = 10026,
	CURLOPT_CRLF = 27,
	CURLOPT_QUOTE = 10028,
	CURLOPT_HEADERDATA = 10029,
	CURLOPT_COOKIEFILE = 10031,
	CURLOPT_SSLVERSION = 32,
	CURLOPT_TIMECONDITION = 33,
	CURLOPT_TIMEVALUE = 34,
	CURLOPT_CUSTOMREQUEST = 10036,
	CURLOPT_STDERR = 10037,
	CURLOPT_POSTQUOTE = 10039,
	CURLOPT_OBSOLETE40 = 10040,
	CURLOPT_VERBOSE = 41,
	CURLOPT_HEADER = 42,
	CURLOPT_NOPROGRESS = 43,
	CURLOPT_NOBODY = 44,
	CURLOPT_FAILONERROR = 45,
	CURLOPT_UPLOAD = 46,
	CURLOPT_POST = 47,
	CURLOPT_DIRLISTONLY = 48,
	CURLOPT_APPEND = 50,
	CURLOPT_NETRC = 51,
	CURLOPT_FOLLOWLOCATION = 52,
	CURLOPT_TRANSFERTEXT = 53,
	CURLOPT_PUT = 54,
	CURLOPT_PROGRESSFUNCTION = 20056,
	CURLOPT_XFERINFODATA = 10057,
	CURLOPT_PROGRESSDATA = 10057,
	CURLOPT_AUTOREFERER = 58,
	CURLOPT_PROXYPORT = 59,
	CURLOPT_POSTFIELDSIZE = 60,
	CURLOPT_HTTPPROXYTUNNEL = 61,
	CURLOPT_INTERFACE = 10062,
	CURLOPT_KRBLEVEL = 10063,
	CURLOPT_SSL_VERIFYPEER = 64,
	CURLOPT_CAINFO = 10065,
	CURLOPT_MAXREDIRS = 68,
	CURLOPT_FILETIME = 69,
	CURLOPT_TELNETOPTIONS = 10070,
	CURLOPT_MAXCONNECTS = 71,
	CURLOPT_OBSOLETE72 = 72,
	CURLOPT_FRESH_CONNECT = 74,
	CURLOPT_FORBID_REUSE = 75,
	CURLOPT_RANDOM_FILE = 10076,
	CURLOPT_EGDSOCKET = 10077,
	CURLOPT_CONNECTTIMEOUT = 78,
	CURLOPT_HEADERFUNCTION = 20079,
	CURLOPT_HTTPGET = 80,
	CURLOPT_SSL_VERIFYHOST = 81,
	CURLOPT_COOKIEJAR = 10082,
	CURLOPT_SSL_CIPHER_LIST = 10083,
	CURLOPT_HTTP_VERSION = 84,
	CURLOPT_FTP_USE_EPSV = 85,
	CURLOPT_SSLCERTTYPE = 10086,
	CURLOPT_SSLKEY = 10087,
	CURLOPT_SSLKEYTYPE = 10088,
	CURLOPT_SSLENGINE = 10089,
	CURLOPT_SSLENGINE_DEFAULT = 90,
	CURLOPT_DNS_USE_GLOBAL_CACHE = 91,
	CURLOPT_DNS_CACHE_TIMEOUT = 92,
	CURLOPT_PREQUOTE = 10093,
	CURLOPT_DEBUGFUNCTION = 20094,
	CURLOPT_DEBUGDATA = 10095,
	CURLOPT_COOKIESESSION = 96,
	CURLOPT_CAPATH = 10097,
	CURLOPT_BUFFERSIZE = 98,
	CURLOPT_NOSIGNAL = 99,
	CURLOPT_SHARE = 10100,
	CURLOPT_PROXYTYPE = 101,
	CURLOPT_ACCEPT_ENCODING = 10102,
	CURLOPT_PRIVATE = 10103,
	CURLOPT_HTTP200ALIASES = 10104,
	CURLOPT_UNRESTRICTED_AUTH = 105,
	CURLOPT_FTP_USE_EPRT = 106,
	CURLOPT_HTTPAUTH = 107,
	CURLOPT_SSL_CTX_FUNCTION = 20108,
	CURLOPT_SSL_CTX_DATA = 10109,
	CURLOPT_FTP_CREATE_MISSING_DIRS = 110,
	CURLOPT_PROXYAUTH = 111,
	CURLOPT_FTP_RESPONSE_TIMEOUT = 112,
	CURLOPT_SERVER_RESPONSE_TIMEOUT = 112,
	CURLOPT_IPRESOLVE = 113,
	CURLOPT_MAXFILESIZE = 114,
	CURLOPT_INFILESIZE_LARGE = 30115,
	CURLOPT_RESUME_FROM_LARGE = 30116,
	CURLOPT_MAXFILESIZE_LARGE = 30117,
	CURLOPT_NETRC_FILE = 10118,
	CURLOPT_USE_SSL = 119,
	CURLOPT_POSTFIELDSIZE_LARGE = 30120,
	CURLOPT_TCP_NODELAY = 121,
	CURLOPT_FTPSSLAUTH = 129,
	CURLOPT_IOCTLFUNCTION = 20130,
	CURLOPT_IOCTLDATA = 10131,
	CURLOPT_FTP_ACCOUNT = 10134,
	CURLOPT_COOKIELIST = 10135,
	CURLOPT_IGNORE_CONTENT_LENGTH = 136,
	CURLOPT_FTP_SKIP_PASV_IP = 137,
	CURLOPT_FTP_FILEMETHOD = 138,
	CURLOPT_LOCALPORT = 139,
	CURLOPT_LOCALPORTRANGE = 140,
	CURLOPT_CONNECT_ONLY = 141,
	CURLOPT_CONV_FROM_NETWORK_FUNCTION = 20142,
	CURLOPT_CONV_TO_NETWORK_FUNCTION = 20143,
	CURLOPT_CONV_FROM_UTF8_FUNCTION = 20144,
	CURLOPT_MAX_SEND_SPEED_LARGE = 30145,
	CURLOPT_MAX_RECV_SPEED_LARGE = 30146,
	CURLOPT_FTP_ALTERNATIVE_TO_USER = 10147,
	CURLOPT_SOCKOPTFUNCTION = 20148,
	CURLOPT_SOCKOPTDATA = 10149,
	CURLOPT_SSL_SESSIONID_CACHE = 150,
	CURLOPT_SSH_AUTH_TYPES = 151,
	CURLOPT_SSH_PUBLIC_KEYFILE = 10152,
	CURLOPT_SSH_PRIVATE_KEYFILE = 10153,
	CURLOPT_FTP_SSL_CCC = 154,
	CURLOPT_TIMEOUT_MS = 155,
	CURLOPT_CONNECTTIMEOUT_MS = 156,
	CURLOPT_HTTP_TRANSFER_DECODING = 157,
	CURLOPT_HTTP_CONTENT_DECODING = 158,
	CURLOPT_NEW_FILE_PERMS = 159,
	CURLOPT_NEW_DIRECTORY_PERMS = 160,
	CURLOPT_POSTREDIR = 161,
	CURLOPT_SSH_HOST_PUBLIC_KEY_MD5 = 10162,
	CURLOPT_OPENSOCKETFUNCTION = 20163,
	CURLOPT_OPENSOCKETDATA = 10164,
	CURLOPT_COPYPOSTFIELDS = 10165,
	CURLOPT_PROXY_TRANSFER_MODE = 166,
	CURLOPT_SEEKFUNCTION = 20167,
	CURLOPT_SEEKDATA = 10168,
	CURLOPT_CRLFILE = 10169,
	CURLOPT_ISSUERCERT = 10170,
	CURLOPT_ADDRESS_SCOPE = 171,
	CURLOPT_CERTINFO = 172,
	CURLOPT_USERNAME = 10173,
	CURLOPT_PASSWORD = 10174,
	CURLOPT_PROXYUSERNAME = 10175,
	CURLOPT_PROXYPASSWORD = 10176,
	CURLOPT_NOPROXY = 10177,
	CURLOPT_TFTP_BLKSIZE = 178,
	CURLOPT_SOCKS5_GSSAPI_SERVICE = 10179,
	CURLOPT_SOCKS5_GSSAPI_NEC = 180,
	CURLOPT_PROTOCOLS = 181,
	CURLOPT_REDIR_PROTOCOLS = 182,
	CURLOPT_SSH_KNOWNHOSTS = 10183,
	CURLOPT_SSH_KEYFUNCTION = 20184,
	CURLOPT_SSH_KEYDATA = 10185,
	CURLOPT_MAIL_FROM = 10186,
	CURLOPT_MAIL_RCPT = 10187,
	CURLOPT_FTP_USE_PRET = 188,
	CURLOPT_RTSP_REQUEST = 189,
	CURLOPT_RTSP_SESSION_ID = 10190,
	CURLOPT_RTSP_STREAM_URI = 10191,
	CURLOPT_RTSP_TRANSPORT = 10192,
	CURLOPT_RTSP_CLIENT_CSEQ = 193,
	CURLOPT_RTSP_SERVER_CSEQ = 194,
	CURLOPT_INTERLEAVEDATA = 10195,
	CURLOPT_INTERLEAVEFUNCTION = 20196,
	CURLOPT_WILDCARDMATCH = 197,
	CURLOPT_CHUNK_BGN_FUNCTION = 20198,
	CURLOPT_CHUNK_END_FUNCTION = 20199,
	CURLOPT_FNMATCH_FUNCTION = 20200,
	CURLOPT_CHUNK_DATA = 10201,
	CURLOPT_FNMATCH_DATA = 10202,
	CURLOPT_RESOLVE = 10203,
	CURLOPT_TLSAUTH_USERNAME = 10204,
	CURLOPT_TLSAUTH_PASSWORD = 10205,
	CURLOPT_TLSAUTH_TYPE = 10206,
	CURLOPT_TRANSFER_ENCODING = 207,
	CURLOPT_CLOSESOCKETFUNCTION = 20208,
	CURLOPT_CLOSESOCKETDATA = 10209,
	CURLOPT_GSSAPI_DELEGATION = 210,
	CURLOPT_DNS_SERVERS = 10211,
	CURLOPT_ACCEPTTIMEOUT_MS = 212,
	CURLOPT_TCP_KEEPALIVE = 213,
	CURLOPT_TCP_KEEPIDLE = 214,
	CURLOPT_TCP_KEEPINTVL = 215,
	CURLOPT_SSL_OPTIONS = 216,
	CURLOPT_MAIL_AUTH = 10217,
	CURLOPT_SASL_IR = 218,
	CURLOPT_XFERINFOFUNCTION = 20219,
	CURLOPT_XOAUTH2_BEARER = 10220,
	CURLOPT_DNS_INTERFACE = 10221,
	CURLOPT_DNS_LOCAL_IP4 = 10222,
	CURLOPT_DNS_LOCAL_IP6 = 10223,
	CURLOPT_LOGIN_OPTIONS = 10224,
	CURLOPT_SSL_ENABLE_NPN = 225,
	CURLOPT_SSL_ENABLE_ALPN = 226,
	CURLOPT_EXPECT_100_TIMEOUT_MS = 227,
	CURLOPT_PROXYHEADER = 10228,
	CURLOPT_HEADEROPT = 229,
	CURLOPT_PINNEDPUBLICKEY = 10230,
	CURLOPT_UNIX_SOCKET_PATH = 10231,
	CURLOPT_SSL_VERIFYSTATUS = 232,
	CURLOPT_SSL_FALSESTART = 233,
	CURLOPT_PATH_AS_IS = 234,
	CURLOPT_PROXY_SERVICE_NAME = 10235,
	CURLOPT_SERVICE_NAME = 10236,
	CURLOPT_PIPEWAIT = 237,
	CURLOPT_DEFAULT_PROTOCOL = 10238,
	CURLOPT_STREAM_WEIGHT = 239,
	CURLOPT_STREAM_DEPENDS = 10240,
	CURLOPT_STREAM_DEPENDS_E = 10241,
	CURLOPT_TFTP_NO_OPTIONS = 242,
	CURLOPT_CONNECT_TO = 10243,
	CURLOPT_TCP_FASTOPEN = 244,
	CURLOPT_KEEP_SENDING_ON_ERROR = 245,
	CURLOPT_PROXY_CAINFO = 10246,
	CURLOPT_PROXY_CAPATH = 10247,
	CURLOPT_PROXY_SSL_VERIFYPEER = 248,
	CURLOPT_PROXY_SSL_VERIFYHOST = 249,
	CURLOPT_PROXY_SSLVERSION = 250,
	CURLOPT_PROXY_TLSAUTH_USERNAME = 10251,
	CURLOPT_PROXY_TLSAUTH_PASSWORD = 10252,
	CURLOPT_PROXY_TLSAUTH_TYPE = 10253,
	CURLOPT_PROXY_SSLCERT = 10254,
	CURLOPT_PROXY_SSLCERTTYPE = 10255,
	CURLOPT_PROXY_SSLKEY = 10256,
	CURLOPT_PROXY_SSLKEYTYPE = 10257,
	CURLOPT_PROXY_KEYPASSWD = 10258,
	CURLOPT_PROXY_SSL_CIPHER_LIST = 10259,
	CURLOPT_PROXY_CRLFILE = 10260,
	CURLOPT_PROXY_SSL_OPTIONS = 261,
	CURLOPT_PRE_PROXY = 10262,
	CURLOPT_PROXY_PINNEDPUBLICKEY = 10263,
	CURLOPT_ABSTRACT_UNIX_SOCKET = 10264,
	CURLOPT_SUPPRESS_CONNECT_HEADERS = 265,
	CURLOPT_REQUEST_TARGET = 10266,
	CURLOPT_SOCKS5_AUTH = 267,
	CURLOPT_SSH_COMPRESSION = 268,
	CURLOPT_MIMEPOST = 10269,
	CURLOPT_TIMEVALUE_LARGE = 30270,
	CURLOPT_HAPPY_EYEBALLS_TIMEOUT_MS = 271,
	CURLOPT_RESOLVER_START_FUNCTION = 20272,
	CURLOPT_RESOLVER_START_DATA = 10273,
	CURLOPT_HAPROXYPROTOCOL = 274,
	CURLOPT_DNS_SHUFFLE_ADDRESSES = 275,
	CURLOPT_TLS13_CIPHERS = 10276,
	CURLOPT_PROXY_TLS13_CIPHERS = 10277,
	CURLOPT_DISALLOW_USERNAME_IN_URL = 278,
	CURLOPT_DOH_URL = 10279,
	CURLOPT_UPLOAD_BUFFERSIZE = 280,
	CURLOPT_UPKEEP_INTERVAL_MS = 281,
	CURLOPT_CURLU = 10282,
	CURLOPT_TRAILERFUNCTION = 20283,
	CURLOPT_TRAILERDATA = 10284,
	CURLOPT_HTTP09_ALLOWED = 285,
	CURLOPT_ALTSVC_CTRL = 286,
	CURLOPT_ALTSVC = 10287,
	CURLOPT_MAXAGE_CONN = 288,
	CURLOPT_SASL_AUTHZID = 10289,
	CURLOPT_MAIL_RCPT_ALLLOWFAILS = 290,
	CURLOPT_SSLCERT_BLOB = 40291,
	CURLOPT_SSLKEY_BLOB = 40292,
	CURLOPT_PROXY_SSLCERT_BLOB = 40293,
	CURLOPT_PROXY_SSLKEY_BLOB = 40294,
	CURLOPT_ISSUERCERT_BLOB = 40295,
	CURLOPT_PROXY_ISSUERCERT = 10296,
	CURLOPT_PROXY_ISSUERCERT_BLOB = 40297,
	CURLOPT_SSL_EC_CURVES = 10298,
	CURLOPT_HSTS_CTRL = 299,
	CURLOPT_HSTS = 10300,
	CURLOPT_HSTSREADFUNCTION = 20301,
	CURLOPT_HSTSREADDATA = 10302,
	CURLOPT_HSTSWRITEFUNCTION = 20303,
	CURLOPT_HSTSWRITEDATA = 10304,
	CURLOPT_AWS_SIGV4 = 10305,
	CURLOPT_DOH_SSL_VERIFYPEER = 306,
	CURLOPT_DOH_SSL_VERIFYHOST = 307,
	CURLOPT_DOH_SSL_VERIFYSTATUS = 308,
	CURLOPT_CAINFO_BLOB = 40309,
	CURLOPT_PROXY_CAINFO_BLOB = 40310,
	CURLOPT_SSH_HOST_PUBLIC_KEY_SHA256 = 10311,
	CURLOPT_PREREQFUNCTION = 20312,
	CURLOPT_PREREQDATA = 10313,
	CURLOPT_MAXLIFETIME_CONN = 314,
	CURLOPT_MIME_OPTIONS = 315,
	CURLOPT_SSH_HOSTKEYFUNCTION = 20316,
	CURLOPT_SSH_HOSTKEYDATA = 10317,
	CURLOPT_LASTENTRY
} CURLoption;

typedef enum {
	CURLINFO_NONE,
	CURLINFO_EFFECTIVE_URL = 1048577,
	CURLINFO_RESPONSE_CODE = 2097154,
	CURLINFO_TOTAL_TIME = 3145731,
	CURLINFO_NAMELOOKUP_TIME = 3145732,
	CURLINFO_CONNECT_TIME = 3145733,
	CURLINFO_PRETRANSFER_TIME = 3145734,
	CURLINFO_SIZE_UPLOAD = 3145735,
	CURLINFO_SIZE_UPLOAD_T = 6291463,
	CURLINFO_SIZE_DOWNLOAD = 3145736,
	CURLINFO_SIZE_DOWNLOAD_T = 6291464,
	CURLINFO_SPEED_DOWNLOAD = 3145737,
	CURLINFO_SPEED_DOWNLOAD_T = 6291465,
	CURLINFO_SPEED_UPLOAD = 3145738,
	CURLINFO_SPEED_UPLOAD_T = 6291466,
	CURLINFO_HEADER_SIZE = 2097163,
	CURLINFO_REQUEST_SIZE = 2097164,
	CURLINFO_SSL_VERIFYRESULT = 2097165,
	CURLINFO_FILETIME = 2097166,
	CURLINFO_FILETIME_T = 6291470,
	CURLINFO_CONTENT_LENGTH_DOWNLOAD = 3145743,
	CURLINFO_CONTENT_LENGTH_DOWNLOAD_T = 6291471,
	CURLINFO_CONTENT_LENGTH_UPLOAD = 3145744,
	CURLINFO_CONTENT_LENGTH_UPLOAD_T = 6291472,
	CURLINFO_STARTTRANSFER_TIME = 3145745,
	CURLINFO_CONTENT_TYPE = 1048594,
	CURLINFO_REDIRECT_TIME = 3145747,
	CURLINFO_REDIRECT_COUNT = 2097172,
	CURLINFO_PRIVATE = 1048597,
	CURLINFO_HTTP_CONNECTCODE = 2097174,
	CURLINFO_HTTPAUTH_AVAIL = 2097175,
	CURLINFO_PROXYAUTH_AVAIL = 2097176,
	CURLINFO_OS_ERRNO = 2097177,
	CURLINFO_NUM_CONNECTS = 2097178,
	CURLINFO_SSL_ENGINES = 4194331,
	CURLINFO_COOKIELIST = 4194332,
	CURLINFO_LASTSOCKET = 2097181,
	CURLINFO_FTP_ENTRY_PATH = 1048606,
	CURLINFO_REDIRECT_URL = 1048607,
	CURLINFO_PRIMARY_IP = 1048608,
	CURLINFO_APPCONNECT_TIME = 3145761,
	CURLINFO_CERTINFO = 4194338,
	CURLINFO_CONDITION_UNMET = 2097187,
	CURLINFO_RTSP_SESSION_ID = 1048612,
	CURLINFO_RTSP_CLIENT_CSEQ = 2097189,
	CURLINFO_RTSP_SERVER_CSEQ = 2097190,
	CURLINFO_RTSP_CSEQ_RECV = 2097191,
	CURLINFO_PRIMARY_PORT = 2097192,
	CURLINFO_LOCAL_IP = 1048617,
	CURLINFO_LOCAL_PORT = 2097194,
	CURLINFO_TLS_SESSION = 4194347,
	CURLINFO_ACTIVESOCKET = 5242924,
	CURLINFO_TLS_SSL_PTR = 4194349,
	CURLINFO_HTTP_VERSION = 2097198,
	CURLINFO_PROXY_SSL_VERIFYRESULT = 2097199,
	CURLINFO_PROTOCOL = 2097200,
	CURLINFO_SCHEME = 1048625,
	CURLINFO_TOTAL_TIME_T = 6291506,
	CURLINFO_NAMELOOKUP_TIME_T = 6291507,
	CURLINFO_CONNECT_TIME_T = 6291508,
	CURLINFO_PRETRANSFER_TIME_T = 6291509,
	CURLINFO_STARTTRANSFER_TIME_T = 6291510,
	CURLINFO_REDIRECT_TIME_T = 6291511,
	CURLINFO_APPCONNECT_TIME_T = 6291512,
	CURLINFO_RETRY_AFTER = 6291513,
	CURLINFO_EFFECTIVE_METHOD = 1048634,
	CURLINFO_PROXY_ERROR = 2097211,
	CURLINFO_REFERER = 1048636,
	CURLINFO_CAINFO = 1048637,
	CURLINFO_CAPATH = 1048638,
	CURLINFO_LASTONE = 62,
} CURLINFO;

typedef enum {
	CURLVERSION_FIRST,
	CURLVERSION_SECOND,
	CURLVERSION_THIRD,
	CURLVERSION_FOURTH,
	CURLVERSION_FIFTH,
	CURLVERSION_SIXTH,
	CURLVERSION_SEVENTH,
	CURLVERSION_EIGHTH,
	CURLVERSION_NINTH,
	CURLVERSION_TENTH,
	CURLVERSION_LAST /* never actually use this */
} CURLversion;

typedef struct curl_version_info_data {
	CURLversion age;          
	const char *version;      
	unsigned int version_num; 
	const char *host;
	int features;             
	const char *ssl_version;  
	long ssl_version_num;     
	const char *libz_version; 
	const char * const *protocols;
	const char *ares;
	int ares_num;
	const char *libidn;
	int iconv_ver_num;
	const char *libssh_version;
	unsigned int brotli_ver_num;
	const char *brotli_version;
	unsigned int nghttp2_ver_num;
	const char *nghttp2_version;
	const char *quic_version;  
	const char *cainfo;
	const char *capath;
	unsigned int zstd_ver_num;
	const char *zstd_version;
	const char *hyper_version;
	const char *gsasl_version;
} curl_version_info_data;

enum {
	CURLVERSION_NOW = 10	
};

CURL *curl_easy_init();
void curl_easy_cleanup(CURL *handle);
CURLcode curl_easy_setopt(CURL *handle, CURLoption, ...);
CURLcode curl_easy_perform(CURL *easy_handle);
CURLcode curl_easy_getinfo(CURL *curl, CURLINFO info, ...);
char *curl_version();
curl_version_info_data *curl_version_info(CURLversion age);
char *curl_easy_escape(CURL *curl, const char *string, int length);
char *curl_easy_unescape(CURL *curl, const char *url, int inlength, int *outlength);
]]

return ffi.load("curl")
