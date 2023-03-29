package cz.quanti.rocketapp.rocketlist.system

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material.Icon
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import cz.quanti.rocketapp.design.system.RocketAppTheme
import cz.quanti.rocketapp.rocketlist.R
import cz.quanti.rocketapp.rocketlist.presentation.RocketItemState

@Composable
fun RocketCard(rocketItem: RocketItemState, navigateToRocketDetail: (String) -> Unit) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = Modifier
            .background(RocketAppTheme.colorPalette.rocketListItemBackgroundColor)
            .fillMaxSize()
            .padding(8.dp)
/*
            .clickable { navigateToRocketDetail(rocketItem.id) }
*/
    ) {
        Image(
            painter = painterResource(id = R.drawable.rocket),
            contentDescription = "Rocket icon",
            modifier = Modifier.size(30.dp)
        )

        Spacer(modifier = Modifier.width(10.dp))

        RocketOverview(rocketItem)

        Spacer(modifier = Modifier.weight(1f))

        Icon(
            painter = painterResource(id = R.drawable.arrow),
            tint = RocketAppTheme.colorPalette.iconButtonColor,
            contentDescription = null,
        )
    }
}

@Composable
fun RocketOverview(rocketItem: RocketItemState) {
    Column(
        modifier = Modifier.wrapContentWidth()
    ) {
        Text(
            text = rocketItem.name,
            style = RocketAppTheme.typography.cardTitle
        )

        Spacer(modifier = Modifier.height(4.dp))

        Text(
            text = rocketItem.firstFlight,
            style = RocketAppTheme.typography.cardBody
        )
    }
}

@Preview
@Composable
fun RocketCardPreview() {
    RocketCard(rocketItem = RocketItemState(
        id = 1, name = "Falcon 1", firstFlight = "First flight: 14.2.2013"),
        navigateToRocketDetail = {}
    )
}