<?php
namespace TcApi;

class TcApi
{

    /**
     * @var string
     */
    public $method;

    /**
     * @var resource
     */
    protected $_ch;

    /**
     * @var string
     */
    public $apiName;

    
    public function __construct()
    {
        // 建立 CURL 連線
        $this->_ch = curl_init();

    }

    /**
     * get token
     * @return string
     */
    public function getToken()
    {
       

        // 取 access token
        curl_setopt($this->_ch, CURLOPT_URL, API_URL . "/oauth?authorize");

        // 設定擷取的URL網址
        curl_setopt($this->_ch, CURLOPT_POST, TRUE);

        // the variable
        curl_setopt($this->_ch, CURLOPT_RETURNTRANSFER, TRUE);


        curl_setopt($this->_ch, CURLOPT_POSTFIELDS, array(
            'client_id' => CLIENT_ID,
            'client_secret' => CLIENT_SECRET,
            'grant_type' => 'client_credentials'
        ));

        $data = curl_exec($this->_ch);
        $data = json_decode($data);


        $access_token = $data->access_token;

        $authorization = "Authorization: Bearer " . $access_token;

        return $authorization;
    }

    public function setMethod($method){
        $this->method = $method;
    }



    public function getData($data = null)
    {
        $authorization = $this->getToken();

        curl_setopt($this->_ch, CURLOPT_URL, API_URL.'/'.$this->apiName);
        curl_setopt($this->_ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json' , $authorization )); // **Inject Token into Header**
        curl_setopt($this->_ch, CURLOPT_CUSTOMREQUEST, $this->method);
        curl_setopt($this->_ch, CURLOPT_RETURNTRANSFER, true);
//        curl_setopt($this->_ch, CURLOPT_POST, TRUE);
        if ($data) {
            $data = json_encode($data);
            curl_setopt($this->_ch, CURLOPT_POST, TRUE);
            curl_setopt($this->_ch, CURLOPT_POSTFIELDS, $data);
        }

//curl_setopt($this->_ch, CURLOPT_FOLLOWLOCATION, 1);
        $result = curl_exec($this->_ch);

        $arr = json_decode($result);

        return $arr;
    }
}