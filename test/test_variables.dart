import 'package:stockdata/common/data/models/meta_data_response.dart';
import 'package:stockdata/common/domain/entities/meta_data.dart';
import 'package:stockdata/features/news/data/models/news_data_response.dart';
import 'package:stockdata/features/news/data/models/news_response.dart';
import 'package:stockdata/features/news/data/models/news_stock_data_response.dart';
import 'package:stockdata/features/news/domain/entities/news_data.dart';
import 'package:stockdata/features/news/domain/entities/news_entity.dart';
import 'package:stockdata/features/news/domain/entities/news_stock_data.dart';
import 'package:stockdata/features/search/data/models/entity_search_response.dart';
import 'package:stockdata/features/search/data/models/stock_data_response.dart';
import 'package:stockdata/features/search/domain/entities/search_entity.dart';
import 'package:stockdata/features/search/domain/entities/stock_data.dart';

const testMetaDataResponse = MetaDataResponse(
  page: 1,
  returned: 2,
  limit: 2,
  found: 4,
);

const testMetaData = MetaData(
  page: 1,
  returned: 2,
  limit: 2,
  found: 4,
);

const testStockData = StockData(
    symbol: 'MOV.NZ',
    name: 'Move Logistics Group Ltd',
    type: 'equity',
    exchange: 'NZX',
    exchangeLong: 'New Zealand Stock Exchange',
    micCode: 'XNZE',
    country: 'nz');

const testStockData2 = StockData(
    symbol: '^NZSCG',
    name: 'NEW ZEALAND EXCH NZSX SCI GR IDX',
    type: 'index',
    exchange: 'NZX',
    exchangeLong: 'New Zealand Stock Exchange',
    micCode: 'XNZE',
    country: 'nz');

const testSearchEntity = SearchEntity(metaData: testMetaData, stocksData: [
  testStockData,
  StockData(
      symbol: '^NZSCG',
      name: 'NEW ZEALAND EXCH NZSX SCI GR IDX',
      type: 'index',
      exchange: 'NZX',
      exchangeLong: 'New Zealand Stock Exchange',
      micCode: 'XNZE',
      country: 'nz'),
]);

const testSearchEntity2 = SearchEntity(
    metaData: MetaData(
      page: 2,
      returned: 2,
      limit: 2,
      found: 4,
    ),
    stocksData: [
      StockData(
          symbol: 'MORC.NZ',
          name: 'S&P/NZX Morrison Index',
          type: 'index',
          exchange: 'NZX',
          exchangeLong: 'New Zealand Stock Exchange',
          micCode: 'XNZE',
          country: 'nz'),
      StockData(
          symbol: 'DGC.NZ',
          name: 'DGL Group Ltd',
          type: 'equity',
          exchange: 'NZX',
          exchangeLong: 'New Zealand Stock Exchange',
          micCode: 'XNZE',
          country: 'nz'),
    ]);

const testSearchResponse = EntitySearchResponse(
    metaDataResponse: testMetaDataResponse,
    stocksDataResponse: [
      StockDataResponse(
          symbol: 'MOV.NZ',
          name: 'Move Logistics Group Ltd',
          type: 'equity',
          exchange: 'NZX',
          exchangeLong: 'New Zealand Stock Exchange',
          micCode: 'XNZE',
          country: 'nz'),
      StockDataResponse(
          symbol: '^NZSCG',
          name: 'NEW ZEALAND EXCH NZSX SCI GR IDX',
          type: 'index',
          exchange: 'NZX',
          exchangeLong: 'New Zealand Stock Exchange',
          micCode: 'XNZE',
          country: 'nz'),
    ]);

const testNewsStockData = NewsStockData(
  symbol: 'ARNC',
  name: 'Arconic Corporation',
  type: 'equity',
  industry: 'Industrials',
  exchange: 'NYSE',
  exchangeLong: 'New York Stock Exchange',
  country: 'us',
  matchScore: 117.90056,
  sentimentScore: 0.3548,
);

final testNewsDataResponse = NewsDataResponse(
  uuid: '81da86b4-db17-4616-9e98-69bdf4266746',
  title: 'BrightSpire Capital, Inc. (BRSP) Q4 2022 Earnings Call Transcript',
  description:
      'BrightSpire Capital, Inc. (NYSE:NYSE:BRSP) Q4 2022 Earnings Conference Call February 21, 2023 10:00 AM ETCompany ParticipantsDavid Palame - General CounselMike Mazzei - Chief Executive...',
  keywords: '',
  snippet:
      'BrightSpire Capital, Inc. (NYSE:BRSP) Q4 2022 Earnings Conference Call February 21, 2023 10:00 AM ET\n\nCompany Participants\n\nDavid Palame - General Counsel\n\nMike...',
  url:
      'https://seekingalpha.com/article/4580326-brightspire-capital-inc-brsp-q4-2022-earnings-call-transcript',
  imageUrl:
      'https://static.seekingalpha.com/assets/og_image_1200-29b2bfe1a595477db6826bd2126c63ac2091efb7ec76347a8e7f81ba17e3de6c.png',
  language: 'en',
  publishedAt: DateTime.parse('2023-02-21T19:29:03.000000Z'),
  source: 'seekingalpha.com',
  relevanceScore: null,
  entities: const [],
  similar: [
    NewsDataResponse(
      uuid: '4638526b-7579-430d-9df4-03dc108e3a38',
      title: 'Walker & Dunlop, Inc. (WD) Q4 2022 Earnings Call Transcript',
      description:
          'Walker & Dunlop, Inc. (NYSE:NYSE:WD) Q4 2022 Earnings Conference Call February 21, 2023 8:30 AM ETCompany ParticipantsKelsey Duffey - Senior Vice President of Investor RelationsWilly...',
      keywords: '',
      snippet:
          'Walker & Dunlop, Inc. (NYSE:WD) Q4 2022 Earnings Conference Call February 21, 2023 8:30 AM ET\n\nCompany Participants\n\nKelsey Duffey - Senior Vice President of In...',
      url:
          'https://seekingalpha.com/article/4580246-walker-and-dunlop-inc-wd-q4-2022-earnings-call-transcript',
      imageUrl:
          'https://static.seekingalpha.com/assets/og_image_1200-29b2bfe1a595477db6826bd2126c63ac2091efb7ec76347a8e7f81ba17e3de6c.png',
      language: 'en',
      publishedAt: DateTime.parse('2023-02-21T16:11:03.000000Z'),
      source: 'seekingalpha.com',
      entities: const [
        NewsStockDataResponse(
          symbol: 'WD',
          name: 'Walker & Dunlop, Inc.',
          exchange: 'NYSE',
          exchangeLong: 'New York Stock Exchange',
          country: 'us',
          matchScore: 154.47781,
          type: 'equity',
          sentimentScore: 0.114582,
          industry: 'Financial Services',
        ),
      ],
      relevanceScore: null,
      similar: const [],
    ),
  ],
);

final testNewsData = NewsData(
  uuid: '81da86b4-db17-4616-9e98-69bdf4266746',
  title: 'BrightSpire Capital, Inc. (BRSP) Q4 2022 Earnings Call Transcript',
  description:
      'BrightSpire Capital, Inc. (NYSE:NYSE:BRSP) Q4 2022 Earnings Conference Call February 21, 2023 10:00 AM ETCompany ParticipantsDavid Palame - General CounselMike Mazzei - Chief Executive...',
  keywords: '',
  snippet:
      'BrightSpire Capital, Inc. (NYSE:BRSP) Q4 2022 Earnings Conference Call February 21, 2023 10:00 AM ET\n\nCompany Participants\n\nDavid Palame - General Counsel\n\nMike...',
  url:
      'https://seekingalpha.com/article/4580326-brightspire-capital-inc-brsp-q4-2022-earnings-call-transcript',
  imageUrl:
      'https://static.seekingalpha.com/assets/og_image_1200-29b2bfe1a595477db6826bd2126c63ac2091efb7ec76347a8e7f81ba17e3de6c.png',
  language: 'en',
  publishedAt: DateTime.parse('2023-02-21T19:29:03.000000Z').toLocal(),
  source: 'seekingalpha.com',
  relevanceScore: null,
  entities: const [],
  similar: const [],
);

final testNewsDataResponse2 = NewsDataResponse(
  uuid: '1037da53-e169-4d2b-9f14-e6c1eaa1af30',
  title: 'Arconic Corporation (ARNC) Q4 2022 Earnings Call Transcript',
  description:
      'Arconic Corporation (NYSE:NYSE:ARNC) Q4 2022 Earnings Conference Call February 21, 2023 10:00 AM ETCompany ParticipantsShane Rourke - Director of Investor RelationsTimothy Myers - Chief...',
  keywords: '',
  snippet:
      'Arconic Corporation (NYSE:ARNC) Q4 2022 Earnings Conference Call February 21, 2023 10:00 AM ET\n\nCompany Participants\n\nShane Rourke - Director of Investor Relati...',
  url:
      'https://seekingalpha.com/article/4580304-arconic-corporation-arnc-q4-2022-earnings-call-transcript',
  imageUrl:
      'https://static.seekingalpha.com/assets/og_image_1200-29b2bfe1a595477db6826bd2126c63ac2091efb7ec76347a8e7f81ba17e3de6c.png',
  language: 'en',
  publishedAt: DateTime.parse('2023-02-21T18:25:02.000000Z'),
  source: 'seekingalpha.com',
  relevanceScore: null,
  entities: const [
    NewsStockDataResponse(
        symbol: 'ARNC',
        name: 'Arconic Corporation',
        exchange: 'NYSE',
        exchangeLong: 'New York Stock Exchange',
        country: 'us',
        type: 'equity',
        industry: 'Industrials',
        matchScore: 117.90056,
        sentimentScore: 0.3548),
  ],
  similar: const [],
);

final testNewsData2 = NewsData(
  uuid: '1037da53-e169-4d2b-9f14-e6c1eaa1af30',
  title: 'Arconic Corporation (ARNC) Q4 2022 Earnings Call Transcript',
  description:
      'Arconic Corporation (NYSE:NYSE:ARNC) Q4 2022 Earnings Conference Call February 21, 2023 10:00 AM ETCompany ParticipantsShane Rourke - Director of Investor RelationsTimothy Myers - Chief...',
  keywords: '',
  snippet:
      'Arconic Corporation (NYSE:ARNC) Q4 2022 Earnings Conference Call February 21, 2023 10:00 AM ET\n\nCompany Participants\n\nShane Rourke - Director of Investor Relati...',
  url:
      'https://seekingalpha.com/article/4580304-arconic-corporation-arnc-q4-2022-earnings-call-transcript',
  imageUrl:
      'https://static.seekingalpha.com/assets/og_image_1200-29b2bfe1a595477db6826bd2126c63ac2091efb7ec76347a8e7f81ba17e3de6c.png',
  language: 'en',
  publishedAt: DateTime.parse('2023-02-21T18:25:02.000000Z').toLocal(),
  source: 'seekingalpha.com',
  relevanceScore: null,
  entities: const [
    NewsStockData(
        symbol: 'ARNC',
        name: 'Arconic Corporation',
        exchange: 'NYSE',
        exchangeLong: 'New York Stock Exchange',
        country: 'us',
        type: 'equity',
        industry: 'Industrials',
        matchScore: 117.90056,
        sentimentScore: 0.3548),
  ],
  similar: const [],
);

final testNewsResponse =
    NewsResponse(metaDataResponse: testMetaDataResponse, newsDataResponse: [
  testNewsDataResponse,
  testNewsDataResponse2,
]);

final testNewsEntity = NewsEntity(metaData: testMetaData, newsData: [
  testNewsData,
  testNewsData2,
]);

final testNewsEntity2 = NewsEntity(
    metaData: const MetaData(
      page: 2,
      returned: 2,
      limit: 2,
      found: 4,
    ),
    newsData: [
      NewsData(
        uuid: '2275c711-f934-4bfa-be7d-972e0b5cbd8f',
        title:
            'Columbia Sportswear Winter Sale: Save Up to 50% OFF Many Select Gear - Hot Canada Deals',
        description:
            'Columbia Sportswear Canada has a great sale available now, where you can Save up to 50% off on many select gear. This offer is valid until March 8, 2023. Columbia Sportswear Canada offers \$7 flat rate shipping on all orders. Click below to start shopping at Columbia Sportswear Canada. Enjoy 🙂',
        keywords: '',
        snippet:
            'Columbia Sportswear Canada has a great sale available now, where you can Save up to 50% off on many select gear.\n\nThis offer is valid until March 8, 2023.\n\nColu...',
        url:
            'https://hotcanadadeals.ca/columbia-sportswear-winter-sale-save-up-to-50-off-many-select-gear/',
        imageUrl:
            'https://hotcanadadeals.ca/wp-content/uploads/2023/02/Screen-Shot-2023-02-21-at-4.34.56-PM-730x478.png',
        language: 'en',
        publishedAt: DateTime.parse('2023-02-21T21:39:43.000000Z').toLocal(),
        source: 'hotcanadadeals.ca',
        relevanceScore: null,
        entities: const [],
        similar: const [],
      ),
      NewsData(
        uuid: '41c4ad38-6c13-4d8c-8877-153d8df6fea9',
        title:
            'AppifyText.ai - From Text description to ready-to-use Web App in 30 seconds',
        description:
            'Describe your desired application in plain English and let AppifyText do the rest. AppifyText is a text-to-app, powered by AI, no-code platform. Create internal tools, business apps, admin portals, personal databases & more in 30 seconds.',
        keywords: '',
        snippet:
            'Free Options Discuss Collect Share Stats\n\nDescribe your desired application in plain English and let AppifyText do the rest. AppifyText is a text-to-app, powere...',
        url: 'https://www.producthunt.com/posts/appifytext-ai',
        imageUrl:
            'https://ph-files.imgix.net/88ba358e-e0d5-46f3-b175-edfa2e5045ee.png?auto=format&fit=crop&frame=1&h=512&w=1024',
        language: 'en',
        publishedAt: DateTime.parse('2023-02-21T21:32:21.000000Z').toLocal(),
        source: 'producthunt.com',
        relevanceScore: null,
        entities: const [],
        similar: const [],
      ),
    ]);
