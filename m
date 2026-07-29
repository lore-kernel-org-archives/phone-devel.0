Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6CE7262E;
	Wed, 29 Jul 2026 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785360593; cv=fail; b=TYcKYahzyNJ7dE7uIjBR8/x+1TuF6hglj1MHw04IQKoHAiUatRKH/KJKL4KTi5oY4efxms6MHrr1RBIL35Rp/o/yHHFtMsw79OpcAVGCVHckU40qqnl08EUOFZQe3Tpqm9XqcqJIfO60v+ZcyPENlcy2cCrsJNnh2JYXhKofXBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785360593; c=relaxed/simple;
	bh=1GAwq+xEp027o9jG6lmgp/jvKwl9BI5motfGHS1AFSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Po+GXuyz+jHW9H9aE+SFYmm0DezqXsa7uRPpI7DLE8LTXmUJljKAxiC3xmjB7KQnzUqBFZVAzuKscs5rivb76xnC4YXoIKI4b/Dbl1Y4C5jsT1BP0UMZiuSLnzkV5nJ/EE7hm2+NEy13M2GjxCUg/iRSvPpI2cKlzPgGXsjOpnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t/EtAp+I; arc=fail smtp.client-ip=52.101.66.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t/EtAp+I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8hyeyhry4mqqn9QgvFIsCwtko7MPOWqBwfSJcO46D6hiiwDqLS0UPo6CUyNGf21WIYGgzZZ2btLDq3eOqFHMMA6RRx0yom5o0Qd6zG2gHJMMh45/N2pGRGJz3+oINY8zikYCVbNaqVm0h5tzBAjOdYjXjZSfUr+/AU8wkzKrKnJeZnrvtB0nn2y5vj0fYw8LEE0ayAguixUWaZ4NI+1KMLRqrkBzcCorB0rBQbULUlD6KCew0OPuP/SrFLYgGD8axoxCt25sPsueE32BFgI8hUIN1ksGcgMZFbsKFDBbxq+C/CIQZzTDscMTQPICMdunbwJEUl5fwc7863C+fgPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CJNT7ZqximWW5uvTfbcID7R8v8mjb69d08AsYCpPVI=;
 b=o/tFjzLMRZ+rr6+YvY7QtcrZPi8jJ+WodpdgTCftFFu4edZ6E6r6Yr8HkeaaME/SJRXilEcz3UHmsl1fWjumYYcmSk4Zk0IuHVUb59mXwi4GaoAyuWWHDZHSINGbc1Jo0yPl8A/SSCXXDmxuehuHFDLwfRh5wI6FXHLaK0vbRkwXdc5Lk75mRSAf/cgD/RUYpILMS8wBUkcThkXhsYAlMfdd4uJsz9v5AI+bjyna4CxitAsHdin9SAxmuNafQpmknq0hfhpxI1zOVT17eQqJ0RA0OKJmNGr4WTWLZ2tWMBOX27ssharO+V8UGpx3Dtkw1++Gu99ZwVxRxyNCb0RbpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CJNT7ZqximWW5uvTfbcID7R8v8mjb69d08AsYCpPVI=;
 b=t/EtAp+ISBxDm13TgR+VeN9ZqqDiE0gjL+eBGQR77wiXKWAjRDpLk/9hrhUwUNXpXjxnapoJbUdXlPhJxEu3kAYwSVZFHVsmZknMYCD2oszzDuP5YVyR0G8NHb1Xzj8XnQux/u3+46jlot+ZCuA1kEYXRNwFFknaYEVh4q1CW3Zj5MXlCeqMcihnwFo4dt9wlwW9N1MvU79Rua7XV7FmKwu4gP4wKSM79ZBBSNUV3rJXcOqjIXJRqZ1e2bPHP1gZi1d3rcnP+YRLA6FOiojrqMHKJeghhJhL/ZPTYzzDjeauA52zhx+pIHqGXb61JhxEhFm3FsGXXzThJVPnuLcyaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8586.eurprd04.prod.outlook.com (2603:10a6:20b:439::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 21:29:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:29:48 +0000
Date: Wed, 29 Jul 2026 17:29:38 -0400
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
Subject: Re: [PATCH RESEND v9 3/9] media: qcom: camss: csiphy-3ph: Use odd
 bits for configuring C-PHY lanes
Message-ID: <ampwwmop7drycHky@lizhi-Precision-Tower-5810>
References: <20260729-qcom-cphy-v9-0-1f8d9fdab037@ixit.cz>
 <20260729-qcom-cphy-v9-3-1f8d9fdab037@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-qcom-cphy-v9-3-1f8d9fdab037@ixit.cz>
X-ClientProxiedBy: PH1PEPF000132F2.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 444104d9-d116-468d-cfe8-08deedb88405
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|7416014|10067099003|4143699003|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 oMzdEOS/TfY+SyS8+H1fENFXBjPHGz21S6cW+47KY245gbPxJgUiaoGe+rM+665PYsv00g9lMJxn3jyCjr4GMMOlkBu5J/baUrzpdqrzi7U2Epa+0l/GAsaWYxifwlvWzdIN7Y8JGqCU+8qPt4Tg/Dm6qUKyOYN9aVm3B44v2pcwY/FHXigmlNRGAJ8xMcVnxghMwwVKrp3WSZrOfwMWNAA9hcQKkbejFHwWFVCi5hZlzcKYViFhixrrEJR4qhZlbCvuyieoy8F0ByXX1ED2KKjmjjD4p9nF0qktvhOCevcCXT++LlD8CdmVBoaOlT65byzrFDkqoivvt2RWeTwFgFVCj+zEB9ejPN9D4NBTJ9lUNU8w/S3SamhetZRFB4ChAU064cGJgZKRnzGGIZZS3oIFMBcsd2YNso460JsQZg0zEb0roGfSdpX8Zdd0PVDkalXQMMxJFmXm0Z1cqG5dRNh0B9NC0wcwJDiadYpfS+URAwCq3d/QSj8DJOD9+ERPCre+J6lsgFKpFGKzXEQqGK9/7NB767uTfkx/Z0JD8xGjPAsESZDvDSv3mbmlmkeyWCzBPoOR2TGKFfnoCggPheUruXiNlJjVqCR/J66hbIkB69NrciedirCti69ZgNoLOemdVErVnYveJ90YCPlM9cnt6JSVUO80bNIItvOwmuo=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(7416014)(10067099003)(4143699003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?nB1BUtFV8A7VEN3muxe/qkjfcF3XztVKlPN1ps1QMb1GFy+wiiEUDH24DuXF?=
 =?us-ascii?Q?rgI9TSouR//gYQVUGf+C6B6j3JO+GZ9+TWTQCDLPAxOzCKkswrFYZehYV8yc?=
 =?us-ascii?Q?L10TIJA1IOnUriHYzwnZETWwZeJz2ygt3pv2/ERs6v2aWbh4nE/Oto7rUaRY?=
 =?us-ascii?Q?S8SMagNJSrF8t/qvSCKrMYuO4qW4JY8CycHDp4dVNTAJtgst1WF+i2mwKeeu?=
 =?us-ascii?Q?DHP0LXoQwEei4cjf++v+dDwYImZnuABS47w/SdjzhkwsVgYdMHOHtJplcKYv?=
 =?us-ascii?Q?BCt8Jcl327lAgO30Q78u2Pw4Ytt8iJbVedTy2GtPudUK+rY0/keUFI5Quw/q?=
 =?us-ascii?Q?POYJiadea0USZR2AInf/ACtWvQHEojXyyhkDOatTdpUs6bPb7CSNJudsGW3s?=
 =?us-ascii?Q?e23P8CflzGa8BVodELUOHJuY5egKVOxQNI85Mk3T2y6YHGuHMMG1duIQvZnG?=
 =?us-ascii?Q?QHEEVqSzWfdlME4j23iWWbXiYnjvJAzLQgM5SPkVEBcR6veNxYB5Vlk71XMv?=
 =?us-ascii?Q?9ykZDnNDFusc2p4CrofZb0m0JlJO7HOHKH/V6Wy26CbZD0ZRCVa9JJnVRH+o?=
 =?us-ascii?Q?9qT7xZtgdAZHjPxdiGJVZyyqBRLntm983siqLB/1QjHTn9sel8Flc5uZve1T?=
 =?us-ascii?Q?wbCbpt/qbk9y5cjxFRqIoPfVItWBIzxDXtEXj47vQ7b4HxAP6UjYrMAbbN20?=
 =?us-ascii?Q?uM5yiAdyvTr+LW5yLIQ/KPDgHHI1ifog9tOISNnsVLK59gbf3CW5OAshOGdx?=
 =?us-ascii?Q?qk0r+w/qXWmaOz+y/SLmwtiHryBp+hmudAvTaxKMHYlcp8ifYDuAk3Lv/c32?=
 =?us-ascii?Q?EfKJi4SQ1rbPoWyv75TzbRpIb4PaJQgZtpcP7AGlFh8ksMzR+ZwIUKBrUTPi?=
 =?us-ascii?Q?m6LU1Rn2BtPfHZYw39iYRItSYLwO9Dt+127iiYrWzuxlTBLv6k8iVo81crLi?=
 =?us-ascii?Q?NoVR0g/pODZbn5J2cEI4dRJhqBvIeQCjDUoxhcf44rnhpX5N9eZ+tegAGnSF?=
 =?us-ascii?Q?6wmlWpy1N4qf0nmgnbviJXPylYzuprLuGEbvFhXphGukU3jiRWXWkB5WzShL?=
 =?us-ascii?Q?0mtl26gIuaAgTw34+Jnr/m66pjhywfYgMbVKluG3hAJbtVewxHRwmn8W617v?=
 =?us-ascii?Q?jqs2S4tnvKEHNOtiHKCGwBDxVyg/xfFq2md2CAz0GbN/g+2MyabHsN8ACbRc?=
 =?us-ascii?Q?SWMwKmFMXIpkJI3jkcn8bfK+zvFJK/z61ZbW/kKzp0ICwz0hou20MAIoswcy?=
 =?us-ascii?Q?ntbEAnkgRlV8Tr7dqtoNqbdW9T1X5WsQNi8uRn3WZiKsZ9nev7S1O34vrl9V?=
 =?us-ascii?Q?y2Ht2zYShR6JcCxrrqhB6YM72kBeVz0NmYMGac597lDiY89wJEeUr/Cu3gWW?=
 =?us-ascii?Q?jM15VaNVSMeG2B9iFtIBUZtQxoEfFuTaU7iu+mONobIOv6YRWjebWxP893uM?=
 =?us-ascii?Q?469ocHvzgeG+ajP0DpoL7/3wW+eUaDYgWP3ptwGcVh2WJ4aM+uUFYdOCaDnb?=
 =?us-ascii?Q?uuF9BqONrc8IQ1zvKKwJjtYe7tqhiE0WdxhWO66YbenloTHx35PoLwpxIpxJ?=
 =?us-ascii?Q?q02OoGng9uvgxVDWxVuEGTimvbSlbH70fHdIQy+eny/RKEfFfeaSuWXhWK5P?=
 =?us-ascii?Q?NyKhvjeFB1Mb4VpDxzlTa+WHWeNdxKCRQ5n+Mw+qMMb6HoX5gPh15/KQv68+?=
 =?us-ascii?Q?JVrjLF2UMiA0DGaTxnlcLa6xSKBFyNOx1J4tWUQp3nBYhvJfXhIrb84f3/Of?=
 =?us-ascii?Q?L0df9UzzozBXiCJ1ze2ikuG/R8M3CEQZ4pPYah7SVUIlHvAWZIKy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 444104d9-d116-468d-cfe8-08deedb88405
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:29:47.9550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DjVCJ867CTcCBHxE8LAqDHv7CI5hYoUhEmF5A3xtYAn1hsOz3JB6xvkP3Fs9XXGYE7RXU2ggzsHsESyUGNGmw9hBMuWD2w1l3YTsDmWqGh2ac0G7mUQWSDpEcpCysJK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8586

On Wed, Jul 29, 2026 at 10:19:58PM +0200, David Heidelberg wrote:
> So far, only D-PHY mode was supported, which uses even bits when enabling
> or masking lanes. For C-PHY configuration, the hardware instead requires
> using the odd bits.
>
> Since there can be unrecognized configuration allow returning failure.
>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 25 ++++++++++++++--------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 7c8c0e41bc62f..dfcd9ed2eb7a3 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -9,16 +9,17 @@
>   */
>
>  #include "camss.h"
>  #include "camss-csiphy.h"
>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>
>  #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
>  #define CSIPHY_3PH_LNn_CFG2(n)			(0x004 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG2_LP_REC_EN_INT	BIT(3)
>  #define CSIPHY_3PH_LNn_CFG3(n)			(0x008 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG4(n)			(0x00c + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS	0xa4
> @@ -1108,23 +1109,32 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>  		writel_relaxed(val, csiphy->base + r->reg_addr);
>  		if (r->delay_us)
>  			udelay(r->delay_us);
>  	}
>  }
>
>  static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>  {
> -	u8 lane_mask;
> -	int i;
> +	u8 lane_mask = 0;
> +	u8 offset = 0;
>
> -	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +	switch (lane_cfg->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		offset = 1;
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +		break;
> +	default:
> +		break;
> +	}
>
> -	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= BIT(lane_cfg->data[i].pos * 2);
> +	for (int i = 0; i < lane_cfg->num_data; i++)
> +		lane_mask |= BIT((lane_cfg->data[i].pos * 2) + offset);
>
>  	return lane_mask;
>  }
>
>  static bool csiphy_is_gen2(u32 version)
>  {
>  	bool ret = false;
>
> @@ -1155,20 +1165,17 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>  	struct csiphy_device_regs *regs = csiphy->regs;
>  	u8 settle_cnt;
>  	u8 val;
>  	int i;
>
>  	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>
> -	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> -	for (i = 0; i < c->num_data; i++)
> -		val |= BIT(c->data[i].pos * 2);
> -
> +	val = csiphy_get_lane_mask(c);
>  	writel_relaxed(val, csiphy->base +
>  		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
>
>  	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
>  	writel_relaxed(val, csiphy->base +
>  		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>
>  	val = 0x02;
>
> --
> 2.53.0
>
