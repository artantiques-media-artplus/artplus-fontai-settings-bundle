<?php
namespace Fontai\Bundle\SettingsBundle\Twig;

use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;
use Fontai\Bundle\SettingsBundle\Service\Settings;

class SettingsExtension extends AbstractExtension
{
  protected $settings;

  public function __construct(Settings $settings)
  {
    $this->settings = $settings;
  }

  public function getFunctions()
  {
    return [
      new TwigFunction(
        'settings',
        [$this, 'getSettings']
      )
    ];
  }

  public function getSettings($property)
  {
    return $this->settings->get($property);
  }

  public function getName()
  {
    return 'app_extension';
  }
}
