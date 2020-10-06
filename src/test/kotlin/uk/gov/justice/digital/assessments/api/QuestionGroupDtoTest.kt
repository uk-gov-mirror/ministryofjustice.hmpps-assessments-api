package uk.gov.justice.digital.assessments.api

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.DisplayName
import org.junit.Test
import uk.gov.justice.digital.assessments.jpa.entities.QuestionGroupEntity
import uk.gov.justice.digital.assessments.jpa.entities.QuestionSchemaEntity
import uk.gov.justice.digital.assessments.jpa.entities.GroupEntity
import java.time.LocalDateTime
import java.util.*

@DisplayName("Question Group DTO Tests")
class QuestionGroupDtoTest {
    val question = QuestionSchemaEntity(
            1L,
            UUID.randomUUID(),
            "SupervisionId",
            "RSR_25",
            LocalDateTime.of(2019, 8, 1, 8, 0),
            null,
            "Freetext",
            "Question text",
            "Question help text",
            emptyList()
    )
    val simpleGroup = GroupEntity(
            1L,
            UUID.randomUUID(),
            "simple-group",
            "Simple Group",
            "subheading",
            "help!",
            LocalDateTime.of(2019, 8, 1, 8, 0),
            null
    )

    val simpleGroupQuestion = QuestionGroupEntity(
            1L,
            UUID.randomUUID(),
            question,
            simpleGroup,
            "1",
            "mandatory",
            "none"
    )

    @Test
    fun `build Question Group DTO`() {
        val entities = listOf(
                simpleGroupQuestion
        )

        val dto = QuestionGroupDto.from(entities)

        assertThat(dto.groupId).isEqualTo(simpleGroup.groupUuid)
        assertThat(dto.groupCode).isEqualTo(simpleGroup.groupCode)
        assertThat(dto.title).isEqualTo(simpleGroup.heading)
        assertThat(dto.subheading).isEqualTo(simpleGroup.subheading)
        assertThat(dto.helpText).isEqualTo(simpleGroup.helpText)

        assertThat(dto.contents.size).isEqualTo(1)

        val contentQuestion = dto.contents[0]
        assertThat(contentQuestion.questionId).isEqualTo(question.questionSchemaUuid)
        assertThat(contentQuestion.questionCode).isEqualTo(question.questionCode)
        assertThat(contentQuestion.questionText).isEqualTo(question.questionText)
        assertThat(contentQuestion.helpText).isEqualTo(question.questionHelpText)
        assertThat(contentQuestion.answerType).isEqualTo(question.answerType)

        assertThat(contentQuestion.displayOrder).isEqualTo(simpleGroupQuestion.displayOrder)
        assertThat(contentQuestion.mandatory).isEqualTo(simpleGroupQuestion.mandatory)
        assertThat(contentQuestion.validation).isEqualTo(simpleGroupQuestion.validation)
    }
}