Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ADD423EB9;
	Wed, 29 Jul 2026 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361298; cv=fail; b=fw3U/FVpNkKzvo/RKlMACfvIGvSd9gHeqrDRDMKi7iK3wJAJ5opYcZTjJn2Y6kHzOTjutxgRG74oGevIkpYI8b4Jyf9bzsvLrFEg3Xl7GySkP+jtsEogqq1qXi9U4oO2RAcGvLasrmFPdJl8A68CZypPbtlsyvfcAJp/IDc8GJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361298; c=relaxed/simple;
	bh=JSPDvSz7HGjzqBop54u1t5DkRX9uzULpUPEA//K+zqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PrXSUYOTBEiDNpUeoilvbpdJJB48AVEW9DfuB5HPAR8gel9WsP379WShbVLdhYjYbYWabA+12nSeVH8WDVEGW93eyKgxPwQMvqBY7gWwUyfW8FpmoGDc5jagDz4QDPoMGTMy/K8DOG/ZtDP1KBLzRGUHOwsGAyemC3i2QAlYAPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mRp7A4sC; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mRp7A4sC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2hbiJfasAQcI188fQVZYJAQF2wnE8xFJX78VNu4HqfHF2qWNIxkvBw3VetlxtLGhilfCVTiHcSdq8OYt+i4NfYXHAJbayyr7IDO1duFIrvd4My6tzULIWzsOLOgbz0TuntgRvc8uG6xSkEwvi8GvPWxdsQJQA1xgZj7XMZNRMEUECC9WMlr3SCa9T+VZ9iPPXOg3EgUbeBC2uMtruqZUjMonn7/Y3AqRwywERRjpqgdMLFNHOshCG6WCUNbPT0dyioC0DNIZK9QRcIYEY6huO/QO0ua06rpZaUBeMdZLS5xqQfpKKuyIpfzPXp/kLUlj2INT4S99kFoBO7i+J7uXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjvXqDGCNLtrMVC2YGrthqySBJXs7Ts2AFgjeajLxXk=;
 b=iRLHKAbX/hq99QQyu2pmXLV4TjSx62Gtet+DN2ZHGl7UWNdgHeK0tD9Z6Ht5X2Rv7yvwmsoV9ChgeJVmlBF70/ZwbR5JfFMjCnIor30Ga8+NPHASuPDlTUKgq1+FOcEy4vRWj1l51F272rLmTzsDWRXDjTPZ0se/6vwVRC84B+vzTJwqwdah1aRWlMiDhIDR8a2MaLHbhZyrLBsxheUMXMwW3f+byKnS2FVQruwGx67s4XH/OzD8FvfjzIe17JrRw3NNWqGmxfReFTtuCmm0lvzHq+0R03G9YnPFssoLPC/jE7OtubFjuJzPioAWYXPvtBe4W7bSGfoa22VEJSEvww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjvXqDGCNLtrMVC2YGrthqySBJXs7Ts2AFgjeajLxXk=;
 b=mRp7A4sCCSHLGPwpKo28Wz/c0NQsZqJnwT/nzKI3KVjNs6UttFsNunfADPI+ZnVWF31Rns+SF74yl/qdXWzaKIYzVZsMu03UZddu/jaNwfBeZ/8OkDFwudjLKLFEzcRt7M2RbFCpVgO7a8muER5pkkN2Pno8ROChNR5ZT6thWhJnsDSs1MeJ/KV8fXr1kgNaAT5KJLlQZt5jmcEDs4ppuIccfptOxQwkdttYbz3PFb5I+Iid2ERTArzT3/qmaA96v1Yv8nMuHtjsmtsTOMVv0m1GtCvvkCyl+zix8KDJHToRUZ+zTURNZyVQNO+zv9/3jzyglyl/rcEWZaJ0qtqweA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB10043.eurprd04.prod.outlook.com (2603:10a6:20b:67f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 21:41:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:41:32 +0000
Date: Wed, 29 Jul 2026 17:41:22 -0400
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
Subject: Re: [PATCH RESEND v9 8/9] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Message-ID: <ampzggsXYEZ34ieJ@lizhi-Precision-Tower-5810>
References: <20260729-qcom-cphy-v9-0-1f8d9fdab037@ixit.cz>
 <20260729-qcom-cphy-v9-8-1f8d9fdab037@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-qcom-cphy-v9-8-1f8d9fdab037@ixit.cz>
X-ClientProxiedBy: SA0PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:806:d3::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8e91ce-4134-4bfc-472f-08deedba279e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|7416014|22082099003|18002099003|4143699003|56012099006|11063799006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info:
 ZwgHHUfrBtd6dmnlh5Q19zbaAZfKR+rf2mM6DLphustPJELln2GeqaHdSTcrDlcZt8Qokxn5UBSDuuunAnFErCehTqK+UeH3VWwk0/Fog6TdNg5Kiu7GZ1XfA6tSLjqNNSgtIOIDyeubXhdFGuSoVBWE6lo8las/kfpG3rUNf54u8uQoafzjEKvwUmkg7cYLpngBIq/6zZr0xs9zX7cf2nF7Zv/PQmB8Ycfox2OOd96BD/UZMmK/ElG64TDMZkMLzLB01s1dbeT+nYE8VP4x87X0qfRZLXKPn+/vAf0L/ToM4PXgt3I2vAfrH6rPccB5rph5tYhow/X75Gxr+W01ummyDxkx8We7ddaC5n7zpV+Zm3WO0oZyI9PPT7VQJLSDLJc7Ya5+JE+VKxfNpPAHJijWCFc0nD5uRNbUHfNVpB4sBF8nDu1ABfe+50XogBoahl6wp9hz6xdUzX8OQiEexsfGATrQEHOEWydJffC0KCoO/O5+zDpNYCQYVOCjnWC4KKkHWAW1zejIY7X8X3kpk9+mZFi9FbDb4Y5M/nLSy4L+g+Iq9qxmCQySd5y+6jMR0JmYYg1GN3NEV6Tl2gLAltZGO1UvOysnYYn2fX6a+dN2JrOxtZ1cQu3KQI0rJtq++sgALNqMMod/GYHnNtODbqB2AeGg7f1zmKbLMkFPNjM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(7416014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?6AAh61QeaKJCAjed7LWT1fq60i2QIJLE3uEVdv1L9paTKw5op0cknNq//1hZ?=
 =?us-ascii?Q?VcE3pNAmCHiORLKesdnJfd6i+fQZwjmAiKF++lvk8JsNmEhXth6scNFIJogg?=
 =?us-ascii?Q?JIBQo6pk4wWlkh5gdvADXhhUcBQKUFMZVsSe4fNw8hvQuQ/sJSyz2QEU/9TA?=
 =?us-ascii?Q?MRxT9pbGJHALl72+/EPpYeB65Tqot52X1NDBAv+E/Et4Hiur3A9F4+e4kiC6?=
 =?us-ascii?Q?lPr5xNP0c74tp6kSlzPHP0UDJrYQyafh8xU8Oi6ygxLCZ7WcGFUdfvSA7nZR?=
 =?us-ascii?Q?43Jd2UCf3lWuRDJSFh+ZrGAvCetOtbPdM+9DF9VcGBr2rH4OrasNrovtnzhG?=
 =?us-ascii?Q?ablgh+9fKdD3iwFK70fD31Rtqla3UKUppLJ1fpHzirnft/Rt9aq1UEtJ9uzR?=
 =?us-ascii?Q?w5JHSJbYb6//l6neVX1OQaFALYgBRamImrJAyyMwpI3rlitu/hmyUKAMa855?=
 =?us-ascii?Q?VQt0/v1ljOFgKX4rJYFT4pKgH+X5L1/D/K0X77vMYu8kMx2Oktgorvyy5+OQ?=
 =?us-ascii?Q?UDd4FL+lpQt6UteP5B5Im4LeuLGyazD21ApoyejiSTNM8rhxhQw+BdBINL1r?=
 =?us-ascii?Q?T5Iwlo6/shBoVK69IZ6sQZoLAqhsbgST+Pnj/9/5kU+Ykt9XZERQi4kgO3Kb?=
 =?us-ascii?Q?2zNkpZjivwjT+ajji9ZCvrA6Ff+VGNo3ulxNRW+BKwPSJue1hgr3wyoognfM?=
 =?us-ascii?Q?7W5+n6q7l/pUI6FvE0/IM/SbwOz8ZRwptdqegGoZFxu2XJu35rW7/rC6+c4J?=
 =?us-ascii?Q?lDiDu2N+ndDT04MJVDtxxE510ZQ/3vdwdhfFudVw9IyPQrbaMQN32sbZXbQX?=
 =?us-ascii?Q?qbvbHy0RkKer1Z8waGV8rSC449K1alOsRESZ/aZX6SZbu9WFcTFdoVqPiDUg?=
 =?us-ascii?Q?tBQ3L0KaiM58y27tE24pACLKVnjHDy0UBMtHHA4FaUcUacVVe9aJDn7FLagz?=
 =?us-ascii?Q?T5vkF0phi/o4sYKfQe6t+UhVwVBgHwvbekUgLjki6OTtWI4bFRQn/39vXyk1?=
 =?us-ascii?Q?5mskjkzm5dxXBx1s3ISkpWyWSjrb+8hWzlwiafL1NwuXkUKozOI5kn6IfR2B?=
 =?us-ascii?Q?hviP8NC+76oIHARhLwg7+qV2wrW4AB4Ge+fhETQ6icQttDQLa1sRZL0M+PSV?=
 =?us-ascii?Q?D3QONarIwjCJlv/dNswVZ1ujBpJ+zrx1l/6PqA4+QkFQP8l7OoTDhkIJEyqc?=
 =?us-ascii?Q?k2dB+bEB/4mfSgPO2VQvO5LN9/ZoGLfWfCi4FHq7tuS3kMrCSBMoDCEWKVo3?=
 =?us-ascii?Q?6QRNpCfEd7dPIKwiJWqu8Gds8IO67w1OLuawaAD2pf2NEiU2hvyFaV903Oox?=
 =?us-ascii?Q?ceeYJZzt3aPJ1srexbdRGWrWWXFFoFpcHB3WvMjIzmaTbYe19SZljuwrcNZy?=
 =?us-ascii?Q?aig9JBF8ZUsRF7yCP6Fu3gI+lFf88W007ym8TZWi9PRZeKSBcvpNPszzXa8z?=
 =?us-ascii?Q?FAlprbxu2lOIJ1ZisGXqN1wyHwowOhl23zjGhidN4PEGCRBLW/UWsWvujtZt?=
 =?us-ascii?Q?gV5Uw/Q4VQiC6yVGlk2mwE2sCsiQg5d07p2T/BSEkR2vCDJ5OmDq/YoIf37L?=
 =?us-ascii?Q?wiRtoHvmdGfx6fN+Ojg1KGNCkd1NVmQBSBvfMJ6noTthtJlI8/Rqju5rIud6?=
 =?us-ascii?Q?CtLqoiyQjm3n4TAaUuBcJtNWbeubYyYzzVx2SSz7fiNJyuXhcflFEGKR3EMp?=
 =?us-ascii?Q?xluLM/Ihkn13J9/ES7sgj6ORrksrzcb9c0sYqwli2fC/yae7+PGzlpJBaTLz?=
 =?us-ascii?Q?U0VyagdOvHZjc5FAs4lELY/zqZ7ScfHYXyLvxEH5VpA8wZ0sBB4U?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8e91ce-4134-4bfc-472f-08deedba279e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:41:31.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrHYf8tsjSiUtlouovGmWrA0ujiS1bGEaz+Dwgn2QSp/AtKhR2bimfX/t/QApuJMbnh9bUNSJ0YugRsYQrKD6zvOTorKbI/jCy5Uet93ZMhdxgFvVuKBDtszpGRfIXoG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10043

On Wed, Jul 29, 2026 at 10:20:03PM +0200, David Heidelberg wrote:
> Ensure that the link frequency divider correctly accounts for C-PHY
> operation. The divider differs between D-PHY and C-PHY, as described
> in the MIPI CSI-2 specification.
>
> For more details, see:
> https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
>
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Link: https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c   |  6 ++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++++--
>  drivers/media/platform/qcom/camss/camss.c        | 15 +++++++++++++--
>  drivers/media/platform/qcom/camss/camss.h        |  2 +-
>  4 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index bcc34ac9dd212..c8cb6f1a3d3bc 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -535,24 +535,26 @@ const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info
>  /*
>   * csid_set_clock_rates - Calculate and set clock rates on CSID module
>   * @csiphy: CSID device
>   */
>  static int csid_set_clock_rates(struct csid_device *csid)
>  {
>  	struct device *dev = csid->camss->dev;
>  	const struct csid_format_info *fmt;
> +	const bool cphy = (csid->phy.phy_sel == CSID_PHY_SEL_CPHY);
> +
>  	s64 link_freq;
>  	int i, j;
>  	int ret;
>
>  	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
>  				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
> -	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
> -					csid->phy.lane_cnt);
> +
> +	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp, csid->phy.lane_cnt, cphy);
>  	if (link_freq < 0)
>  		link_freq = 0;
>
>  	for (i = 0; i < csid->nclocks; i++) {
>  		struct camss_clock *clock = &csid->clock[i];
>
>  		if (!strcmp(clock->name, "csi0") ||
>  		    !strcmp(clock->name, "csi1") ||
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b608..a136cd27880a6 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -139,18 +139,19 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>  	struct device *dev = csiphy->camss->dev;
>  	s64 link_freq;
>  	int i, j;
>  	int ret;
>
>  	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>  				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>  	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
> +	const bool cphy = (csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY);
>
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
>  	if (link_freq < 0)
>  		link_freq  = 0;
>
>  	for (i = 0; i < csiphy->nclocks; i++) {
>  		struct camss_clock *clock = &csiphy->clock[i];
>
>  		if (csiphy->rate_set[i]) {
>  			u64 min_rate = link_freq / 4;
> @@ -265,19 +266,20 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
>  static int csiphy_stream_on(struct csiphy_device *csiphy)
>  {
>  	struct csiphy_config *cfg = &csiphy->cfg;
>  	s64 link_freq;
>  	u8 lane_mask = csiphy->res->hw_ops->get_lane_mask(&cfg->csi2->lane_cfg);
>  	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>  				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>  	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
> +	const bool cphy = (csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY);
>  	u8 val;
>
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
>
>  	if (link_freq < 0) {
>  		dev_err(csiphy->camss->dev,
>  			"Cannot get CSI2 transmitter's link frequency\n");
>  		return -EINVAL;
>  	}
>
>  	if (csiphy->base_clk_mux) {
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 072c428e25166..66171069057f8 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -27,16 +27,24 @@
>  #include <media/v4l2-mc.h>
>  #include <media/v4l2-fwnode.h>
>
>  #include "camss.h"
>
>  #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
>  #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
>
> +/*
> + * C-PHY encodes data by 16/7 ~ 2.28 bits/symbol
> + * D-PHY doesn't encode data, thus 16/16 = 1 b/s
> + */
> +#define CAMSS_COMMON_PHY_DIVIDENT 16
> +#define CAMSS_CPHY_DIVISOR 7
> +#define CAMSS_DPHY_DIVISOR 16
> +
>  static const struct parent_dev_ops vfe_parent_dev_ops;
>
>  static const struct camss_subdev_resources csiphy_res_8x16[] = {
>  	/* CSIPHY0 */
>  	{
>  		.regulators = {},
>  		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer" },
>  		.clock_rate = { { 0 },
> @@ -4619,29 +4627,32 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
>  	}
>  }
>
>  /**
>   * camss_get_link_freq - Get link frequency from sensor
>   * @entity: Media entity in the current pipeline
>   * @bpp: Number of bits per pixel for the current format
>   * @lanes: Number of lanes in the link to the sensor
> + * @cphy: If C-PHY encoding is used.
>   *
>   * Return link frequency on success or a negative error code otherwise
>   */
>  s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes)
> +			unsigned int lanes, const bool cphy)

you change this function argument, can you direct pass down csiphy instead
entity

so move
const bool cphy = (csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY);

into this help function,

to avoid dupicate such logic everywhere.

Frank
>  {
>  	struct media_pad *sensor_pad;
> +	unsigned int div = lanes * 2 * (cphy ? CAMSS_CPHY_DIVISOR :
> +					       CAMSS_DPHY_DIVISOR);
>
>  	sensor_pad = camss_find_sensor_pad(entity);
>  	if (!sensor_pad)
>  		return -ENODEV;
>
> -	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
> +	return v4l2_get_link_freq(sensor_pad, CAMSS_COMMON_PHY_DIVIDENT * bpp, div);
>  }
>
>  /*
>   * camss_get_pixel_clock - Get pixel clock rate from sensor
>   * @entity: Media entity in the current pipeline
>   * @pixel_clock: Received pixel clock value
>   *
>   * Return 0 on success or a negative error code otherwise
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 93d691c8ac63b..12b14ba8fcec3 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -164,17 +164,17 @@ struct parent_dev_ops {
>  };
>
>  void camss_add_clock_margin(u64 *rate);
>  int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>  			struct device *dev);
>  void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>  struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
>  s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes);
> +			unsigned int lanes, const bool cphy);
>  int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>  int camss_pm_domain_on(struct camss *camss, int id);
>  void camss_pm_domain_off(struct camss *camss, int id);
>  int camss_vfe_get(struct camss *camss, int id);
>  void camss_vfe_put(struct camss *camss, int id);
>  void camss_delete(struct camss *camss);
>  void camss_buf_done(struct camss *camss, int hw_id, int port_id);
>  void camss_reg_update(struct camss *camss, int hw_id,
>
> --
> 2.53.0
>
