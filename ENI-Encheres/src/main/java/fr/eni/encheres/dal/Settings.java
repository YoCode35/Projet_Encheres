
package fr.eni.encheres.dal;

import java.io.IOException;
import java.util.Properties;

public class Settings {
	// permet d'externaliser les informations
	private static Properties properties;

	static {
		properties = new Properties();
		try {
			properties.load(Settings.class.getResourceAsStream("settings.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Permet la sélection des informations dans le fichier settings.properties
	 * 
	 * @param Key
	 * @return
	 */
	public static String getProperties(String Key) {
		return properties.getProperty(Key);
	}
}
