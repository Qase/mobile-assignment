package cz.quanti.rocketapp.rocketdata.data

import cz.quanti.rocketapp.rocketdata.model.Rocket
import io.kotest.matchers.shouldBe
import org.junit.Test
import java.time.LocalDate

class RocketResponseExtensionTest {

    @Test
    fun `should provide rocket from rocket response`() {
        val rocketResponse = RocketResponse(1, "Falcon 1", "2006-03-24")

        val rocket = rocketResponse.toRocket()
        rocket shouldBe Rocket(1, "Falcon 1", LocalDate.parse(rocketResponse.firstFlight), "", rocketParameters)
    }
}