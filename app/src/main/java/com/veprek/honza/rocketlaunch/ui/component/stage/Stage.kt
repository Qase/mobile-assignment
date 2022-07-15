package com.veprek.honza.rocketlaunch.ui.component.stage

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import com.veprek.honza.rocketlaunch.R
import com.veprek.honza.rocketlaunch.ui.component.item.StageItem
import com.veprek.honza.rocketlaunch.ui.theme.LightGray
import com.veprek.honza.rocketlaunch.ui.theme.RocketLaunchTheme
import com.veprek.honza.rocketlaunch.ui.theme.cornerRadius
import com.veprek.honza.rocketlaunch.ui.theme.mediumPadding
import com.veprek.honza.rocketlaunch.ui.theme.smallPadding

@Composable
fun Stage(
    modifier: Modifier = Modifier,
    name: String
) {
    Surface(
        shape = RoundedCornerShape(cornerRadius),
        color = LightGray
    ) {
        Column(modifier = modifier.padding(mediumPadding)) {
            Text(
                text = name,
                modifier = Modifier.padding(smallPadding),
                style = MaterialTheme.typography.h4
            )
            StageItem(icon = painterResource(R.drawable.reusable), name = "reusable")
            StageItem(icon = painterResource(R.drawable.engine), name = "9 engines")
            StageItem(icon = painterResource(R.drawable.fuel), name = "385 tons of fuel")
            StageItem(icon = painterResource(R.drawable.burn), name = "162 seconds burn time")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun StagePreview(
    modifier: Modifier = Modifier,
    name: String = "First Stage"
) {
    RocketLaunchTheme {
        Stage(modifier, name)
    }
}
