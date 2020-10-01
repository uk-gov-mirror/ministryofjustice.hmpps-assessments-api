package uk.gov.justice.digital.assessments.api

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test
import uk.gov.justice.digital.assessments.jpa.entities.AssessmentEntity
import uk.gov.justice.digital.assessments.jpa.entities.AssessmentEpisodeEntity
import java.time.LocalDateTime
import java.util.*

@DisplayName("Assessment DTO Tests")
class AssessmentEpisodeDtoTest {

    @Test
    fun `Builds valid Assessment Episode DTO`() {

        val assessmentId = 1L
        val assessmentEntity = AssessmentEntity(assessmentId,
                UUID.randomUUID(),
                "SupervisionId",
                LocalDateTime.of(2019,8,1, 8,0),
                LocalDateTime.of(2020,8,1, 8,0))

        val episodeEntity = AssessmentEpisodeEntity(assessmentId, UUID.randomUUID(), assessmentEntity, "USER",
                LocalDateTime.of(2019,8,1, 8,0), null,
                "Change of Circs")

        val episodeDto = AssessmentEpisodeDto.from(episodeEntity)

        assertThat(episodeDto?.assessmentUuid).isEqualTo(assessmentEntity.assessmentUuid)
        assertThat(episodeDto?.answers).isEmpty()
        assertThat(episodeDto?.created).isEqualTo(episodeEntity.createdDate)
        assertThat(episodeDto?.ended).isEqualTo(episodeEntity.endDate)
        assertThat(episodeDto?.reasonForChange).isEqualTo(episodeEntity.changeReason)
        assertThat(episodeDto?.episodeUuid).isEqualTo(episodeEntity.episodeUuid)

    }

}