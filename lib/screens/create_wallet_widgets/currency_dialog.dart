import 'package:flutter/material.dart';

import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_image.dart';
import '../../model/currency.dart';
import './currency_header.dart';
import '../../styles/common_colors.dart';
import '../../styles/common_styles.dart';
import '../../styles/common_variables.dart';

class CurrencyDialog extends StatefulWidget {
  @override
  _CurrencyDialogState createState() => new _CurrencyDialogState();
}

class _CurrencyDialogState extends State<CurrencyDialog> {

  final List<Currency> currencyItems = [
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/abkhazia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/afghanistan.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/aland-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/albania.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/algeria.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/american-samoa.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/andorra.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/angola.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/anguilla.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/antigua-and-barbuda.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/argentina.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/armenia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/aruba.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/australia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/austria.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/azerbaijan.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/azores-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/bahamas.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/bahrain.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/balearic-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/bangladesh.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/barbados.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/basque-country.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/belarus.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/belgium.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/belize.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/benin.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/bermuda.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/bhutan-1.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/bhutan.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/bolivia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/bonaire.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/bosnia-and-herzegovina.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/botswana.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/brazil.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/british-columbia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/british-indian-ocean-territory.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/british-virgin-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/brunei.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/bulgaria.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/burkina-faso.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/burundi.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/cambodia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/cameroon.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/canada.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/canary-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/cape-verde.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/cayman-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/central-african-republic.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/ceuta.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/chad.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/chile.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/china.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/christmas-island.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/cocos-island.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/colombia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/comoros.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/cook-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/corsica.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/costa-rica.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/croatia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/cuba.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/curacao.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/cyprus.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/czech-republic.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/democratic-republic-of-congo.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/denmark.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/djibouti.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/dominica.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/dominican-republic.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/east-timor.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/ecuador.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/egypt.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/england.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/equatorial-guinea.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/eritrea.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/estonia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/ethiopia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/european-union.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/falkland-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/faroe-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/fiji.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/finland.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/france.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/french-polynesia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/gabon.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/galapagos-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/gambia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/georgia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/germany.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/ghana.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/gibraltar.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/greece.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/greenland.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/grenada.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/guam.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/guatemala.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/guernsey.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/guinea-bissau.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/guinea.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/guyana.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/haiti.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/hawaii.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/honduras.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/hong-kong.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/hungary.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/iceland.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/india.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/indonesia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/iran.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/iraq.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/ireland.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/isle-of-man.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/israel.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/italy.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/ivory-coast.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/jamaica.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/japan.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/jersey.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/jordan.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/kazakhstan.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/kenya.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/kiribati.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/kosovo.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/kuwait.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/kyrgyzstan.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/laos.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/latvia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/lebanon.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/lesotho.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/liberia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/libya.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/liechtenstein.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/lithuania.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/luxembourg.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/macao.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/madagascar.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/madeira.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/malawi.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/malaysia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/maldives.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/mali.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/malta.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/marshall-island.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/martinique.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/mauritania.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/mauritius.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/melilla.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/mexico.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/micronesia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/moldova.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/monaco.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/mongolia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/montenegro.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/montserrat.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/morocco.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/mozambique.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/myanmar.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/namibia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/nato.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/nauru.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/nepal.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/netherlands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/new-zealand.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/nicaragua.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/niger.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/nigeria.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/niue.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/norfolk-island.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/north-korea.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/northen-cyprus.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/northern-marianas-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/norway.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/oman.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/orkney-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/ossetia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/pakistan.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/palau.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/palestine.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/panama.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/papua-new-guinea.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/paraguay.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/peru.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/philippines.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/pitcairn-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/portugal.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/puerto-rico.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/qatar.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/rapa-nui.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/republic-of-macedonia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/republic-of-poland.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/republic-of-the-congo.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/romania.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/russia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/rwanda.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/saba-island.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/saint-kitts-and-nevis.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/salvador.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/samoa.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/san-marino.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/sao-tome-and-principe.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/sardinia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/saudi-arabia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/scotland.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/senegal.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/serbia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/seychelles.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/sierra-leone.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/singapore.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/sint-eustatius.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/sint-maarten.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/slovakia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/slovenia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/solomon-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/somalia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/somaliland.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/south-africa.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/south-korea.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/south-sudan.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/spain.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/sri-lanka.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/st-barts.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/st-lucia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/st-vincent-and-the-grenadines.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/sudan.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/suriname.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/swaziland.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/sweden.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/switzerland.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/syria.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/taiwan.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/tajikistan.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/tanzania.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/thailand.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/tibet.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/togo.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/tokelau.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/tonga.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/transnistria.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/trinidad-and-tobago.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/tunisia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/turkey.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/turkmenistan.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/turks-and-caicos.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/tuvalu.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/uganda.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/ukraine.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/united-arab-emirates.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/united-kingdom.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/united-nations.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/united-states-of-america.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/uruguay.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/uzbekistn.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/vanuatu.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/vatican-city.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/venezuela.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/vietnam.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/virgin-islands.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/wales.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/western-sahara.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/yemen.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/zambia.png"),
    Currency(country: "Unknown", currencyName: "Unknown", flag: "images/flags/zimbabwe.png ")
  ];

  Widget _listCurrency() {
    return ListView.builder(
      padding: const EdgeInsets.all(0.0),
      itemCount: currencyItems.length,
      itemBuilder: (context, index) {
        return FlatButton(
          padding: const EdgeInsets.all(0.0),
          onPressed: (){},
          child: ResponsivePadding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              decoration: new BoxDecoration(
                border: new Border(
                  bottom: new BorderSide(
                    width: 1.0,
                    color: CommonColors.lightGray
                  )
                )
              ), 
              child: ResponsivePadding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  children: <Widget>[
                    ResponsiveImage(
                      image: new ExactAssetImage(currencyItems[index].flag),
                      width: 64.0,
                      height: 64.0,
                    ),
                    ResponsivePadding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            currencyItems[index].country,
                            style: TextStyle(
                              color: CommonColors.black,
                              fontSize: CommonVariables(context: context).getMediumFontSize(),
                              fontFamily: CommonVariables.defaultFont,
                              fontWeight: FontWeight.normal
                            ),
                          ),
                          Text(
                            currencyItems[index].currencyName,
                            style: CommonStyles(context: context).getGrayNormalText()
                          )
                        ]
                      )
                    )
                  ]
                )
              )
            )
          )
        );
      }
    );
  }

  Widget _dialogHeader() {
    return Column(
      children: <Widget>[
        CurrencyHeader()
      ]
    );
  }

  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    var column = new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _dialogHeader(),
        Expanded(
          child: _listCurrency()
        )
      ]
    );

    var constrainedBox = new ConstrainedBox(
      constraints: constraints.copyWith(
        maxHeight: MediaQuery.of(context).size.height
      ),
      child: new Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: CommonVariables(context: context).getScreenPaddingBottom()),
        child: column
      )
    );

    var scrollView = new SingleChildScrollView(
      child: constrainedBox
    );

    return scrollView;
  }

  @override
  Widget build(BuildContext context) {
    var layoutBuilder = new LayoutBuilder(
      builder: _buildWithConstraints
    );

    var scaffold = new Scaffold(
      body: layoutBuilder
    );

    return scaffold;
  }
}