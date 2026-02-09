// Nigerian states and their major cities
const Map<String, List<String>> nigeriaLocations = {
	'Abuja': ['Gwarinpa', 'Wuse', 'Maitama', 'Asokoro', 'Garki', 'Apo', 'Lugbe', 'Kubwa', 'Nyanya', 'Jabi'],
	'Lagos': ['Ikeja', 'Lekki', 'Victoria Island', 'Surulere', 'Ikorodu', 'Agege', 'Ajah', 'Badagry', 'Epe', 'Ibeju-Lekki', 'Ifako-Ijaiye', 'Kosofe', 'Mushin', 'Ojo', 'Oshodi-Isolo', 'Shomolu'],
	'Kano': ['Kano Municipal', 'Nassarawa', 'Fagge', 'Dala', 'Gwale', 'Tarauni', 'Kumbotso', 'Ungogo', 'Dawakin Kudu', 'Madobi'],
	'Rivers': ['Port Harcourt', 'Obio-Akpor', 'Okrika', 'Oyigbo', 'Eleme', 'Ikwerre', 'Etche', 'Khana', 'Gokana'],
	'Oyo': ['Ibadan', 'Ogbomosho', 'Iseyin', 'Oyo', 'Saki', 'Eruwa', 'Lagelu', 'Ibarapa'],
	'Kaduna': ['Kaduna North', 'Kaduna South', 'Zaria', 'Kafanchan', 'Birnin Gwari', 'Kagarko', 'Kachia', 'Ikara', 'Saminaka'],
	'Delta': ['Warri', 'Asaba', 'Ughelli', 'Sapele', 'Agbor', 'Oghara', 'Effurun', 'Abraka', 'Kwale'],
	'Edo': ['Benin City', 'Auchi', 'Ekpoma', 'Uromi', 'Igarra', 'Ubiaja', 'Fugar', 'Sabongida-Ora'],
	'Ogun': ['Abeokuta', 'Ifo', 'Ijebu Ode', 'Sagamu', 'Ota', 'Ilaro', 'Mowe', 'Ayetoro'],
	'Anambra': ['Awka', 'Onitsha', 'Nnewi', 'Ekwulobia', 'Oba', 'Atani', 'Nnokwa', 'Otuocha'],
	'Imo': ['Owerri', 'Orlu', 'Okigwe', 'Mbaise', 'Ngor-Okpala', 'Aboh Mbaise'],
	'Enugu': ['Enugu', 'Nsukka', 'Awgu', 'Udi', 'Oji River', 'Agbani', '9th Mile'],
	'AkwaIbom': ['Uyo', 'Eket', 'Ikot Ekpene', 'Abak', 'Oron', 'Itu', 'Ikot Abasi', 'Etinan'],
	'CrossRiver': ['Calabar', 'Ikom', 'Ogoja', 'Ugep', 'Obudu', 'Akamkpa', 'Obubra'],
	'Plateau': ['Jos', 'Bukuru', 'Pankshin', 'Shendam', 'Langtang', 'Barkin Ladi', 'Mangu'],
	'Borno': ['Maiduguri', 'Bama', 'Gwoza', 'Dikwa', 'Konduga', 'Kala Balge', 'Monguno'],
	'Bauchi': ['Bauchi', 'Azare', 'Misau', 'Jama\'are', 'Katagum', 'Tafawa Balewa', 'Ganjuwa'],
	'Sokoto': ['Sokoto', 'Wurno', 'Bodinga', 'Shagari', 'Yabo', 'Goronyo', 'Rabah'],
	'Niger': ['Minna', 'Suleja', 'Bida', 'Kontagora', 'Lapai', 'Rijau', 'Agaie'],
	'Kwara': ['Ilorin', 'Offa', 'Omu-Aran', 'Jebba', 'Lafiagi', 'Patigi', 'Share'],
	'Osun': ['Osogbo', 'Ile-Ife', 'Ilesa', 'Ede', 'Ikirun', 'Iwo', 'Ejigbo', 'Ila-Odo'],
	'Ondo': ['Akure', 'Owo', 'Ondo', 'Ikare', 'Okitipupa', 'Idanre'],
	'Ekiti': ['Ado-Ekiti', 'Ikere-Ekiti', 'Ijero-Ekiti', 'Oye-Ekiti', 'Emure-Ekiti'],
	'Kogi': ['Lokoja', 'Okene', 'Kabba', 'Idah', 'Dekina', 'Ajaokuta', 'Ogori-Magongo'],
	'Benue': ['Makurdi', 'Gboko', 'Otukpo', 'Katsina-Ala', 'Vandeikya', 'Zaki-Biam', 'Adikpo'],
	'Taraba': ['Jalingo', 'Wukari', 'Serti', 'Bali', 'Gembu', 'Takum', 'Kurmi'],
	'Adamawa': ['Yola', 'Mubi', 'Jimeta', 'Numan', 'Ganye', 'Michika', 'Madagali'],
	'Gombe': ['Gombe', 'Kaltungo', 'Bajoga', 'Dukku', 'Kumo', 'Billiri', 'Funakaye'],
	'Zamfara': ['Gusau', 'Kaura Namoda', 'Talata Mafara', 'Bakura', 'Anka', 'Bungudu', 'Maru'],
	'Kebbi': ['Birnin Kebbi', 'Argungu', 'Yauri', 'Zuru', 'Jega', 'Gwandu', 'Kalgo'],
	'Jigawa': ['Dutse', 'Hadejia', 'Kazaure', 'Ringim', 'Gumel', 'Birnin Kudu', 'Kiyawa'],
	'Yobe': ['Damaturu', 'Potiskum', 'Gashua', 'Nguru', 'Geidam', 'Buni Yadi', 'Gujba'],
	'Bayelsa': ['Yenagoa', 'Brass', 'Nembe', 'Ogbia', 'Sagbama', 'Kolokuma/Opokuma', 'Southern Ijaw'],
	'Abia': ['Umuahia', 'Aba', 'Ohafia', 'Arochukwu', 'Bende', 'Isuikwuato', 'Ukwa'],
	'Ebonyi': ['Abakaliki', 'Afikpo', 'Onueke', 'Ezzamgbo', 'Ishielu', 'Izzi', 'Ikwo'],
	'Nasarawa': ['Lafia', 'Keffi', 'Akwanga', 'Doma', 'Karu', 'Nassarawa Eggon', 'Wamba'],
	'Katsina': ['Katsina', 'Daura', 'Funtua', 'Malumfashi', 'Dutsin-Ma', 'Mani', 'Jibia'],
};

// Utility: Get all states
List<String> getAllStates() => nigeriaLocations.keys.toList();

// Utility: Get cities for a state
List<String> getCitiesForState(String state) => nigeriaLocations[state] ?? [];
