<?php
class BreadCrumbs
{
    private $d;
    private $data = array();

    function __construct($d)
    {
        $this->d = $d;
    }

    public function set($slug = '', $name = '')
    {
        if ($name != '') {
            $this->data[] = array('slug' => $slug, 'name' => $name);
        }
    }

    public function get()
    {
        global $configBase;

        $json = array();
        $breadcumb = '';

        if ($this->data) {
            $breadcumb .= '<ol class="breadcrumb">';
            $breadcumb .= '<li class="breadcrumb-item"><a class="d-flex align-items-center" href="' . $configBase . '">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill me-2" viewBox="0 0 16 16">
                    <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5"/>
                </svg>
                <span>' . trangchu . '</span></a></li>';
            $k = 1;
            foreach ($this->data as $key => $value) {
                if ($value['name'] != '') {
                    $slug = ($value['slug']) ? $configBase . $value['slug'] : '';
                    $name = $value['name'];
                    $active = ($key == count($this->data) - 1) ? "active" : "";
                    $breadcumb .= '<li class="breadcrumb-item ' . $active . '"><a class="text-decoration-none" href="' . $slug . '"><span>' . $name . '</span></a></li>';
                    $json[] = array("@type" => "ListItem", "position" => $k, "name" => $name, "item" => $slug);
                    $k++;
                }
            }
            $breadcumb .= '</ol>';
            $breadcumb .= '<script type="application/ld+json">{"@context": "https://schema.org","@type": "BreadcrumbList","itemListElement": ' . ((json_encode($json))) . '}</script>';
        }

        return $breadcumb;
    }
}
