<?php

return [

    'limit' => 200,

    'orderBy' => [
        [
            'column' => 'id',
            'direction' => 'desc'
        ]
    ],

    'excludedParameters' => ['api_token', 'temporada'],

];
