Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9213BED78;
	Wed, 29 Jul 2026 21:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785360950; cv=fail; b=bTrIHOZwcR32K8BqJzD9WYd4LaGZCJ/6p4azZ4E4BakjIB2CIpxiQSFG6CbwL0drTxyhMie4BieazmbwymyngT8uod9BC/+aDHSUlBotJQ9zcnvNxXaR6pUOgKyTxBZyRFolTHVpXNhJX4i6jgpzf1EvsqnpYmMSnkCUty70SG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785360950; c=relaxed/simple;
	bh=sFEzgYCZl9tmJQKGiX3dWOyX8bTSOwgsSxSl4MPjvuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CZD32KvnJPZr5cd1cQiQV8TAei0Omm2o01Sv6uIZR4PrybUlU6xxFyGmstlb+pDATM9j8ZxQbX+0coH/w/VGsAD9jmjpNj27LrtgP2vpgR5Ja9DQD2HE+/y79Fn0+Xirp9M4eDWQ8nSRWFCzCGSHC/LepD0fyAN3NXy94qpjSmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i1RehkCu; arc=fail smtp.client-ip=52.101.83.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i1RehkCu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFmU/vwGpBVbEYnmqLhxnPVPUpss1eQ5Ehgy713gn1Gv5PJIrJhQeSX0vY2LUPijgHV1N3md2py+cIwgiqGi/p0KXBXwxlcRbv0UWO4IJ7ClZAv1ej8GatLNymquqKPcBn97ZlC4TysoDNHuVW2bOjHMwNamXte4ooRzVt2U+8I8JGA8mX52rBtYA67Y3hq9UAY2KxcYV4PK9LqKv5SA5ArRLq7sm/SGnkNKKWixEcUZNcYwEsTpRLPfT3hOjASnYSdXJ/9dq4eXX6k7j9AeKrZB2go3YJomZmP0qGwntr6WSFMOGZ59lt4Wub6e4sUC012atbj7qbTYHoaMAPNRZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oX9wJP8pf2zNGWFPUZUfOop2e+uKx6uXgUHdcvrjMRs=;
 b=LaAVSjURB+vPo4Ehp/m/R5aPgOmsMlGqy3piXt1v6d4QoSD+6x/3gpLEE1Ia9TcDAhR3+bKnao2pMPbRYA+UZIGK4gspvoWcW1x0TaBkHrtIRA6zU8cfK7YQv8/OgTcHa/dmcRyJB2CaS6jCgidDos5uhjc+6VPWWZs2YKquG5cN1AajtMDVaJLtfP3b3f0YS/S7tEoHqYLrZ7JAs6pshNKd4+CCgdLm2Gdu1VBTo9fnGJycVWmF/yY02nGsOdZwGwn6YJko5iYrK4zmV5MlKoxn8s0TTRPL9hTX2KuSobRKiOG/xJ54B/Se38m7TmkGwb//YYaOD6/ka44eVdfLNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oX9wJP8pf2zNGWFPUZUfOop2e+uKx6uXgUHdcvrjMRs=;
 b=i1RehkCug29wFGbs4jpuBSU6CDfMFzoVapBA1+ralefFFaiHcokpePJvzstIwCaS5kxFS1sK2HYCQd5bkinSkKUjtBf6xvs7SDUQXkTLxYAEJu+7G1tZbUI2gvpnGVCcCq9ZZw17cJCR5gUaVknkfBs5Qmme7pWlOQl51Zt3zH0oG1cmnrLEMoFts+CPIvMefbmhYrfVfpqrxrRi8WnXA8wGHYgbFhxRdVuLCA7UStwaSSGMe8RGy2TzaZ/gl70GY5Bn7SsXjvTiK73GgxErjg1gpca7kfYxNnAsM7xao5mAHzouWdpd7o3UQv1z6/IpyYBuCpHbgrwTJUcYJ58hmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8586.eurprd04.prod.outlook.com (2603:10a6:20b:439::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 21:35:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:35:45 +0000
Date: Wed, 29 Jul 2026 17:35:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH RESEND v9 6/9] media: qcom: camss: csiphy-3ph: Add Gen2
 v1.1 MIPI CSI-2 C-PHY init
Message-ID: <ampyJ9FmwKmpE0YW@lizhi-Precision-Tower-5810>
References: <20260729-qcom-cphy-v9-0-1f8d9fdab037@ixit.cz>
 <20260729-qcom-cphy-v9-6-1f8d9fdab037@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-qcom-cphy-v9-6-1f8d9fdab037@ixit.cz>
X-ClientProxiedBy: PH7PR17CA0063.namprd17.prod.outlook.com
 (2603:10b6:510:325::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c3f8b6-88bc-4cfe-fac3-08deedb9590a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|7416014|10067099003|4143699003|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 rD7yEuW4mpn7ZHhQmyaa15TRRMxwg28zx4sV0ReDpM6mMDa8Bn2VAqwP/9Quos544eQZ3OpRjd7Y+ehA2o9ZF2Et0b0fg/zuK1vftXliZwHEZm4xIod++rJCssC089arIXC10Df6SXZwbPGsOW5m2BFMR/H/wiG07y0AlrLgdWutluZ1+qN5gelVpNE9CgN2Glv/t7D5v0t5be/oyWBJY92pWDEHbrXAbTD0XvCqSTbf5zWO07B89P636AhArqW5rw1k0Cn7Y36cWplCrPN9uW28jmQY5QjwT1bm6/ZpNYGuWqU9aGY/m6gTB2QKIaovTiMwaerYy07kABcWGFT4KyRAweun0zniiTMu7e8p6ivF0NrVoN1wr+qOFFyoB0hHfwt9MgvpXnOtSUrKui2i9UmSl5mSQXWElwTBgqSwhgX1V+zewG4hMTU11490ojnL4IUnDncsyM9QUqDVnT/GBSt1OhfkSgAcTLLb1vkKazwxd7mMQz9CKcQ6NmFgwViM5ggvffp7YoZl/6jDIa8K/L4FwMmf+klubU1dDB0JWeEYCrNvvHTEamuDfW3OLD3rHER+nJMEGx1H8dNrAcXi0UIepqiek7FqBsR0MLZOzulwXP8uuIvnaLsDie7uAFncf2dIZSstNoeb6sUtZbqd9XJ7XqHzOX8/eiTOPyzukwc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(7416014)(10067099003)(4143699003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?lVXvoykxNSBRqgdn2/7XTp0CJG6P1D4nnv2KHAeA/uYiKsZCUmk80nylrlaZ?=
 =?us-ascii?Q?02by4uBtBvXuRylzpC/dPYe4SjZrlFKDWGTGAn/kwTEWdHPzNCIi3cEm7wSc?=
 =?us-ascii?Q?CjCUGCSoOZlLAU3NZ43NAecWnR6397Cg/1tSDzZiSoR1QEVXn7Eigxtniitr?=
 =?us-ascii?Q?WM9WAUFmpcNNs0Rvx2JYEBsydw4ibrW00hnmR2OLx+pHKD5X5huyLHuvKAM0?=
 =?us-ascii?Q?ERGtL6oiTqdby+BrzjPfEfDDI9jksGs9PLNBH2KUwymex0vvV7i0Ou/BpZNv?=
 =?us-ascii?Q?HQBX7vQlu0C/W5Vv8f7DAvZPleg5jxknnGIWGseZbRERnVik1NhiWoyq/hoG?=
 =?us-ascii?Q?EK7LUkWvPDVfjCrA513RY6ctAWKr3xipsxDRp8JUceb3Wyk0805MB4nqxkbi?=
 =?us-ascii?Q?U1JwWzSHVy18BkAi6mBzbi8096bKrRy64362Y3N1VRfwd8Z8edPYFldPLsel?=
 =?us-ascii?Q?AQ8stllqURGAp2cHmECyArsMj44a6n0RQ/lYsUKWGfkVw6kOrF9+i/uFiPwf?=
 =?us-ascii?Q?jJRVqoIXTTb2F8WIhbB3epenhuJaV9MMwxPgYvIhDzCHpQ2c52xseZiB20qz?=
 =?us-ascii?Q?CXOmJ/FQl+c1PcZYzCCieemY7L52rRDp6AS2R6FZbAHr7sK4qEONpt6mjw1B?=
 =?us-ascii?Q?d5s8keFFD0QimH8MAu20K0bFqRlSnVcpolmbQWZOO4MfvbMz1qt69lqmPABd?=
 =?us-ascii?Q?BvB0kHTuPFTVdLZW+X4yuQWF1hBVzhamxs/zwquG/5zPyYYvPG7WITa/WKzq?=
 =?us-ascii?Q?lM5vxokeslG/E8HvpYanAPYpwPnwA6fMXxT6lcVrHGbYadxCkSDt8l7FFA06?=
 =?us-ascii?Q?nhHFrFQSJ2HUXcJBH1TFZgI8cs03k8EBn7rHwrij6nOKNscZG1FMgOxkm2h9?=
 =?us-ascii?Q?Qwy4Ls++ZfFcjIH3rpi5Ju9OUizk6NhmCLC2d6u+C8pj3wOw3FaIEcX41kXQ?=
 =?us-ascii?Q?Iv9uWTtbUhKmnrmNomOWwXY9eiXm43lKYhhsq/0NOq+6XGq+/yd+bCuiaIrG?=
 =?us-ascii?Q?ZQNC02jtNf691fchRuOWUz17eCFxnlixP23iJbRjHqPBSvAMUlMvbJH7o/gF?=
 =?us-ascii?Q?Qnnl1NM/ADdVodH/ZV8l4J72kXpYcqrkEaRdCd5A5VevFSBf+XK5tu8Hxj8e?=
 =?us-ascii?Q?XiaDVcdnpD49LURrkPBGF/8Gke7pWEblegAGP8f/g4EdGzMR95p0Xitrbuvr?=
 =?us-ascii?Q?uLOPCqLdq9mPY5eTsLxo6nnHV8Jn95Nl6e9W6JbpYNuc/q8aXo39Uu2SoBoN?=
 =?us-ascii?Q?oGqN5qpKfClAtgqfGfY8U9uDITWgFyVNLDONGjkvXAx0UnVC8eozQfjdRiQu?=
 =?us-ascii?Q?YbVlZXfrJAbgosY4xWqP6bYh3/PUJpnFbQVm7PAhAUfXD0Vm0yM5us/NoUEf?=
 =?us-ascii?Q?Lf1jbQta2JbSWqwwqOnFhMpOuf2nEnGZfzmMwAvo4OrkK0546U9r+vjL97lS?=
 =?us-ascii?Q?Nn5bUH0dBQRVDg0JSCcRLv5Ir52FEDQhbOCT14jHq6hCz7Uqy9bDXF/90RIo?=
 =?us-ascii?Q?OG6mr6j2+kM+GmZAeqeImqtLKe3zf2xjhuN9tEuK7Z6GcR5M+otIStld5Ucs?=
 =?us-ascii?Q?7dwhbybO/hVLd5bb9Ybjj1GVKoYA5pNYEAiXGDszomzdhFkBrOs6FkzCpYzP?=
 =?us-ascii?Q?1Soc9oII008fw11Jc4pMkiKNVZJR9iHi4IuAQcTuRLN26k4p3N5kkdJBOmf9?=
 =?us-ascii?Q?IxXw3rUvBrewHLTbyZ1yPBYUuYSl3uCMfjqWzq3PebOxC85yLLOd1MaQe1+I?=
 =?us-ascii?Q?OcEZOx5nyebrDfDuKGo0ijX078aUzOI+33lzz3Fzt8vvv57KfvYt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c3f8b6-88bc-4cfe-fac3-08deedb9590a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:35:45.4054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XNcFnUglYvi4wN5zGd8vesNFvcntb8QNJj+gZPnX0LN1UacUkN6tdMlx1CWrT3KzlMy6VnEL1u/jXJlRKkusFUZcDt6ztYbeo4B5u4zN/+UyJ4AP0/Cp0Xj3J6WpXny
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8586

On Wed, Jul 29, 2026 at 10:20:01PM +0200, David Heidelberg wrote:
> Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
> Gen 2 version 1.1 CSI-2 PHY.
>
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode.

too much or, according to my understand D-PHY use 2 phase,  C-PHY use 3
phase?

The PHY can be configured as two phase (D-PHY) or three phase (C-PHY) ?

Frank

> This configuration supports three-phase C-PHY mode.
>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 78 +++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 5c07aa9d19c51..83de89a88dbb1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -45,16 +45,23 @@
>
>  #define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)	((offset) + 0x4 * (n))
>  #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
>  #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
>  #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
>  #define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
>  	((offset) + (common_status_offset) + 0x4 * (n))
>
> +#define CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(n) \
> +	(0x0100 + ((n) * 0x4))
> +#define CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(n) \
> +	(0x0300 + ((n) * 0x4))
> +#define CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(n) \
> +	(0x0500 + ((n) * 0x4))
> +
>  #define CSIPHY_DEFAULT_PARAMS		0
>  #define CSIPHY_LANE_ENABLE		1
>  #define CSIPHY_SETTLE_CNT_LOWER_BYTE	2
>  #define CSIPHY_SETTLE_CNT_HIGHER_BYTE	3
>  #define CSIPHY_DNP_PARAMS		4
>  #define CSIPHY_2PH_REGS			5
>  #define CSIPHY_3PH_REGS			6
>  #define CSIPHY_SKEW_CAL			7
> @@ -141,16 +148,17 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
>  	{0x0460, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x065C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x0660, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>  };
>
>  /* GEN2 1.0 2PH */
> +/* 5 entries: clock + 4 lanes */
>  static const struct
>  csiphy_lane_regs lane_regs_sdm845[] = {
>  	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> @@ -215,16 +223,82 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>  	{0x0608, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>  	{0x060C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
>  	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>  };
>
> +/* GEN2 1.0 3PH */
> +/* 3 entries: 3 lanes (C-PHY) */
> +static const struct
> +csiphy_lane_regs lane_regs_sdm845_3ph[] = {
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(6),  0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(9),  0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(17), 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(6),  0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(9),  0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(17), 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(6),  0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(9),  0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(17), 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
> +
> +};
> +
>  /* GEN2 1.1 2PH */
>  static const struct
>  csiphy_lane_regs lane_regs_sc8280xp[] = {
>  	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> @@ -1169,18 +1243,18 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  	int i;
>
>  	switch (csiphy->camss->res->version) {
>  	case CAMSS_845:
>  		if (c->phy_cfg == V4L2_MBUS_CSI2_DPHY) {
>  			regs->lane_regs = &lane_regs_sdm845[0];
>  			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>  		} else if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> -			regs->lane_regs = NULL;
> -			regs->lane_array_size = 0;
> +			regs->lane_regs = &lane_regs_sdm845_3ph[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845_3ph);
>  		}
>  		break;
>  	case CAMSS_2290:
>  	case CAMSS_6150:
>  		if (c->phy_cfg == V4L2_MBUS_CSI2_DPHY) {
>  			regs->lane_regs = &lane_regs_qcm2290[0];
>  			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
>  		} else if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>
> --
> 2.53.0
>
