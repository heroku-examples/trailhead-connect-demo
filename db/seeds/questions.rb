# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unit1 = Unit.create(title: 'Introduction to Heroku',
                    description: 'Learn what Heroku is and how to try it out.',
                    time_estimate: 1,
                    content: ''
                  )
unit1.create_badge({name: 'Heroku Beginner', image_url: 'badge_heroku_intro.png'})

unit2 = Unit.create(title: 'Heroku Fundamentals',
                    description: 'Expand your knowledge of Heroku, and learn why so many developers love it.',
                    time_estimate: 1,
                    content: ''
                  )
unit2.create_badge({name: 'Heroku Intermediate', image_url: 'badge_heroku_fundamentals.png'})

unit3 = Unit.create(title: 'Heroku Power Features',
                    description: 'Solidify your advanced knowledge of Heroku features.',
                    time_estimate: 1,
                    content: ''
                  )
unit3.create_badge({name: 'Heroku Advanced', image_url: 'badge_power_features.png'})

unit4 = Unit.create(title: 'Salesforce Trivia',
                    description: 'General trivia about the history of Salesforce.',
                    time_estimate: 1,
                    content: ''
                  )
unit4.create_badge({name: 'Salesforce Trivia', image_url: 'badge_salesforce_trivia.png'})

questions_for_unit1 = Question.create([
  {
    question_text: 'Heroku is...',
    unit: unit1,
    answers: [
      { text: 'an Infrastructure as a Service (IaaS) provider', is_correct: false },
      { text: 'a fully-managed, cloud-based Platform as a Service (PaaS)', is_correct: true },
      { text: 'a bird native to Japan', is_correct: false },
      { text: 'a media streaming device', is_correct: false }
    ],
  },
  {
    question_text: 'Heroku\'s goal is to...',
    unit: unit1,
    answers: [
      { text: 'increase developer and team productivity', is_correct: false },
      { text: 'improve a developer\'s experience creating and deploying software', is_correct: false },
      { text: 'reduce the time to go from idea to live URL', is_correct: false },
      { text: 'all of the above', is_correct: true }
    ],
  },
  {
    question_text: 'To make Heroku easy to try, there is a free plan for...',
    unit: unit1,
    answers: [
      { text: 'running applications', is_correct: false },
      { text: 'running applications and Heroku PostgreSQL', is_correct: false },
      { text: 'running applications, Heroku PostgreSQL, and Heroku Redis', is_correct: false },
      { text: 'running applications, Heroku PostgreSQL, Heroku Redis, and many other add-on services', is_correct: true }
    ],
  },
  {
    question_text: 'To get started with Heroku, you need...',
    unit: unit1,
    answers: [
      { text: 'to be a DevOps Engineer', is_correct: false },
      { text: 'an infrastructure team to manage server hardware', is_correct: false },
      { text: 'a degree in Computer Science', is_correct: false },
      { text: 'none of the above', is_correct: true }
    ]
  }
])

questions_for_unit2 = Question.create([
  {
    question_text: 'What programming languages can you use on Heroku?',
    unit: unit2,
    answers: [
      { text: 'Only Ruby', is_correct: false },
      { text: 'Ruby, Node, and Java', is_correct: false },
      { text: 'Node, Ruby, Java, Python, PHP, Go, Scala, and Clojure, officially -- plus many community supported languages', is_correct: true },
      { text: 'Ruby and Rails', is_correct: false }
    ],
  },
  {
    question_text: 'Heroku Teams makes which of the following easier?',
    unit: unit2,
    answers: [
      { text: 'Collaboration with other developers', is_correct: false },
      { text: 'Permissions management for multiple users', is_correct: false },
      { text: 'Billing for multiple apps within a company', is_correct: false },
      { text: 'All of the above', is_correct: true }
    ],
  },
  {
    question_text: 'What is Heroku Flow?',
    unit: unit2,
    answers: [
      { text: 'A static type checker for JavaScript.', is_correct: false },
      { text: 'Pipelines, Review Apps, CI and GitHub integrations combined into an easy-to-use structured workflow for continuous delivery.', is_correct: true },
      { text: 'A web-based data processing configuration tool.', is_correct: false },
      { text: 'A streaming music service designed to help developers get into a flow state.', is_correct: false }
    ]
  }
])

questions_for_unit3 = Question.create([
  {
    question_text: 'One of the benefits of Heroku Connect is...',
    unit: unit3,
    answers: [
      { text: 'free VoIP phone calls', is_correct: false },
      { text: 'cupcake delivery once per month', is_correct: false },
      { text: 'unicorns and rainbows', is_correct: false },
      { text: 'API calls to Salesforce Bulk, REST, and Streaming APIs made by Heroku Connect don\'t count against my org limits', is_correct: true }
    ],
  },
  {
    question_text: 'In which locations can you deploy your apps using Heroku Private Spaces?',
    unit: unit3,
    answers: [
      { text: 'Virginia, USA and Oregon, USA', is_correct: false },
      { text: 'Germany and Ireland', is_correct: false },
      { text: 'Japan and Australia', is_correct: false },
      { text: 'All of the above', is_correct: true }
    ],
  },
  {
    question_text: 'Which of the following provide a HIPAA and PCI Level 1 compliant platform on which to deploy apps?',
    unit: unit3,
    answers: [
      { text: 'Heroku Private Spaces', is_correct: false },
      { text: 'Heroku Shield Private Spaces', is_correct: true },
      { text: 'Heroku Postgres', is_correct: false },
      { text: 'Heroku Flow', is_correct: false }
    ],
  }
])

questions_for_unit4 = Question.create([
  {
    question_text: 'Who was the first Salesforce mascot?',
    unit: unit4,
    answers: [
      { text: 'Astro', is_correct: false },
      { text: 'SaaSy', is_correct: true },
      { text: 'Codey', is_correct: false },
      { text: 'Hootie McOwlface', is_correct: false }
    ],
  },
  {
    question_text: 'When was Salesforce founded?',
    unit: unit4,
    answers: [
      { text: '2009', is_correct: false },
      { text: '2003', is_correct: false },
      { text: '1995', is_correct: false },
      { text: '1999', is_correct: true }
    ]
  },
  {
    question_text: 'When did Heroku become part of Salesforce?',
    unit: unit4,
    answers: [
      { text: '2017', is_correct: false },
      { text: '2015', is_correct: false },
      { text: '2012', is_correct: false },
      { text: '2010', is_correct: true }
    ]
  },
  {
    question_text: 'What is the fun way to learn Salesforce?',
    unit: unit4,
    answers: [
      { text: 'Trailhead.', is_correct: true },
      { text: 'Staying up late every night trying to figure it out on your own.', is_correct: false },
      { text: 'Plugging your brain in using nanobioelectronics technology.', is_correct: false },
      { text: 'Reading every single page on help.salesforce.com.', is_correct: false }
    ]
  }
])
