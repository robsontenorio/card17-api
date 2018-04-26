<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines contain the default error messages used by
    | the validator class. Some of these rules have multiple versions such
    | as the size rules. Feel free to tweak each of these messages here.
    |
    */

    'accepted'             => 'The <strong>:attribute</strong> must be accepted.',
    'active_url'           => 'The <strong>:attribute</strong> is not a valid URL.',
    'after'                => 'The <strong>:attribute</strong> must be a date after :date.',
    'after_or_equal'       => 'The <strong>:attribute</strong> must be a date after or equal to :date.',
    'alpha'                => 'The <strong>:attribute</strong> may only contain letters.',
    'alpha_dash'           => 'The <strong>:attribute</strong> may only contain letters (no accents), numbers, and dashes.',
    'alpha_num'            => 'The <strong>:attribute</strong> may only contain letters and numbers.',
    'array'                => 'The <strong>:attribute</strong> must be an array.',
    'before'               => 'The <strong>:attribute</strong> must be a date before :date.',
    'before_or_equal'      => 'The <strong>:attribute</strong> must be a date before or equal to :date.',
    'between'              => [
        'numeric' => 'The <strong>:attribute</strong> must be between :min and :max.',
        'file'    => 'The <strong>:attribute</strong> must be between :min and :max kilobytes.',
        'string'  => 'The <strong>:attribute</strong> must be between :min and :max characters.',
        'array'   => 'The <strong>:attribute</strong> must have between :min and :max items.',
    ],
    'boolean'              => 'The <strong>:attribute</strong> field must be true or false.',
    'confirmed'            => 'The <strong>:attribute</strong> confirmation does not match.',
    'date'                 => 'The <strong>:attribute</strong> is not a valid date.',
    'date_format'          => 'The <strong>:attribute</strong> does not match the format :format.',
    'different'            => 'The <strong>:attribute</strong> and :other must be different.',
    'digits'               => 'The <strong>:attribute</strong> must be :digits digits.',
    'digits_between'       => 'The <strong>:attribute</strong> must be between :min and :max digits.',
    'dimensions'           => 'The <strong>:attribute</strong> has invalid image dimensions.',
    'distinct'             => 'The <strong>:attribute</strong> field has a duplicate value.',
    'email'                => 'The <strong>:attribute</strong> must be a valid email address.',
    'exists'               => 'The selected <strong>:attribute</strong> is invalid.',
    'file'                 => 'The <strong>:attribute</strong> must be a file.',
    'filled'               => 'The <strong>:attribute</strong> field must have a value.',
    'image'                => 'The <strong>:attribute</strong> must be an image.',
    'in'                   => 'The selected <strong>:attribute</strong> is invalid.',
    'in_array'             => 'The <strong>:attribute</strong> field does not exist in :other.',
    'integer'              => 'The <strong>:attribute</strong> must be an integer.',
    'ip'                   => 'The <strong>:attribute</strong> must be a valid IP address.',
    'json'                 => 'The <strong>:attribute</strong> must be a valid JSON string.',
    'max'                  => [
        'numeric' => 'The <strong>:attribute</strong> may not be greater than :max.',
        'file'    => 'The <strong>:attribute</strong> may not be greater than :max kilobytes.',
        'string'  => 'The <strong>:attribute</strong> may not be greater than :max characters.',
        'array'   => 'The <strong>:attribute</strong> may not have more than :max items.',
    ],
    'mimes'                => 'The <strong>:attribute</strong> must be a file of type: :values.',
    'mimetypes'            => 'The <strong>:attribute</strong> must be a file of type: :values.',
    'min'                  => [
        'numeric' => 'The <strong>:attribute</strong> must be at least :min.',
        'file'    => 'The <strong>:attribute</strong> must be at least :min kilobytes.',
        'string'  => 'The <strong>:attribute</strong> must be at least :min characters.',
        'array'   => 'The <strong>:attribute</strong> must have at least :min items.',
    ],
    'not_in'               => 'The selected <strong>:attribute</strong> is invalid.',
    'numeric'              => 'The <strong>:attribute</strong> must be a number.',
    'present'              => 'The <strong>:attribute</strong> field must be present.',
    'regex'                => '',
    'required'             => '<strong>:attribute</strong> required.',
    'required_if'          => 'The <strong>:attribute</strong> field is required when :other is :value.',
    'required_unless'      => 'The <strong>:attribute</strong> field is required unless :other is in :values.',
    'required_with'        => 'The <strong>:attribute</strong> field is required when :values is present.',
    'required_with_all'    => 'The <strong>:attribute</strong> field is required when :values is present.',
    'required_without'     => 'The <strong>:attribute</strong> field is required when :values is not present.',
    'required_without_all' => 'The <strong>:attribute</strong> field is required when none of :values are present.',
    'same'                 => 'The <strong>:attribute</strong> and :other must match.',
    'size'                 => [
        'numeric' => 'The <strong>:attribute</strong> must be :size.',
        'file'    => 'The <strong>:attribute</strong> must be :size kilobytes.',
        'string'  => 'The <strong>:attribute</strong> must be :size characters.',
        'array'   => 'The <strong>:attribute</strong> must contain :size items.',
    ],
    'string'               => 'The <strong>:attribute</strong> must be a string.',
    'timezone'             => 'The <strong>:attribute</strong> must be a valid zone.',
    'unique'               => 'The <strong>:attribute</strong> has already been taken.',
    'uploaded'             => 'The <strong>:attribute</strong> failed to upload.',
    'url'                  => 'The <strong>:attribute</strong> format is invalid.',

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom validation messages for attributes using the
    | convention "attribute.rule" to name the lines. This makes it quick to
    | specify a specific custom language line for a given attribute rule.
    |
    */

    'custom' => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    |
    | The following language lines are used to swap attribute place-holders
    | with something more reader friendly such as E-Mail Address instead
    | of "email". This simply helps us make messages a little cleaner.
    |
    */

    'attributes' => [
        'evento' => 'Result',
        'primeiro' => 'Who started',
        'email' => 'E-mail',
        'password' => 'Password',
        'username' => 'Username'

    ],

];
