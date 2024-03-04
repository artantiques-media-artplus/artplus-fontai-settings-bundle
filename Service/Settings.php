<?php
namespace Fontai\Bundle\SettingsBundle\Service;

use App\Model\SettingsQuery;
use Propel\Runtime\ActiveQuery\ModelCriteria;


class Settings
{
  protected $cache;

  public function get(string $property)
  {
    if ($this->cache === NULL)
    {
      $this->initCache();
    }
    
    return $this->cache[$property] ?? NULL;
  }

  public function set(string $property, $value)
  {
    return SettingsQuery::create()
    ->filterByProperty($property)
    ->update(['Value' => $value]);
  }

  protected function initCache()
  {
    $this->cache = [];
      
    foreach (SettingsQuery::create()->find() as $settings)
    {
      $this->cache[$settings->getProperty()] = (
        $settings->getType() == 'boolean'
        ? intval($settings->getValue())
        : $settings->getValue()
      );
    }
  }
}