local prompts = {
	Explain = "Please explain how the following code works.", -- Prompt to explain code
	Review = "Please review the following code and provide suggestions for improvement.", -- Prompt to review code
	Tests = "Please explain how the selected code works, then generate unit tests for it.", -- Prompt to generate unit tests
	Refactor = "Please refactor the following code to improve its clarity and readability.", -- Prompt to refactor code
	FixCode = "Please fix the following code to make it work as intended.", -- Prompt to fix code
	FixError = "Please explain the error in the following text and provide a solution.", -- Prompt to fix errors
	BetterNamings = "Please provide better names for the following variables and functions.", -- Prompt to suggest better names
	Documentation = "Please provide documentation for the following code.", -- Prompt to generate documentation
	JsDocs = "Please provide JsDocs for the following code.", -- Prompt to generate JsDocs
	DocumentationForGithub = "Please provide documentation for the following code ready for GitHub using markdown.", -- Prompt to generate GitHub documentation
	CreateAPost = "Please provide documentation for the following code to post it in social media, like Linkedin, it has be deep, well explained and easy to understand. Also do it in a fun and engaging way.", -- Prompt to create a social media post
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.", -- Prompt to generate Swagger API docs
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.", -- Prompt to generate Swagger JsDocs
	Summarize = "Please summarize the following text.", -- Prompt to summarize text
	Spelling = "Please correct any grammar and spelling errors in the following text.", -- Prompt to correct spelling and grammar
	Wording = "Please improve the grammar and wording of the following text.", -- Prompt to improve wording
	Concise = "Please rewrite the following text to make it more concise.", -- Prompt to make text concise
	SeniorExplain = {
		prompt = "Please provide a detailed explanation of the following code.",
		system_prompt = "You are a senior developer and you are very experienced in this field. Please provide a detailed explanation of the following code, taking into account all the details and nuances that a junior developer might not know.",
		description = "Get a detailed explanation of the code from a senior developer.",
	},
}

local keys = {
	{ "<leader>aie", ":CopilotChatExplain<CR>", desc = "Explain code" },
	{ "<leader>air", ":CopilotChatReview<CR>", desc = "Review code" },
	{ "<leader>ait", ":CopilotChatTests<CR>", desc = "Generate tests" },
	{ "<leader>airf", ":CopilotChatRefactor<CR>", desc = "Refactor code" },
	{ "<leader>aif", ":CopilotChatFixCode<CR>", desc = "Fix code" },
	{ "<leader>aie", ":CopilotChatFixError<CR>", desc = "Fix error" },
	{ "<leader>ain", ":CopilotChatBetterNamings<CR>", desc = "Better namings" },
	{ "<leader>aid", ":CopilotChatDocumentation<CR>", desc = "Documentation" },
	{ "<leader>aij", ":CopilotChatJsDocs<CR>", desc = "JsDocs" },
	{ "<leader>aig", ":CopilotChatDocumentationForGithub<CR>", desc = "GitHub documentation" },
	{ "<leader>aip", ":CopilotChatCreateAPost<CR>", desc = "Social media post" },
	{ "<leader>ais", ":CopilotChatSwaggerApiDocs<CR>", desc = "Swagger API docs" },
	{ "<leader>aij", ":CopilotChatSwaggerJsDocs<CR>", desc = "Swagger JsDocs" },
	{ "<leader>ais", ":CopilotChatSummarize<CR>", desc = "Summarize text" },
	{ "<leader>ais", ":CopilotChatSpelling<CR>", desc = "Spelling" },
	{ "<leader>ais", ":CopilotChatWording<CR>", desc = "Wording" },
	{ "<leader>ais", ":CopilotChatConcise<CR>", desc = "Concise" },
	{ "<leader>aiS", ":CopilotChatSeniorExplain<CR>", desc = "Senior explain" },
}

return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
		{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
	},
	build = "make tiktoken",
	opts = {
		window = {
			layout = "float",
			width = 0.7,
		},
		prompts = prompts,
		question_header = "Tao",
		auto_insert_mode = true,
		show_help = "yes",
	},
	keys = keys,
}
