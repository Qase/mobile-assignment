package cz.quanti.rocketapp.rocketlist.system

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.wrapContentWidth
import androidx.compose.material.Icon
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import cz.quanti.rocketapp.design.system.RocketAppTheme
import cz.quanti.rocketapp.rocketlist.R
import cz.quanti.rocketapp.rocketlist.presentation.RocketItemState

@Composable
fun RocketCard(rocketItem: RocketItemState, navigateToRocketDetail: (String) -> Unit) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = Modifier
            .background(RocketAppTheme.colors.componentBackground)
            .fillMaxSize()
            .padding(RocketAppTheme.dimensions.sidePadding)
/*
            .clickable { navigateToRocketDetail(rocketItem.id) }
*/
    ) {
        Image(
            painter = painterResource(id = R.drawable.rocket),
            contentDescription = "Rocket icon",
            modifier = Modifier.size(RocketAppTheme.dimensions.iconSize)
        )

        Spacer(modifier = Modifier.width(RocketAppTheme.dimensions.mediumSpacer))

        RocketOverview(rocketItem)

        Spacer(modifier = Modifier.weight(1f))

        Icon(
            painter = painterResource(id = R.drawable.arrow),
            tint = RocketAppTheme.colors.secondary,
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
            style = RocketAppTheme.typography.cardTitle,
            color = RocketAppTheme.colors.textPrimary
        )

        Spacer(modifier = Modifier.height(RocketAppTheme.dimensions.smallSpacer))

        Text(
            text = rocketItem.firstFlight,
            style = RocketAppTheme.typography.cardBody,
            color = RocketAppTheme.colors.textSecondary
        )
    }
}

@Preview
@Composable
fun RocketCardPreview() {
    RocketCard(
        rocketItem = RocketItemState(
            id = 1,
            name = "Falcon 1",
            firstFlight = "First flight: 14.2.2013"
        ),
        navigateToRocketDetail = {}
    )
}
