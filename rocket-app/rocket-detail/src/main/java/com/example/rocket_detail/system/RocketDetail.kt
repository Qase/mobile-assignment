package com.example.rocket_detail.system

import androidx.compose.foundation.background
import androidx.compose.foundation.gestures.Orientation
import androidx.compose.foundation.gestures.scrollable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.ClickableText
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.State
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.colorResource
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.AnnotatedString
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import com.example.rocket_detail.R
import com.example.rocket_detail.presentation.RocketDetailViewModel
import com.example.rocket_repo.model.Parameter
import com.example.rocket_repo.model.Rocket
import com.example.rocket_repo.model.RocketParameters

@Composable
fun RocketDetailScreen(id: String, onNavigateBack: () -> Unit) {
    val viewModel = viewModel<RocketDetailViewModel>()
    val rocketState: State<Rocket?> = viewModel.rocket.observeAsState()
    viewModel.getRocket(id)
    val rocket: Rocket? = rocketState.value
    rocket?.let { rocket ->
        Scaffold(
            topBar = { TopBar(rocketName = rocket.name, onNavigateBack) }
        ) { innerPadding ->
            RocketDetail(rocket, innerPadding)
        }
    }
}

@Composable
fun TopBar(rocketName: String, onNavigateBack: () -> Unit) {
    TopAppBar(
        elevation = 4.dp,
        backgroundColor = colorResource(id = R.color.lightGray),
    ) {
        Row(
            verticalAlignment = Alignment.Bottom,
            horizontalArrangement = Arrangement.SpaceEvenly
        ) {
            Icon(painter = painterResource(id = R.drawable.back_arrow), contentDescription = null, tint = Color.Blue)
            ClickableText(
                text = AnnotatedString("Rockets"),
                onClick = { onNavigateBack() },
                style = TextStyle(
                    color = Color.Blue,
                    fontStyle = MaterialTheme.typography.h6.fontStyle,
                    fontSize = MaterialTheme.typography.h6.fontSize
                )
            )
            Text(text = rocketName, color = Color.Black, style = MaterialTheme.typography.h6, modifier = Modifier
                .weight(1f)
                .padding(start = 60.dp))
            Text(text = "Launch", color = Color.Blue, style = MaterialTheme.typography.h6)
        }
    }
}

@Composable
fun RocketDetail(rocket: Rocket, paddingValues: PaddingValues) {
    val scrollState = rememberScrollState()

    Column(
        modifier = Modifier
            .background(Color.White)
            .scrollable(scrollState, Orientation.Vertical)
            .padding(paddingValues)
    ) {
        Overview("")
        ParametersRow(rocket.parameters)
    }
}

@Composable
fun Overview(body: String) {
    Text(
        text = stringResource(R.string.overview),
        color = Color.Black,
        style = MaterialTheme.typography.h6
    )

    Text(
        text = body,
        color = Color.Black,
        style = MaterialTheme.typography.subtitle1
    )
}

@Composable
fun ParametersRow(rocketParameters: RocketParameters) {
    Text(
        text = stringResource(R.string.parameters),
        style = MaterialTheme.typography.h6,
        modifier = Modifier.padding(4.dp)
    )

    Row(
        modifier = Modifier.fillMaxSize(),
        horizontalArrangement = Arrangement.SpaceEvenly
    ) {
        ParameterDetail(rocketParameters.height)
        ParameterDetail(rocketParameters.diameter)
        ParameterDetail(rocketParameters.mass)
    }
}

@Composable
fun ParameterDetail(param: Parameter) {
    Column(
       modifier = Modifier
           .width(120.dp)
           .height(120.dp)
           .clip(RoundedCornerShape(20.dp))
           .background(color = colorResource(id = R.color.pink))
           .padding(5.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            text = "${param.value}${param.unit}",
            style = MaterialTheme.typography.h3,
            color = Color.White
        )
        Text(
            text = param.type,
            style = MaterialTheme.typography.subtitle1,
            color = Color.White
        )
    }
}
