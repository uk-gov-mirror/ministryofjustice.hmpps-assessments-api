package uk.gov.justice.digital.assessments.api

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test
import uk.gov.justice.digital.assessments.jpa.entities.GroupEntity
import uk.gov.justice.digital.assessments.jpa.entities.QuestionGroupEntity
import uk.gov.justice.digital.assessments.jpa.entities.QuestionSchemaEntity
import uk.gov.justice.digital.assessments.services.QuestionDependencies
import java.time.LocalDateTime
import java.util.UUID

@DisplayName("Question Group DTO Tests")
class GroupWithContentsDtoTest {
  private val question = QuestionSchemaEntity(
    1L,
    UUID.randomUUID(),
    "SupervisionId",
    "RSR_25",
    null,
    LocalDateTime.of(2019, 8, 1, 8, 0),
    null,
    "Freetext",
    "Question text",
    "Question help text"
  )
  private val additionalQuestion = QuestionSchemaEntity(
    1L,
    UUID.randomUUID(),
    "AssessmentId",
    "RSR_40",
    null,
    LocalDateTime.of(2019, 8, 1, 8, 0),
    null,
    "Freetext",
    "Question text",
    "Question help text"
  )

  private val groupWithOneQuestion = GroupEntity(
    1L,
    UUID.randomUUID(),
    "simple-group",
    "Simple Group",
    "subheading",
    "help!",
    LocalDateTime.of(2019, 8, 1, 8, 0),
    null
  )

  private val groupWithOneQuestionQuestion = QuestionGroupEntity(
    1L,
    UUID.randomUUID(),
    groupWithOneQuestion,
    question.questionSchemaUuid,
    "question",
    1,
    true,
    "none",
    false,
    question,
    null
  )

  private val groupWithTwoQuestions = GroupEntity(
    1L,
    UUID.randomUUID(),
    "two-question-group",
    "Two Question Group",
    "subheading",
    "help!",
    LocalDateTime.of(2019, 8, 1, 8, 0),
    null
  )

  private val groupWithTwoQuestionsFirstQuestion = QuestionGroupEntity(
    1L,
    UUID.randomUUID(),
    groupWithTwoQuestions,
    question.questionSchemaUuid,
    "question",
    1,
    true,
    "none",
    false,
    question,
    null
  )
  private val groupWithTwoQuestionsSecondQuestion = QuestionGroupEntity(
    1L,
    UUID.randomUUID(),
    groupWithTwoQuestions,
    additionalQuestion.questionSchemaUuid,
    "question",
    2,
    false,
    "lots",
    false,
    additionalQuestion,
    null
  )

  private val groupWithNestedGroup = GroupEntity(
    1L,
    UUID.randomUUID(),
    "question-group-question",
    "Complex Group",
    "subheading",
    "help!",
    LocalDateTime.of(2019, 8, 1, 8, 0),
    null
  )

  private val groupWithNestedGroupFirstQuestion = QuestionGroupEntity(
    1L,
    UUID.randomUUID(),
    groupWithNestedGroup,
    question.questionSchemaUuid,
    "question",
    1,
    true,
    "none",
    false,
    question,
    null
  )
  private val groupWithNestedGroupGroup = QuestionGroupEntity(
    2L,
    UUID.randomUUID(),
    groupWithNestedGroup,
    groupWithTwoQuestions.groupUuid,
    "group",
    2,
    false,
    null,
    false,
    null,
    groupWithTwoQuestions
  )
  private val groupWithNestedGroupSecondQuestion = QuestionGroupEntity(
    3L,
    UUID.randomUUID(),
    groupWithNestedGroup,
    additionalQuestion.questionSchemaUuid,
    "question",
    3,
    false,
    "lots",
    false,
    additionalQuestion,
    null
  )

  private fun makeQuestionGroupDto(group: GroupEntity, vararg contents: QuestionGroupEntity): GroupWithContentsDto {
    val contentsDto: List<GroupContentDto> = contents.map {
      when (it.contentType) {
        "question" -> GroupQuestionDto.from(it.question!!, it, QuestionDependencies(emptyList()))
        "group" -> GroupWithContentsDto.from(it.nestedGroup!!, emptyList(), it)
        else -> throw Exception("oh no")
      }
    }

    return GroupWithContentsDto.from(group, contentsDto)
  }

  @Test
  fun `dto for group with one question`() {
    val dto = makeQuestionGroupDto(
      groupWithOneQuestion,
      groupWithOneQuestionQuestion,
    )

    assertGroupDetails(dto, groupWithOneQuestion)

    assertQuestionContentsDetails(dto.contents[0], groupWithOneQuestionQuestion)
  }

  @Test
  fun `dto for two question group`() {
    val dto = makeQuestionGroupDto(
      groupWithTwoQuestions,
      groupWithTwoQuestionsFirstQuestion,
      groupWithTwoQuestionsSecondQuestion
    )

    assertGroupDetails(dto, groupWithTwoQuestions)

    assertThat(dto.contents.size).isEqualTo(2)

    assertQuestionContentsDetails(dto.contents[0], groupWithTwoQuestionsFirstQuestion)
    assertQuestionContentsDetails(dto.contents[1], groupWithTwoQuestionsSecondQuestion)
  }

  @Test
  fun `dto for nested group`() {
    val dto = makeQuestionGroupDto(
      groupWithNestedGroup,
      groupWithNestedGroupFirstQuestion,
      groupWithNestedGroupGroup,
      groupWithNestedGroupSecondQuestion
    )

    assertGroupDetails(dto, groupWithNestedGroup)

    assertThat(dto.contents.size).isEqualTo(3)

    assertQuestionContentsDetails(dto.contents[0], groupWithNestedGroupFirstQuestion)
    assertGroupContentsDetails(dto.contents[1], groupWithNestedGroupGroup)
    assertQuestionContentsDetails(dto.contents[2], groupWithNestedGroupSecondQuestion)
  }

  companion object {
    fun assertGroupDetails(dto: GroupWithContentsDto, group: GroupEntity) {
      assertThat(dto.groupId).isEqualTo(group.groupUuid)
      assertThat(dto.groupCode).isEqualTo(group.groupCode)
      assertThat(dto.title).isEqualTo(group.heading)
      assertThat(dto.subheading).isEqualTo(group.subheading)
      assertThat(dto.helpText).isEqualTo(group.helpText)
    }

    fun assertQuestionContentsDetails(content: GroupContentDto, entity: QuestionGroupEntity) {
      val qc = content as GroupQuestionDto

      assertThat(qc.displayOrder).isEqualTo(entity.displayOrder)
      assertThat(qc.mandatory).isEqualTo(entity.mandatory)
      assertThat(qc.validation).isEqualTo(entity.validation)
      assertThat(qc.readOnly).isEqualTo(entity.readOnly)

      val question = entity.question
      assertThat(question).isNotNull()

      assertThat(qc.questionId).isEqualTo(question?.questionSchemaUuid)
      assertThat(qc.questionCode).isEqualTo(question?.questionCode)
      assertThat(qc.questionText).isEqualTo(question?.questionText)
      assertThat(qc.helpText).isEqualTo(question?.questionHelpText)
      assertThat(qc.answerType).isEqualTo(question?.answerType)
    }

    fun assertGroupContentsDetails(content: GroupContentDto, entity: QuestionGroupEntity) {
      val gc = content as GroupWithContentsDto

      assertThat(gc.displayOrder).isEqualTo(entity.displayOrder)
      assertThat(gc.mandatory).isEqualTo(entity.mandatory)
      assertThat(gc.validation).isEqualTo(entity.validation)

      val group = entity.nestedGroup
      assertThat(group).isNotNull()

      assertThat(gc.groupId).isEqualTo(group?.groupUuid)
      assertThat(gc.groupCode).isEqualTo(group?.groupCode)
      assertThat(gc.title).isEqualTo(group?.heading)
      assertThat(gc.subheading).isEqualTo(group?.subheading)
      assertThat(gc.helpText).isEqualTo(group?.helpText)
    }
  }
}
