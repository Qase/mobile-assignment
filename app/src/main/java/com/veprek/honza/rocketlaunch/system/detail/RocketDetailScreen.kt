package com.veprek.honza.rocketlaunch.system.detail

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.Icon
import androidx.compose.material.IconButton
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Scaffold
import androidx.compose.material.Text
import androidx.compose.material.TopAppBar
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import coil.compose.AsyncImage
import com.veprek.honza.rocketlaunch.R
import com.veprek.honza.rocketlaunch.ui.component.parameter.Parameter
import com.veprek.honza.rocketlaunch.ui.component.stage.Stage
import com.veprek.honza.rocketlaunch.ui.theme.cornerRadius
import com.veprek.honza.rocketlaunch.ui.theme.horizontalPadding
import com.veprek.honza.rocketlaunch.ui.theme.verticalPadding

@Preview(showBackground = true)
@Composable
fun RocketDetailScreen(modifier: Modifier = Modifier, backAction: () -> Unit = {}) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Falcon 9") },
                navigationIcon = {
                    IconButton(onClick = {
                        backAction()
                    }) {
                        Icon(
                            imageVector = Icons.Filled.ArrowBack,
                            contentDescription = stringResource(R.string.arrow_back)
                        )
                    }
                }
            )
        },
        content = {
            Column(
                Modifier.fillMaxSize().padding(horizontal = horizontalPadding)
                    .verticalScroll(rememberScrollState()),
                verticalArrangement = Arrangement.spacedBy(verticalPadding)
            ) {
                Text(
                    "Overview",
                    modifier = Modifier.padding(top = verticalPadding),
                    style = MaterialTheme.typography.h4
                )
                Text(
                    "Falcon 9 is a two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of the satellites and the Dragon spacecraft into orbit.",
                    style = MaterialTheme.typography.body1
                )
                Text(
                    "Parameters",
                    style = MaterialTheme.typography.h4
                )
                Row(
                    Modifier
                        .fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Parameter(title = "90m", subtitle = stringResource(R.string.parameter_height))
                    Parameter(title = "40m", subtitle = stringResource(R.string.parameter_diameter))
                    Parameter(title = "500t", subtitle = stringResource(R.string.parameter_mass))
                }
                Stage(name = "First Stage")
                Stage(name = "Second Stage")
                Text(
                    "Photos",
                    style = MaterialTheme.typography.h4
                )
                AsyncImage(
                    model = "https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg",
                    contentDescription = null,
                    modifier = Modifier.clip(RoundedCornerShape(cornerRadius))
                )
                AsyncImage(
                    model = "https://farm5.staticflickr.com/4645/38583830575_3f0f7215e6_b.jpg",
                    contentDescription = null,
                    modifier = Modifier.clip(RoundedCornerShape(cornerRadius))
                )
            }
        }
    )
}
