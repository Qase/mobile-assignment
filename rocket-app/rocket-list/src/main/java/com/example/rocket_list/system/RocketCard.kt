package com.example.rocket_list.system

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.rocket_list.R
import com.example.rocket_repo.data.rockets
import com.example.rocket_repo.model.Rocket

@Composable
fun RocketCard(rocket: Rocket) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = Modifier
            .background(Color.White)
            .padding(8.dp)
    ) {
        Image(
            painter = painterResource(id = R.drawable.rocket),
            contentDescription = "Rocket icon",
            modifier = Modifier
                .size(30.dp)
                .clip(CircleShape)
        )

        Spacer(modifier = Modifier.width(10.dp))

        Column() {
            Text(
                text = rocket.name,
                style = MaterialTheme.typography.subtitle1
            )

            Spacer(modifier = Modifier.height(4.dp))

            Text(
                text = "First flight: ${rocket.firstFlight}",
                style = MaterialTheme.typography.subtitle2
            )
        }
    }
}

@Preview
@Composable
fun RocketCardPreview() {
    RocketCard(rockets[0])
}