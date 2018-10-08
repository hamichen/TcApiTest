<?php

namespace TcApi;

class SemesterData extends TcApi
{
   public function __construct()
   {
       parent::__construct();
       $this->method ="GET";
       $this->apiName = 'semester-data';
   }

}
