Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011023.outbound.protection.outlook.com [40.107.130.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA073C343C;
	Wed, 29 Jul 2026 21:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361038; cv=fail; b=Gb7vjZshyBdwKdKH2vnvS7I8X/+JYa3ip9xpjOu7IXyJqtYS5W5VlhfJvKFlGIGzVLxea2WeeKSeW+/ckojR+VYYclLtBMRaUZMY8GKWHc3dhao84KlGkO6H1nle1sU/KweZeHunhSAxdOwHOuG4L0Jjhl0O4rJ3zwRtLkClL+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361038; c=relaxed/simple;
	bh=ZuBlp+7xil+Htgy03PRm488ZBfpapS+nYhBMYL7DOdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vEBHcBveWU9LEMDpsFcing4ddR0ka6vtHu1aL2sZ0pUnMIbvQAGbJk8m4e7tSdNX6bxObpY/rIGXvP1MgdsvWuj33HGlAegTw41TCiT2SLDFo5DZPBn+3lNlRNoyaHDlLA0ZTj7G0sLxonykJmFVZiFy9UvU2k3j2lVy8zAZpkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wYraytnX; arc=fail smtp.client-ip=40.107.130.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wYraytnX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulcePyhlAty7IJMjOLI0QcDeJaGzFF/TCYyiCq2WrAOCTEFCnqoaX3l8VS/IQ0Y1vPpaLR328m4H0+OFjh3v/zlu0pXSUE11rAeMZ8HXkquTahFTnEKyYd1Aqxg0d+C65kj5W4g+lJfW2V6X/qa0RwcLtp3Po0cQSf20m0ce9dciatwKnNJyxdKh2LMAERwTo/2n3sgI+sJdryVhxPbtPbMRAmow3AXrSwS5jVVz8Ef7ss0wi2hlToPbNCFbKZh3AYijydkeII1Vii8eIReP1K8tO+PH5MMctgQGcqPGFhu3l3tVgeXu5OW0ZvDFgsAg/YnkG09mB4FUTIF98fTkjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbRemnZ8I2bqxdHbvW7FasGzF9qrbIsvq1mMdvqWDLk=;
 b=p+1bsjLZ42sleAUtcxyeT8lryQhRmINwCmHqgmo99ARo/jlksoQFszOD4JY+WHw4qFEYaQZbkN5UylESym+dv0EjbQnw7EWJp6lWUpG0vMBH9IKm66I3GOGq/cRBTn5vKVEDHYXq7TIEjmVmAWfQ6Ds86X/uvAiYykWjut4y4alFRALEUOy6DViS08J0jtb21xZX7ruAmRCROzFGdqWzjUN8ZdaEkrXI2A/FNAPv7rLULV4hcd2g9rq/ceNXr77FTx3nAeX/QBxTY0yfKqbek3tGrah1ckZ0N1NljYYp+M+QyTEd32GOFKrRnSdy0Mh6QHugKBRHC0K9rOnFBFV2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbRemnZ8I2bqxdHbvW7FasGzF9qrbIsvq1mMdvqWDLk=;
 b=wYraytnXqcSNTG0rMIlv/8GZC56QUA+HxP8c4U6tuSz04KbPrts2Hw9quygK1TIP2iHPGTdMI9PYo+fal9aDzynQB/FXcGfngsp5Q9sMq0nfAW8Hg6EfaPi6zVqFsBg8OCZl/bDUAjP1ByYFg7HjiPYy+yKS1Azq3Ar/gQm47H40yZVcJQzjHyoBdNQuao++fer5LKpS8t6N42ywmjaQi/sL4nlBmLOJYU2pf/I6GdSlMI6pBNJL95+aaFeNZYiliYWGNcYGgN00tB0um3AItMWRGAu3p+UnhcuMuVHqfQ+IVuSseGD7n6T+8eVbiR4nsnvp/2AYpVYlSnvEtK0EAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8586.eurprd04.prod.outlook.com (2603:10a6:20b:439::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 21:37:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:37:13 +0000
Date: Wed, 29 Jul 2026 17:37:02 -0400
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
Subject: Re: [PATCH RESEND v9 7/9] media: qcom: camss: csiphy-3ph: Update
 Gen2 v1.1 MIPI CSI-2 C-PHY init
Message-ID: <ampyfquk7cH3oq1L@lizhi-Precision-Tower-5810>
References: <20260729-qcom-cphy-v9-0-1f8d9fdab037@ixit.cz>
 <20260729-qcom-cphy-v9-7-1f8d9fdab037@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-qcom-cphy-v9-7-1f8d9fdab037@ixit.cz>
X-ClientProxiedBy: PH1PEPF000132E4.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef068ef-8640-4171-940c-08deedb98d8c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|7416014|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 eIEJgKi+Ef2KwBqOuRA16+zkcCovEWtgbK/oXF+Jyz6xTh4DEldLtf2gdw89gixlez35AiDBlMR5ZN1ZRmKgCUqMkWU13PcWFaEnQd34DVx0omBj9kegkZXyIbQ74guaxNRNujqQNk1p9E9vrEyurNseIVzIymHurDi/bwIBK0485VPukjOfqIrVTjpsDeOazccOCToXm6B67lHxWqqIB/CA06IUGo8C5uHIY1bm4HEZyvyOzzLS7i5MHq3zU95m/7uhhclzfEK1OXZiXG1f51d24LlzQx3ScG+c4WjaTBI4peeft5zuRrmMyx8ihcqKSkA3hHACRMigN6eKmSAeY6z7n5U9H/XhOEtleEBsQJV2SSezXTpIHRuBKDJ+XBJJXqQViYGjJAYoAb6zklSk8ctNW0Q4HrrJOWlAatqlGmXQLFuvp8v+5/7FLkiD9Vm5yfW/RR8S4S7Bhue4WftKaeFg51K/UXpIVMBKWiAm4Mhf9Ln+SmMfA8vVF8DZVneN6DRdZhj63PstRUMlC093NT849RDGXZhheko8IyzNQudaERBqTRFMbHpQ5EQluPxuB64IIZ9wbfQ2qkml+qPw4TnH936crA46HxDklTLkfZU4uC5d9wm2ONnn5Xbug2300IvvPGD944swooQpRSDRZAEoGf6JL6sR36SZ/sU+RCQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(7416014)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?u9vRiSMZae1B6NBTPo8vU+A9bKvmXujSiy/cHfzIjglW20aR3/kxu+TsCPfv?=
 =?us-ascii?Q?rUZbH9GdoIMapvgzmZ/gQIFOBibgjl1Mpoz/Km/DO9Ih8kA4mwzbKvSgYH1X?=
 =?us-ascii?Q?aTV0bZqUQeHB1PE2Tpf+aCwQWSMmBACYtzTdz8Ttr3JhAqLG+LbS9clOVYR8?=
 =?us-ascii?Q?C7BL81kFzmiHjDSbRq30g6HhDKe7yJxl7hm1GCmO5BYf4r18gbbNdluItJc2?=
 =?us-ascii?Q?8QEmmRhuh+r/ZQBXnB7M2kxon7tpZCv4smIiSfG1lRi1dNsjtJzvZzN0mqdT?=
 =?us-ascii?Q?OKqKaocyQieIJOtblq7v5Rkd7H3rBGmLp19yherT18A0Al+Wt1ZYhOfbslcG?=
 =?us-ascii?Q?tYxNNzTFVCQzOCqX3rLnQxuvU9s+glwNK/83Um9q5e+2Y96sdW/peGz6iB/i?=
 =?us-ascii?Q?PFIqyPIErO73EfwQdpPM+uyZn1nUAHI0DL3BBdVPEnr2YuqE92qkBb61Bu6a?=
 =?us-ascii?Q?jJAOyZOt8+BUN0cq1QbpjXybLj2+B42NaTJ/JM2XUoeDN5V302ZhfCdGvfuU?=
 =?us-ascii?Q?JtpOieG66jKNzVbZd6G2uE9NZ21NtzkdneJbMCaQArVtn4Do4XSlrmbN6DIr?=
 =?us-ascii?Q?+IDfQzJPph6LES8dXpJVIcHiOaBgv6pjjgAV8DP1Rl5P4ayfZq8WjiKL8+7p?=
 =?us-ascii?Q?4diYwvmnnpxfCy2hiYrSolOMOjnU3HYeaQeSUN4m5DYEBKNp6RqREwQIqal1?=
 =?us-ascii?Q?FeD3ZEMO0IpUQivxlCWVBR3xAP3qnvjV0qSFnv26fXMzaVjQ0/yORpMpA/cS?=
 =?us-ascii?Q?KQX4bD0Z4mIGRQftGBJDWTTKIz+bIDjJI9cYxMx2XxWY250XBXRIcQaWKY7T?=
 =?us-ascii?Q?jXQUtyil7o8PHXxWAVSCL5cErx5KD3QoLRXmTBL9zTXJLUZ/GPgYN4SSdHbt?=
 =?us-ascii?Q?ojJiQHN/G6lOF35e95vdzRxp9S1YMtPt/3SDfLWSw01Gzz2zFOIG42lA6doN?=
 =?us-ascii?Q?SDwFdgqWqjG3crSWJAiyhapORYhGz+qBKis/jtR9Q5rxVPMGOYQ573IO2Bjk?=
 =?us-ascii?Q?fewCZWBiZvWEa/I+9+uvngPrHmfcBuToGzbFuNA/VoQV/vB17jIQSNxZQDze?=
 =?us-ascii?Q?DPeLdQ2p4ic1iZByGgi5Fyrv+4EqSwExOge9u1Tbl4yuvUBLP9W0+nWdP7Xl?=
 =?us-ascii?Q?owmXxx896JyRRI3SDrLr4G+VzudhChXKEZ7McSHSrv2pVS6gmb7P4IbSmszD?=
 =?us-ascii?Q?bhNImhr59g4hrC2LZUEMGzjuPH0EJoCm5vwpAOEXAj+CGJfhKW4zq9V8oX0A?=
 =?us-ascii?Q?fzxWEQTq0H3k8LYUgH8BItayXEtYr+TbDEuVpDiRuWqm/kxEbH/WYDcH6B8f?=
 =?us-ascii?Q?sTFFgtlVdK2kcc+ZqYUDj4RSpVkpG/S6muDH3LPzyoTuV3Mm45TIYDjKUdkf?=
 =?us-ascii?Q?pjita3SeA229SpZzjAhKrAyq6tBrDIgrMoewmu4s/Y8sc6EcoOcHEHYXOE6p?=
 =?us-ascii?Q?yln3r1VVL470XHK8LDuAJAgmnXFQ3kRylRRkF4DZTTycCJejC/SSMsmPZgXd?=
 =?us-ascii?Q?M7GDCUwME6cXtF8XJWAWp81IR35hdS0Mkew0VVA6uazxN6BlkWusG4gM49E9?=
 =?us-ascii?Q?sZU8jaxJVoKIyEEcIckc9HjOkG1CItP5aKSRAmMBMjPYj/8MAm8zIo5E7k+P?=
 =?us-ascii?Q?jWFec0gXvO1DEgXO/nk6dIW5WbIE/TJMWxQMUfwU4F65uz0kFkqdG/hDAkE7?=
 =?us-ascii?Q?PnumXVFqEDh+FRWaHVD18Dk1IUX6y0DkRhS5FzfZuaqjIXFJ4FGAzuF1/VJz?=
 =?us-ascii?Q?gPoibo/FfiLbPc46v8utGsxYtO7o/ik8AWjv37/p8HDyIet7Twbi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef068ef-8640-4171-940c-08deedb98d8c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:37:13.4297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qlwqhBtkrxS/5QgS/PoF58Xgqk1dRWx6raw13Sn2loBa6AdPSFiEISj+uA6BKP82Ocqww1tAN3xmJAhebacft1RZPo9ioUtPBSX/dkUgqgLNRdbnnPMFr2bXQbF8HyJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8586

On Wed, Jul 29, 2026 at 10:20:02PM +0200, David Heidelberg wrote:
> These values should improve C-PHY behaviour. Should match most recent
> Qualcomm code.

Any reference? where recent Qualcomm code? do you know the real reason?

Frank

>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c  | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 83de89a88dbb1..25a3554ef2016 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -227,19 +227,19 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>  	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>  };
>
>  /* GEN2 1.0 3PH */
>  /* 3 entries: 3 lanes (C-PHY) */
>  static const struct
>  csiphy_lane_regs lane_regs_sdm845_3ph[] = {
> -	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(6),  0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> @@ -247,19 +247,19 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(17), 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>
> -	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(23), 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(26), 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(27), 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(6),  0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> @@ -267,36 +267,35 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(17), 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>
> -	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(23), 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(26), 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(27), 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(6),  0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(9),  0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(17), 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
> -
>  };
>
>  /* GEN2 1.1 2PH */
>  static const struct
>  csiphy_lane_regs lane_regs_sc8280xp[] = {
>  	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>  	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>
> --
> 2.53.0
>
