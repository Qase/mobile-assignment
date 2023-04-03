package cz.quanti.rocketapp.rocketdetail.system

import androidx.compose.foundation.background
import androidx.compose.foundation.gestures.Orientation
import androidx.compose.foundation.gestures.scrollable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.ClickableText
import androidx.compose.material.Icon
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Scaffold
import androidx.compose.material.Text
import androidx.compose.material.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
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
import cz.quanti.rocketapp.rocketdetail.R
import cz.quanti.rocketapp.rocketdetail.presentation.ParameterState
import cz.quanti.rocketapp.rocketdetail.presentation.RocketDetailState
import cz.quanti.rocketapp.rocketdetail.presentation.RocketDetailViewModel

@Composable
fun RocketDetailScreen(id: String, onNavigateBack: () -> Unit) {
    val viewModel = viewModel<RocketDetailViewModel>()
    val rocketState: RocketDetailState by viewModel.rocket.collectAsState()
    viewModel.getRocket(id)
    Scaffold(
        topBar = { TopBar(rocketState.name, onNavigateBack) }
    ) { innerPadding ->
        RocketDetail(rocketState, innerPadding)
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
            BackToRocketsButton(onNavigateBack)
            Text(
                text = rocketName,
                color = Color.Black,
                style = MaterialTheme.typography.h6,
                modifier = Modifier
                    .weight(1f)
                    .padding(start = 60.dp)
            )
            Text(text = "Launch", color = Color.Blue, style = MaterialTheme.typography.h6)
        }
    }
}

@Composable
fun BackToRocketsButton(onNavigateBack: () -> Unit) {
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
}

@Composable
fun RocketDetail(rocketState: RocketDetailState, paddingValues: PaddingValues) {
    val scrollState = rememberScrollState()

    Column(
        modifier = Modifier
            .background(Color.White)
            .scrollable(scrollState, Orientation.Vertical)
            .padding(paddingValues)
    ) {
        Overview(rocketState.overview)
        ParametersRow(rocketState.height, rocketState.diameter, rocketState.mass)
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
fun ParametersRow(
    height: ParameterState,
    diameter: ParameterState,
    mass: ParameterState,
) {
    Text(
        text = stringResource(R.string.parameters),
        style = MaterialTheme.typography.h6,
    )

    Row(
        modifier = Modifier.fillMaxSize(),
        horizontalArrangement = Arrangement.SpaceEvenly
    ) {
        ParameterDetail(height)
        ParameterDetail(diameter)
        ParameterDetail(mass)
    }
}

@Composable
fun ParameterDetail(param: ParameterState) {
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
            text = param.value,
            style = MaterialTheme.typography.h3,
            color = Color.White
        )
        Text(
            text = param.type.paramName,
            style = MaterialTheme.typography.subtitle1,
            color = Color.White
        )
    }
}
