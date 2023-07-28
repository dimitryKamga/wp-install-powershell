# Set the WordPress folder path
$wpPath = "E:\xampp\htdocs\Afroticket"

# Set the plugins folder path within WordPress
$pluginsPath = "$wpPath\wp-content\plugins" 

# List of ZIP file paths of the plugins 
$zipFiles = @(
#   "E:\xampp\htdocs\Plugins\wp-force-ssl.zip",
#   "E:\xampp\htdocs\Plugins\disable-dashboard-for-woocommerce-pro.zip",
#   "E:\xampp\htdocs\Plugins\wp-redis.zip",
#   "E:\xampp\htdocs\Plugins\eventin-pro_v3.3.27_package\eventin-pro.zip",
#   "E:\xampp\htdocs\Plugins\eventin-pro_v3.3.27_package\eventin-oxygen-addon.zip",
  "E:\xampp\htdocs\Plugins\litespeed-cache.zip",
  "E:\xampp\htdocs\Plugins\translatepress-business.zip",
  "E:\xampp\htdocs\Plugins\translatepress-multilingual.zip"
)

# Loop through each ZIP file  
Foreach ($zipFile in $zipFiles) {

  # Unzip the plugin ZIP file into the plugins folder
  Expand-Archive -Path $zipFile -DestinationPath $pluginsPath

  # Split the path and grab the last part (the plugin folder name)
  $pluginFolder = ($zipFile -split '\\')[-1] -replace '\.zip$',''

  # Change directory into the new plugin folder  
  Push-Location "$pluginsPath\$pluginFolder"
  
  # Activate the plugin 
  & $wpPath\wp-activate.php $pluginFolder

  # If needed, install the plugin's database tables 
  & $wpPath\wp-admin\includes\upgrade.php

  # Change directory back to WordPress root 
  Pop-Location

}