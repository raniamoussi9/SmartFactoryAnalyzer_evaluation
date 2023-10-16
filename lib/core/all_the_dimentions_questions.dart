import '../model/dimension_input_model.dart';

List<String> dimensionName = [
  ""
];

List<DimensionInputModel> dimensionInputModel = [
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Vertical processes are not explicitly defined; Resource planning and technical production processes are managed and executed in silos, based on informal or ad-hoc methods.",
        bandName: "Undefined"),
    BandModel(
        bandIndex: 1,
        description:
            "Vertical processes are defined and executed by humans, with the support of analogue tools; Resource planning and technical production processes are managed and executed in silos, based on a set of formally-defined instructions.",
        bandName: "Defined"),
    BandModel(
        bandIndex: 2,
        description:
            "Defined vertical processes are completed by humans with the support of digital tools; Resource planning and technical production processes are managed and executed in silos, by Operational Technology (OT) and Information Technology (IT) systems.",
        bandName: "Digital"),
    BandModel(
        bandIndex: 3,
        description:
            "Digitized vertical processes and systems are securely integrated across all hierarchical levels of the automation pyramid; OT and IT systems managing resource planning and technical production processes are formally linked. However, the exchange of data and information across different functions is predominantly managed by humans.",
        bandName: "Integrated"),
    BandModel(
        bandIndex: 4,
        description:
            "Integrated vertical processes and systems are automated, with limited human intervention; OT and IT systems managing resource planning and technical production processes are formally linked. This enables the exchange of data across different functions that is predominantly executed by equipment, machinery and computer-based systems.",
        bandName: "Automated"),
    BandModel(
        bandIndex: 5,
        description:
            "Automated vertical processes and systems are actively analyzing and reacting to data; OT and IT systems are integrated from end-to-end, with processes being optimized through insights generated from the analysis of data.",
        bandName: "Intelligent"),
  ], questions: [
    'How does the operations team manage and execute the information flow across all hierarchical levels of  the automation pyramid ?(i.e. from entreprise plaaaning level to the field level)',
    'How are the resource planning and technical production processes managed and executed ?(e.g. Production, Quality,etc.)? ',
    'How are the machines in the shop floor managed and monitored ? (e.g. quality performance operating status, etc)',
    'How is the qualty data collected and managed ?',
    'How is data collected and analyzed to optimize operations processes across the automation pyramid ? Please Describle the processes and the tools used',
  ]),
  //////////dimension2
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Supply chain processes are not explicitly defined; Enterprise processes are managed and executed in silos, based on informal or ad-hoc methods.",
        bandName: "Undefined"),
    BandModel(
        bandIndex: 1,
        description:
            "Supply chain processes are defined and executed by humans, with the support of analogue tools; Enterprise processes are managed and executed in silos, based on a set of formally defined instructions.",
        bandName: "Defined"),
    BandModel(
        bandIndex: 2,
        description:
            "Defined supply chain processes are completed by humans with the support of digital tools; Enterprise processes are managed and executed in silos by IT systems.",
        bandName: "Digital"),
    BandModel(
        bandIndex: 3,
        description:
            "Digitized supply chain processes and systems are securely integrated across business partners and clients along the value chain; IT systems managing enterprise processes are formally linked. However, the exchange of data and information across different functions is predominantly managed by humans.",
        bandName: "Integrated"),
    BandModel(
        bandIndex: 4,
        description:
            "Integrated supply chain processes and systems are automated, with limited human intervention; IT systems managing enterprise processes are formally linked. The exchange of data and information across different operations are predominantly executed by computer-based systems.",
        bandName: "Automated"),
    BandModel(
        bandIndex: 5,
        description:
            "Automated supply chain processes and systems are actively analyzing and reacting to data; IT systems are integrated from end-to-end, with processes being optimized through insights generated from analysis of data.",
        bandName: "Intelligent"),
  ], questions: [
    'How does the supply chain team manage and executeth e information flow across the organization and with stakeholders along  the values chain ? (e.g. Supply Chain Management, Purchasing etc.)',
    'How are the entreprise porcesses managed and executed within the internal stakeholders ?(e.g. Supply Chain Management, Purchasing etc.)?',
    'How are the entreprise processes managed and executed with the external stakeholders ?(e.g. Distribution, Logistics and Customers) ',
    'How is the supply chain data collected and managed ??',
    'How is data collected and analyzed to optimize the entreprise processes ?(i.e Supply Chain Management) Please describe the processes and the tools used',
    'How is data collected and analyzed to optimize the entreprise COMMENTS processes (i.e. Supply Chain Management)? Please describe the processes and the tools used.',
  ]),

  ///dimention 3
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Product lifecycle processes are not explicitly defined; Processes along the product lifecycle are managed and executed in silos based on informal or ad-hoc methods.",
        bandName: "Undefined"),
    BandModel(
        bandIndex: 1,
        description:
            "Product lifecycle processes are defined and executed by humans, with the support of analogue tools; Processes along the product lifecycle are managed and executed in silos, based on a set of formally defined instructions.",
        bandName: "Defined"),
    BandModel(
        bandIndex: 2,
        description:
            "Defined product lifecycle processes are completed by humans, with the support of digital tools; Processes along the product lifecycle are managed and executed in silos, by digital tools.",
        bandName: "Digital"),
    BandModel(
        bandIndex: 3,
        description:
            "Digitized product lifecycle processes and systems are securely integrated across all stages of the product lifecycle; Digital tools and systems that manage the product lifecycle are formally linked with each other. However, the exchange of information along the product lifecycle is predominantly managed by humans.",
        bandName: "Integrated"),
    BandModel(
        bandIndex: 4,
        description:
            "Integrated product lifecycle processes are automated, with limited human intervention; Digital tools and systems that manage the product lifecycle are formally linked with each other, and the exchange of information along the product lifecycle is predominantly executed by computer-based systems.",
        bandName: "Automated"),
    BandModel(
        bandIndex: 5,
        description:
            "Automated product lifecycle processes are actively analyzing and reacting to data; Digital tools and systems deployed for the management of the product lifecycle are integrated from end-to-end, with processes being optimized through insights generated from analysis of data.",
        bandName: "Intelligent"),
  ], questions: [
    'How is the product lifecycle data managed and executed along the processes from the initial customer use, service, and disposal ?',
    'Explain the processes and the tools used for each product lifecycle process',
    'How is the product information managed and executed to all stakeholders when there is a change to the specifications of the product ? (e.g. R&D, Design , Engineering, Manufacturing, Customer Service, etc?)',
    'How does the company engage customers and manage feedback in the development of the New Product Innovation (NPI)?',
    'How does the company engage  customers and manage \nfeedback in the utilization of products? ',
    'How is data collected and analyzed to optimize the product lifecycle processes ? please describe processes and the tools used',
  ]),
  ////dimention4
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Repetitive production and support processes are not automated; Production processes are executed by humans",
        bandName: "None"),
    BandModel(
        bandIndex: 1,
        description:
            "Repetitive production processes are partially automated, with significant human intervention. Repetitive support processes are not automated; Production processes are executed by humans with the assistance of equipment, machinery and computer-based systems.",
        bandName: "Basic"),
    BandModel(
        bandIndex: 2,
        description:
            "Repetitive production processes are automated, with minimal human intervention. Repetitive support processes are not automated; Production processes are predominantly executed by equipment, machinery and computer-based systems. Human intervention is required to initiate and conclude each process.",
        bandName: "Advanced"),
    BandModel(
        bandIndex: 3,
        description:
            "Repetitive production processes are fully automated, with no human intervention. Repetitive support processes are partially automated,with limited human intervention;  Production processes are fully automated through the use of equipment, machinery and computer-based systems. Human intervention is required for unplanned events.",
        bandName: "Full"),
    BandModel(
        bandIndex: 4,
        description:
            "Automated production processes are reconfigurable through plug-and-play automation. Repetitive support processes are partially automated, with limited human intervention; Equipment, machinery and computer-based systems can be modified, reconfigured and re-tasked quickly and easily when needed. Limited human intervention is required for unplanned events.",
        bandName: "Flexible"),
    BandModel(
        bandIndex: 5,
        description:
            "Flexible production and support processes are converged with enterprise and facility automation platforms to form highly autonomous networks; Equipment, machinery and computer-based systems are flexible and formally integrated with enterprise and facility systems to allow for dynamic, cross-domain interactions.",
        bandName: "Converged"),
  ], questions: [
    'Describe the degree and flexibilty pf automation within the location where the production and management of goods is carried out.',
    'How does the shop floor team monitor, control and execute the production processes (e.g. surface mount technology (SMT) line, fabrication, assembly etc.)? Please describe the type of equipment, machinery and computer- based systems used.',
    'How does the shop floor team monitor, control and execute the support processes (e.g. quality inspection , maintenance, warehouse etc.)',
    'How is material handling executed in the shop floor production and warehouse area? please describe the type of equipment , machinery and computer- based systems used.',
    'How is the shop floor data (e.g. quality, OEE, thoughtput maintenance, etc.) collected and managed ? ',
    'How does the equipment, machinery and computer-based systems modify, re-configure and retask autonomously based on the changes in working conditions',
  ])
  /////dim5
  ,
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Enterprise processes are not automated; Enterprise processes are executed by humans.",
        bandName: "None"),
    BandModel(
        bandIndex: 1,
        description:
            "Enterprise processes are partially automated, with significant human intervention; Enterprise processes are executed by humans with the assistance of computer-based systems.",
        bandName: "Basic"),
    BandModel(
        bandIndex: 2,
        description:
            "Enterprise processes are automated, with minimal human intervention; Enterprise processes are predominantly executed by computer-based systems. Human intervention is required to initiate and conclude each process.",
        bandName: "Advanced"),
    BandModel(
        bandIndex: 3,
        description:
            "Enterprise processes are fully automated, with no human intervention; Enterprise processes are fully automated through the use of computer-based systems. Human intervention is required only for unplanned events.",
        bandName: "Full"),
    BandModel(
        bandIndex: 4,
        description:
            "Automated enterprise processes are adaptable; Computer-based systems can be modified, reconfigured and re-tasked quickly and easily when needed. Limited human intervention is required for unplanned events.",
        bandName: "Flexible"),
    BandModel(
        bandIndex: 5,
        description:
            "Flexible enterprise processes are converged with shop floor and facility automation platforms to form highly autonomous networks; Computer-based systems are flexible and formally integratedwith those of shop floor and facility systems to allow for dynamic, cross-domain interactions.",
        bandName: "Converged"),
  ], questions: [
    'Describe the degree and flexibility of automation within the location where the administrative work is carried out. Exampled of administrative work are saled and marketing, demand planning, procurement, human resource management and planning.',
    'How does the entreprise team monitor, control and execute the entreprise processes (e.g. accounts, sales, marketing, inventory management, human resource, etc.)? please describe the computerbased systems used.',
    'How is the administrative  information (e.g. inventory, lead time, delivery time, etc.) collected and managed ?',
    'How does the entreprisecomputer-based systems modify , reconfigure and re-task autonomously based on the changed in working conditions?',
  ])
  ////dim6
  ,
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Facility processes are not automated; Facility processes are executed by humans.",
        bandName: "None"),
    BandModel(
        bandIndex: 1,
        description:
            "Facility processes are partially automated, with significant human intervention; Facility processes are executed by humans, with the assistance of equipment, machinery and computer-based systems.",
        bandName: "Basic"),
    BandModel(
        bandIndex: 2,
        description:
            "Facility processes are automated, with minimal human intervention; Facility processes are predominantly executed by equipment, machinery and computer-based systems. Human intervention is required to initiate and conclude each process.",
        bandName: "Advanced"),
    BandModel(
        bandIndex: 3,
        description:
            "Facility processes are fully automated, with no human intervention; Facility processes are fully automated through the utilization of equipment, machinery and computer-based systems. Human intervention is required for unplanned events.",
        bandName: "Full"),
    BandModel(
        bandIndex: 4,
        description:
            "Automated facility processes are adaptable; Equipment, machinery and computer-based systems can easily be modified, reconfigured and re-tasked quickly and easily. Limited human intervention is required for unplanned events.",
        bandName: "Flexible"),
    BandModel(
        bandIndex: 5,
        description:
            "Flexible facility processes are converged with shop floor and enterprise automation platforms to form highly autonomous networks; Equipment, machinery and computer-based systems are flexible and formally integrated with shop floor and enterprise systems to allow for dynamic, cross-domain interactions.",
        bandName: "Converged"),
  ], questions: [
    'Describe the degree and flexibility of automation within the physical building and/or premises where the production area is located',
    'How does the facility team monitor, control and execute the facility processes (e.g. heating, ventilation and air confitioning (HVAC), lighting, compressor , chiller, water treatment, etc.)?',
    'How does the facility team perform maintenance on equipment, machinery and computer-based systems (e.g. HVAC, lighting, compressor, chiller, water treatment, etc.)',
    'How is the facility data (e.g. enrgy consumption) collected and managed ?',
    'How does the equipment , machinery and computer - based systems modify, re-configure and re-task autonomously based on the changes in working conditions ?',
  ])
  //dim7
  ,
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Production assets and systems are not connected; Equipment, machinery and computer-based systems are not able to interact or exchange information.",
        bandName: "None"),
    BandModel(
        bandIndex: 1,
        description:
            "Production assets and systems are connected via multiple communication technologies and protocols; There are formal network links will enable equipment, machinery and computer-based systems to interact or exchange information.",
        bandName: "Connected"),
    BandModel(
        bandIndex: 2,
        description:
            "Connected production assets and systems are interoperable across multiple communication technologies and protocols; Equipment, machinery and computer-based systems are able to interact and exchange information without significant restrictions.",
        bandName: "Interoperable"),
    BandModel(
        bandIndex: 3,
        description:
            "Enterprise processes are fully automated, with no human intervention; Enterprise processes are fully automated through the use of computer-based systems. Human intervention is required only for unplanned events.",
        bandName: "Interoperable & Secure"),
    BandModel(
        bandIndex: 4,
        description:
            "Automated enterprise processes are adaptable; Computer-based systems can be modified, reconfigured and re-tasked quickly and easily when needed. Limited human intervention is required for unplanned events.",
        bandName: "Real-Time"),
    BandModel(
        bandIndex: 5,
        description:
            "Flexible enterprise processes are converged with shop floor and facility automation platforms to form highly autonomous networks; Computer-based systems are flexible and formally integratedwith those of shop floor and facility systems to allow for dynamic, cross-domain interactions.",
        bandName: "Scalable"),
  ], questions: [
    'Describe the degree and flexibility of automation within the location where the administrative work is carried out. Exampled of administrative work are saled and marketing, demand planning, procurement, human resource management and planning.',
    'How does the entreprise team monitor, control and execute the entreprise processes (e.g. accounts, sales, marketing, inventory management, human resource, etc.)? please describe the computerbased systems used.',
    'How is the administrative  information (e.g. inventory, lead time, delivery time, etc.) collected and managed ?',
    'How does the entreprisecomputer-based systems modify , reconfigure and re-task autonomously based on the changed in working conditions?',
  ])
  //dim8
  ,
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Enterprise IT systems are not connected; Computer-based systems are not able to interact or exchange information.",
        bandName: "None"),
    BandModel(
        bandIndex: 1,
        description:
            "Enterprise IT systems are connected via multiple communication technologies and protocols; There are formal network links that will enable computer-based systems to interact or exchange information.",
        bandName: "Connected"),
    BandModel(
        bandIndex: 2,
        description:
            "Enterprise IT systems are interoperable across multiple communication technologies and protocols; Computer-based systems are able to interact and exchange information without significant restriction. There is an exchange of information and data between processes and systems within the enterprise.",
        bandName: "Interoperable"),
    BandModel(
        bandIndex: 3,
        description:
            "Interoperable enterprise IT systems are secure; There is a vigilant and resilient security framework to protect the network of interoperable computer-based systems from undesired access and/or disruption.",
        bandName: "Interoperable & Secure"),
    BandModel(
        bandIndex: 4,
        description:
            "Interoperable enterprise IT systems are secure and capable of real-time communication; Interoperable and secure network links across the different computer-based systems are able to interact or exchange information as the information is generated without delay.",
        bandName: "Real-Time"),
    BandModel(
        bandIndex: 5,
        description:
            "Interoperable enterprise IT systems are secure, capable of real-time communication, and scalable; Existing networks can be reconfigured quickly and easily to accommodate any modifications made to the existing composition of computer-based systems.",
        bandName: "Scalable"),
  ], questions: [
    'How does the entreprise team collect and retrieve entreprise data (e.g. delivery schedule, sales forecast, demand planning etc.) ?',
    'How do computer -based systems exchange information between the different enterprise processes (e.g. sales order, demand forecast , product specification, purchase order, supply chain planning, etc.)?',
    'Describe and elaborate the type of communication protocol implemented in the computer-based systems for the exchange of information with internal and external stakeholders ',
    'Describe and elaborate the security protocols (e.g. VPN, firewall, DMZ, etc.) implemented in computer-based systems?',
    'Describe the accessibility of  computer based systems data on a real-time basis (e.g. remote monitoring)',
    'How does the existing network reconfigure and accommodate any modifications made to the existing computer-based systems?',
  ]),
  //dim9

  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Facility assets and systems are not connected; Equipment, machinery and systems are not able to interact or exchange information.",
        bandName: "None"),
    BandModel(
        bandIndex: 1,
        description:
            "Facility assets and systems are connected via multiple communication technologies and protocols; There are formal network links that will enable equipment, machinery and computer-based systems to interact or exchange information.",
        bandName: "Connected"),
    BandModel(
        bandIndex: 2,
        description:
            "Facility assets and systems are interoperable across multiple communication technologies and protocols; Equipment, machinery and computer-based systems are able to interact and exchange information without significant restrictions.",
        bandName: "Interoperable"),
    BandModel(
        bandIndex: 3,
        description:
            "Interoperable facility assets and systems are secure; There is a vigilant and resilient security framework to protect the network of interoperable equipment, machinery and computer-based systems from undesired access and/or disruption.",
        bandName: "Interoperable & Secure"),
    BandModel(
        bandIndex: 4,
        description:
            "Interoperable facility assets and systems are secure; There is a vigilant and resilient security framework to protect the network of interoperable equipment, machinery and computer-based systems from undesired access and/or disruption.",
        bandName: "Real-Time"),
    BandModel(
        bandIndex: 5,
        description:
            "Interoperable facility assets and systems are secure, capable of real-time communication, and scalable; Existing networks can be configured quickly and easily to accommodate any modifications made to the existing composition of equipment, machinery and computer-based systems.",
        bandName: "Scalable"),
  ], questions: [
    'How does the facility team collect and retrive data (e.g. energy consumption, compressor performance,etc.)?',
    'How do equipment, machinery and computer-based systems exchange information (e.g. clean room specifications)?',
    'Describe and elaborate the type of communication protocol implemented in the equipment, machinery and computer-based systems (e.g. flied bus , industrial ethernet, transmission control protocol, Internet protocol (TCP/IP),etc.)',
    'Describe and elaborate the security protocols implemented in equipment, machinery and computer-based systems?',
    'Describe the accessibility of equipment , machinery and  computer based systems data on a real-time basis (e.g. remote monitoring)',
    'How does the existing network reconfigure and accommodate any modifications made to the equipment, machinery and existing computer-based systems?',
  ]),

  ///dim10
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "OT and IT systems are not in use; No electronic or digital tools are used.",
        bandName: "None"),
    BandModel(
        bandIndex: 1,
        description:
            "OT and IT systems execute pre-programmed tasks and processes; Equipment, machinery and computer-based systems are able to perform tasks based on pre-programmed logic.",
        bandName: "Computerized"),
    BandModel(
        bandIndex: 2,
        description:
            "Computerized OT and IT systems are able to identify deviations; Equipment, machinery and computer-based systems are able to notify operators of deviations from pre-defined parameters.",
        bandName: "Visible"),
    BandModel(
        bandIndex: 3,
        description:
            "Computerized OT and IT systems are able to identify deviations and diagnose potential causes; Equipment, machinery and computer-based systems are able to notify operators of deviation and provide information on the possible causes.",
        bandName: "Diagnostic"),
    BandModel(
        bandIndex: 4,
        description:
            "Computerized OT and IT systems are able to diagnose problems and predict future states of assets and systems; Equipment, machinery and computer-based systems are able to predict and notify operators of potential deviations and provide information on possible causes.",
        bandName: "Predictive"),
    BandModel(
        bandIndex: 5,
        description:
            "Computerized OT and IT systems are able to diagnose problems, predict future states and autonomously execute decisions to adapt to changes; Equipment, machinery and computer-based systems are able to predict potential deviations, and independently execute decisions to optimize performance and resource efficiency.",
        bandName: "Adaptive"),
  ], questions: [
    'How does the shop floor team process and analyze the shop floor data (quality, machine performance, etc.)?',
    'How do the equipment , machinery, and computer-based system detect and respond to anomalies ?',
    'How do the equipment, machinery, and computer -based system notify the operators when there is parameter deviation, provide information on the possible causes ? ',
    'How do the equipment , machinery , and computer-based systems predict potential deviations from specifications or limits ?',
    'How does the equipment , machinery and computer - based systems autonomously execute the decision based on the changes in full operating conditions ?',
  ])
  //dim11
  ,
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Enterprise systems are not in use; No electronic or digital devices are used and alerts are identified purely based on human capabilities.",
        bandName: "None"),
    BandModel(
        bandIndex: 1,
        description:
            "Enterprise IT systems execute pre-programmed tasks and processes; Enterprise computer-based systems perform tasks based on pre-programmed logic.",
        bandName: "Computerized"),
    BandModel(
        bandIndex: 2,
        description:
            "Enterprise IT systems are able to identify deviations; Enterprise computer-based systems are able to notify relevant personnel of deviations from pre-defined parameters.",
        bandName: "Visible"),
    BandModel(
        bandIndex: 3,
        description:
            "Enterprise IT systems are able to identify deviations and diagnose potential causes; Enterprise computer-based systems are able to notify relevant personnel of deviations and provide information on the possible causes.",
        bandName: "Diagnostic"),
    BandModel(
        bandIndex: 4,
        description:
            "Enterprise IT systems are able to diagnose problems and predict future states of assets and systems; Enterprise computer-based systems are able to predict and notify relevant personnel of potential deviations and provide information onthe possible causes.",
        bandName: "Predictive"),
    BandModel(
        bandIndex: 5,
        description:
            "Enterprise IT systems are able to diagnose problems, predict future states, and autonomously execute decisions to adapt to changes; Enterprise computer-based systems are able to predict and diagnose potential deviations, and independently execute decisions to optimize performance and resource efficiency.",
        bandName: "Adaptive"),
  ], questions: [
    'How does the shop floor team process and analyze the shop floor data (quality, machine performance, etc.)?',
    'How do the equipment , machinery, and computer-based system detect and respond to anomalies ?',
    'How do the equipment, machinery, and computer -based system notify the operators when there is parameter deviation, provide information on the possible causes ? ',
    'How do the equipment , machinery , and computer-based systems predict potential deviations from specifications or limits ?',
    'How does the equipment , machinery and computer - based systems autonomously execute the decision based on the changes in full operating conditions ?',
  ])
  //dim12
  ,
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "OT and IT systems are not in use; No electronic or digital devices are used.",
        bandName: "None"),
    BandModel(
        bandIndex: 1,
        description:
            "OT and IT systems execute pre-programmed tasks and processes; Equipment, machinery and computer-based systems perform tasks based on pre-programmed logic.",
        bandName: "Computerized"),
    BandModel(
        bandIndex: 2,
        description:
            "Computerized OT and IT systems are able to identify deviations; Equipment, machinery and computer-based systems are able to notify relevant personnel of deviations from pre-defined parameters.",
        bandName: "Visible"),
    BandModel(
        bandIndex: 3,
        description:
            "Computerized OT and IT systems are able to identify deviationsand diagnose potential causes; Equipment, machinery and computer-based systems are able to notify relevant personnel of deviations, and provide information on possible causes.",
        bandName: "Diagnostic"),
    BandModel(
        bandIndex: 4,
        description:
            "Computerized OT and IT systems are able to diagnose problems and predict future states of assets and systems; Equipment, machinery and computer-based systems are able to predict and notify relevant personnel of potential deviations and provide information on the possible causes.",
        bandName: "Predictive"),
    BandModel(
        bandIndex: 5,
        description:
            "Computerized OT and IT systems are able to diagnose problems, predict future states and autonomously execute decisions to adapt to changes; Equipment, machinery and computer-based systems are able to predict and diagnose potential deviations and independently execute decisions to optimize performance and resource efficiency.",
        bandName: "Adaptive"),
  ], questions: [
    'How does the facility team process and analyze the facility data (e.g. compressor, security, electricity, etc.)?',
    'Describe how do the equipment, machinery and computer-based systems detect and respond to anomalies ? ',
    'How do the equipment, machinery and computer-based system notify the relevant personnel when there is parameter deviation, and provide information on the possible causes?',
    'How do the equipment, machinery and computer-based systems predict potential deviations from specifications or limits?',
  ])

  //dim13
  ,
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Informal mentorship and apprenticeship is the predominant mode of workforce L&D; There is no formal L&D curriculum to on-board and train the workforce.",
        bandName: "Informed"),
    BandModel(
        bandIndex: 1,
        description:
            "Formally-designed training curricula for skills acquisition is the predominant mode of workforce L&D; There is a formal L&D curriculum with clear commencement and conclusion points. The scope of L&D is limited to skills acquisition.",
        bandName: "Structured"),
    BandModel(
        bandIndex: 2,
        description:
            "Structured L&D programmes are designed to run on an ongoing basis, to order to enable the ongoing enhancement and/or expansion of employees’ skillsets; There is a structured L&D curriculum that adopts an approach of continuous to enable the constant learning, re-learning and improvement of new and existing skills.",
        bandName: "Continuous"),
    BandModel(
        bandIndex: 3,
        description:
            "Continuous L&D programmes are formally aligned with the organization’s business needs and human resources (HR) functions; There is a continuous L&D curriculum that is integrated with organizational objectives, talent attraction and career development pathways.",
        bandName: "Integrated"),
    BandModel(
        bandIndex: 4,
        description:
            "Integrated L&D programmes are actively developed, refreshed and customized based on insights provided by key stakeholders through feedback loops; Formal feedback channels are in place to allow integrated L&D programmes to be jointly curated and updated by employees, HR and business teams.",
        bandName: "Adaptive"),
    BandModel(
        bandIndex: 5,
        description:
            "Active efforts are made to identify and incorporate innovative L&D practices and training for future skillsets into the adaptive L&D programmes; There are proactive steps to incorporate requirements for future skillsets and novel L&D methodologies into existing L&D programmes.",
        bandName: "Forward-looking"),
  ], questions: [
    'Describe the workforce learning and development processes for all the employees in the company.',
    'How are the training programmes for employees being identified?',
    'Decribe the feedback process before and after the training completion. How are are the training programmes being restructured and improved based on the stakeholders feedback ?',
    'Decribe your current workforce digital capability, skills and competencies.',
    'How integrated is the learning and development curriculum with the business objectives in Industry 4.0 transformation?',
    'How is the learning and development curriculum being constantly revised based on the latest technology trends?',
  ])
  //dim14
  ,
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Management is unfamiliar with the most recent trends and technologies; Management is unacquainted with the latest concepts that can enable the next phase of advancement.",
        bandName: "Unfamiliar"),
    BandModel(
        bandIndex: 1,
        description:
            "Management has some awareness, through ad-hoc channels, ofthe most recent trends and technologies; Management is partially familiar with the latest concepts that can enable the next phase of advancement.",
        bandName: "Limited Understanding"),
    BandModel(
        bandIndex: 2,
        description:
            "Management is well-informed, through formal channels and avenues of the most recent trends and technologies; Management is fully familiar with the latest concepts that can enable the next phase of advancement.",
        bandName: "Informed"),
    BandModel(
        bandIndex: 3,
        description:
            "Management is reliant on external partners to develop initiatives that leverage on the most recent trends and technologies to improve at least one area of the organization; With external assistance, management is able to apply the latest concepts to enable improvements in at least one area.",
        bandName: "Semi-Dependent"),
    BandModel(
        bandIndex: 4,
        description:
            "Management is able to, with relative independence, develop initiatives that leverage the latest trends and technology to improve more than one area of the organization; Management can apply the latest concepts to enable improvements across multiple areas.",
        bandName: "Independent"),
    BandModel(
        bandIndex: 5,
        description:
            "Management is able to independently adapt its organizational transformation framework to changing trends and technologies; Management is able to augment its improvement initiatives with the latest concepts and requirements.",
        bandName: "Adaptive"),
  ], questions: [
    'What is the level of management knowledge in terms of Industry 4.0 technology and trends (e.g. Big data , Cloud Computing, Machine learning (ML), etc.)?',
    'Explain the difference between Industry 3.0 and Industry 4.0.',
    'How does the management team identify and implement the Industry 4.0 concepts and technologies in the company ?',
    'Describe the Industry 4.0 projects implemented and the benefits generated for the company.',
    'How does the leadership team revise its digital transformation framwork accordingly based on the latest technology trends ?',
  ])
  //dim15
  ,
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Communication and information sharing across teams happens on an informal basis; Teams generally work in silos. Communication and collaborations happen on a casual, ad hoc basis.",
        bandName: "Informal"),
    BandModel(
        bandIndex: 1,
        description:
            "Formal channels are established for communication and information sharing across teams; Teams are provided with formal avenues to exchange information.",
        bandName: "Communicating"),
    BandModel(
        bandIndex: 2,
        description:
            "Formal channels are established to allow teams to work togetheron discrete/one-off tasks and projects; Teams are provided with formal avenues to interact and work on discrete tasks and projects together.",
        bandName: "Cooperating"),
    BandModel(
        bandIndex: 3,
        description:
            "Teams are empowered by the organization to make adjustments that will facilitate cooperation on discrete tasks and projects; Teams have the mandate to alter or adjust certain obligations and responsibilities to reduce the barriers for cooperation on joint tasks and projects.",
        bandName: "Coordinating"),
    BandModel(
        bandIndex: 4,
        description:
            "Teams are empowered by the organization to share resources on both discrete and longer-term tasks and projects; Teams have the mandate to commit resources to both discrete and longer-term tasks and projects. Risk, responsibility and rewards are partially shared.",
        bandName: "Collaborating"),
    BandModel(
        bandIndex: 5,
        description:
            "Formal channels are established to enable dynamically- forming teams to work on cross-functional projects with shared goals, resources and KPIs; Teams can be formed with the flexibility and agility to address problem statements as they arise. Risk, responsibility and rewards are predominantly shared.",
        bandName: "Integrated"),
  ], questions: [
    'How are the communication and information shared across the functional and cross-functional team ? Please describe the process.',
    'How are the communication and information shared across the external partners (e.g. suppliers, customers, etc.)? Please describe the methods',
    'How are formal channels being established in the company to work on Tasks and projects ? Please describe the methods',
    'How are the teams being empowered by the organization to share resources and work on tasks and projects?',
    'How are the risks, responsabilities and rewards shared across crossfunctional teams and with external partners upon the delivery of tasks and projects?',
  ])
  //dim16
  ,
  DimensionInputModel(bands: [
    BandModel(
        bandIndex: 0,
        description:
            "Transformation towards a Factory/Plant-of-the-Future is not present in any part of the organization’s strategy; Intentions to establish a Factory/Plant-of-the-Future are not identified as a strategic focus in the company’s current or future plans.",
        bandName: "None"),
    BandModel(
        bandIndex: 1,
        description:
            "Transformation towards a factory/plant-of-the-future has been formally identified as a business strategy at the corporate or business level; Intentions to establish a factory/plant-of-the-future has been identified as a strategic focus in the company’s current or future operations.",
        bandName: "Computerized"),
    BandModel(
        bandIndex: 2,
        description:
            "A transformation initiative towards a factory/plant-of-the-future is being/has been developed by a dedicated team; A long-term strategy and governance model that establishes a factory/plant-of-the-future is being/has been developed.",
        bandName: "Visible"),
    BandModel(
        bandIndex: 3,
        description:
            "Transformation initiative towards a Factory/Plant-of-the-Futurehas been formally implemented in at least one functional area; The long-term strategy and governance model to establish a Factory/Plant-of the-Future has been put into action.",
        bandName: "Diagnostic"),
    BandModel(
        bandIndex: 4,
        description:
            "Transformation initiative towards a Factory/Plant-of-the-Future is expanded to include more than one functional area; A long-term strategy and governance model to establish a Factory/Plant-of-the-Future is scaled up to include secondary areas.",
        bandName: "Predictive"),
    BandModel(
        bandIndex: 5,
        description:
            "Transformation initiative towards a Factory/Plant-of- the-Future is refreshed and updated dynamically; The long-term strategy and governance model to establish a Factory/Plant-of-the-Future is constantly reviewed and dynamically refreshed to account for the latest advancements in technology, business philosophy and practices.",
        bandName: "Adaptive"),
  ], questions: [
    'Does the company have the intention to establish a factory/ Plant- ofthe-Future ? is it identified as part of the organization’s startegy ?',
    'Has the company developed or is developing a road map to establish a Factory/Plant-of-the Future? Please describe the roadmap and action plans developed.',
    'How does the company engage the employees on the initiatives being developed to establish the Factory/Plant-of-the-Future?',
    'What are the pilots initiatives being implemeented in the company ? Please describe the pilot initiatives implemented.',
    'Once the pilot initiative has been implemented successfully, how does the company scale it to other areas ? ',
    'How is the long-term strategu and governance to establish a Factory/Plant-of-the Future being refreshed and updated based on the latest technology trends ?'
  ])
];
