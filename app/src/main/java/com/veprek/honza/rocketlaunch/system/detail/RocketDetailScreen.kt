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
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.res.painterResource
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
fun RocketDetailScreen(modifier: Modifier = Modifier, backAction: () -> Unit = {}, launchAction: () -> Unit = {}) {
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
                            contentDescription = stringResource(R.string.icon_back)
                        )
                    }
                },
                actions = {
                    IconButton(onClick = {
                        launchAction()
                    }) {
                        Icon(
                            painter = painterResource(id = R.drawable.ic_rocket),
                            contentDescription = stringResource(R.string.icon_launch)
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
                    stringResource(R.string.overview),
                    modifier = Modifier.padding(top = verticalPadding),
                    style = MaterialTheme.typography.h4
                )
                Text(
                    stringResource(R.string.dummy_description),
                    style = MaterialTheme.typography.body1
                )
                Text(
                    stringResource(R.string.parameters),
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
                Stage(name = stringResource(R.string.dummy_first_stage))
                Stage(name = stringResource(R.string.dummy_second_stage))
                Text(
                    stringResource(R.string.photos),
                    style = MaterialTheme.typography.h4
                )
                AsyncImage(
                    model = "https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg",
                    contentDescription = null,
                    modifier = Modifier.clip(RoundedCornerShape(cornerRadius)).align(Alignment.CenterHorizontally)
                )
                AsyncImage(
                    model = "https://farm5.staticflickr.com/4645/38583830575_3f0f7215e6_b.jpg",
                    contentDescription = null,
                    modifier = Modifier.clip(RoundedCornerShape(cornerRadius)).align(Alignment.CenterHorizontally)
                )
            }
        }
    )
}
