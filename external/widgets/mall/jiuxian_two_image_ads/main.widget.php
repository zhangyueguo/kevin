<?php
class Jiuxian_two_image_adsWidget extends BaseWidget
{
    var $_name = 'jiuxian_two_image_ads';

    function _get_data()
    {
        return array(
            'ad1_image_url'  => $this->options['ad1_image_url'],
            'ad1_link_url'   => $this->options['ad1_link_url'],
            'ad2_image_url'  => $this->options['ad2_image_url'],
            'ad2_link_url'   => $this->options['ad2_link_url'],
        );
    }

    function parse_config($input)
    {
        $images = $this->_upload_image();
        if ($images)
        {
            foreach ($images as $key => $image)
            {
                $input['ad' . $key . '_image_url'] = $image;
            }
        }

        return $input;
    }

    function _upload_image()
    {
        import('uploader.lib');
        $images = array();
        for ($i = 1; $i <= 2; $i++)
        {
            $file = $_FILES['ad' . $i . '_image_file'];
            if ($file['error'] == UPLOAD_ERR_OK)
            {
                $uploader = new Uploader();
                $uploader->allowed_type(IMAGE_FILE_TYPE);
                $uploader->addFile($file);
                $uploader->root_dir(ROOT_PATH);
                $images[$i] = $uploader->save('data/files/mall/template', $uploader->random_filename());
            }
        }

        return $images;
    }
}

?>