// package com.veprek.honza.rocketlaunch.feature.launch.system
//
// import android.content.Context
// import android.hardware.Sensor
// import android.hardware.SensorEvent
// import android.hardware.SensorEventListener
// import android.hardware.SensorManager
// import android.os.Bundle
// import android.view.LayoutInflater
// import android.view.View
// import android.view.ViewGroup
// import androidx.compose.runtime.collectAsState
// import androidx.compose.ui.platform.ComposeView
// import androidx.fragment.app.Fragment
// import androidx.fragment.app.viewModels
// import androidx.navigation.findNavController
// import com.veprek.honza.rocketlaunch.feature.launch.presentation.RocketLaunchViewModel
// import com.veprek.honza.rocketlaunch.ui.theme.RocketLaunchTheme
// import dagger.hilt.android.AndroidEntryPoint
// import quanti.com.kotlinlog.Log
// import kotlin.math.abs
//
// @AndroidEntryPoint
// class RocketLaunchFragment : Fragment(), SensorEventListener {
//    private val viewModel: RocketLaunchViewModel by viewModels()
//
//    var gravity: FloatArray? = null
//    var geomagnetic: FloatArray? = null
//    lateinit var sensorManager: SensorManager
//
//    override fun onCreateView(
//        inflater: LayoutInflater,
//        container: ViewGroup?,
//        savedInstanceState: Bundle?
//    ): View {
//        sensorManager = context?.getSystemService(Context.SENSOR_SERVICE) as SensorManager
//        sensorManager.registerListener(
//            this,
//            sensorManager.getDefaultSensor(Sensor.TYPE_GRAVITY),
//            SensorManager.SENSOR_DELAY_NORMAL
//        )
//        sensorManager.registerListener(
//            this,
//            sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD),
//            SensorManager.SENSOR_DELAY_NORMAL
//        )
//
//        return ComposeView(requireContext()).apply {
//            setContent {
//                val isLaunched = viewModel.isLaunched.collectAsState()
//                val state = viewModel.rocketState.collectAsState()
//                RocketLaunchTheme {
//                    RocketLaunchScreen(
//                        state = state.value,
//                        launched = isLaunched.value
//                    ) {
//                        findNavController().popBackStack()
//                    }
//                }
//            }
//        }
//    }
//
//    override fun onSensorChanged(event: SensorEvent?) {
//        if (event?.sensor?.type == Sensor.TYPE_GRAVITY) {
//            gravity = event.values
//        }
//
//        if (event?.sensor?.type == Sensor.TYPE_MAGNETIC_FIELD) {
//            geomagnetic = event.values
//        }
//
//        if (gravity != null && geomagnetic != null) {
//            val rotationMatrix = FloatArray(9)
//            val inclinationMatrix = FloatArray(9)
//
//            if (SensorManager.getRotationMatrix(
//                    rotationMatrix,
//                    inclinationMatrix,
//                    gravity,
//                    geomagnetic
//                )
//            ) {
//                val orientation = FloatArray(3)
//                SensorManager.getOrientation(rotationMatrix, orientation)
//                val azimuth = Math.toDegrees(orientation[0].toDouble())
//                val pitch = Math.toDegrees(orientation[1].toDouble())
//                val roll = Math.toDegrees(orientation[2].toDouble())
//                Log.d("Orientation: $azimuth, $pitch, $roll")
//
//                if (abs(pitch + 10) >= 20) {
//                    if (pitch < 0) viewModel.launch() else viewModel.fail()
//                    sensorManager.unregisterListener(this)
//                }
//            }
//        }
//    }
//
//    override fun onPause() {
//        super.onPause()
//        sensorManager.unregisterListener(this)
//    }
//
//    override fun onResume() {
//        super.onResume()
//        if (!viewModel.rocketLaunched()) {
//            sensorManager.registerListener(
//                this,
//                sensorManager.getDefaultSensor(Sensor.TYPE_GRAVITY),
//                SensorManager.SENSOR_DELAY_NORMAL
//            )
//            sensorManager.registerListener(
//                this,
//                sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD),
//                SensorManager.SENSOR_DELAY_NORMAL
//            )
//        }
//    }
//
//    override fun onAccuracyChanged(p0: Sensor?, p1: Int) {
//    }
// }
