Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011030.outbound.protection.outlook.com [52.101.65.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65302408028;
	Wed, 29 Jul 2026 21:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785360390; cv=fail; b=VGE1wWafwrzwKY0LwcqN4uzDdVL1PbUHQyCdsa9xsBJOyJlqpTkw2ohEx68O8hZi0EqLHHFqvI3ITOzdVVOKabCvWJJ5tZhWrsGxOKk0JhLkp4O3DfXYp2sIBKYKFqmMFLxuH7BJPlTRX0dDdSyTi1mvo/fOn/mH8WpdNabjV4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785360390; c=relaxed/simple;
	bh=Ndv0/ER2iz0tmRbEtvkY2EtQMlTitjpU0f5fz+LlUJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dgZe2X3FxTgzaYE8yUmM550he+hqBaeAeQESv0LNY6jdCybWIxVhz8k/ddWvJTlF7MJ4unQBB9YLM2+nz9PkVM8U7yIvAT/9aqDx1rZCESd+Y815VOOldNu1Oq8LciYNBUEV54GvMaALZ8hTkS3Zz5Q4c924uEbXpW5BWElpid4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kKzjIzQ+; arc=fail smtp.client-ip=52.101.65.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kKzjIzQ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWgzv/njU8d72cGYsl9jFiF7g6uIZhG5deWyPDWIj/NMlEN7IrwjPVIKUZfXNhr8kbGHvCOOAzbLM9maMBzjI7hJBJhipqv8zpiTGCYiLPj52uPvltxB6MCq5v5ds5ctnyadjjNiThBt1+/nljP1V8rKo8gQZTfd1/5ta2ArmVpjWXehQdAo9Fm3GcjyP1g61vGqQUG7uPNNBIlMm1/2y6ZpNjUG2e+zvLAfZXMr6fZL0QxKc/GJoLsMtd6rMLGhJh630TcmANk4FB0StDRw8akrQm6aJvd5qrQhMREPbk/c+7TA1pWx80Re9y+MehnoDWyUGJkik50kuCjiCJJmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BB+jQZ0Y1ghTF0GuCJx+JKLDa6jKygtErn2RX7jnU0=;
 b=vz6oNMuWr/ibdJsEOkoUY0+9ItFeGAlJebL6qfP72NsuLozdBrTM7t+5VuKd5uJ6RclwofF0Z+4mpHyOjf70utm/YLmxAQmz/+zW+v4jDIYWor4cPEEjxXADeyXCagmE+3N11fmCUQSVUi6wdCVE6Kx57S1W2sIjFccNo0pmMOBBwlQlyos2anPwuUsb2OpQd5vA4sQ5j1lB5/e06JtlxdOWWqlirvIckIpGBNrucQTjkmcUrRm2ClXW8OG/fK5bzvXEGjxsvtz+PtUjsf7S1WH5ZHbsDDkEgVSocYH8UtKzzh2Xt3fLB8KwPaz/2mshXZCV3odMon58HIsVbJDorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BB+jQZ0Y1ghTF0GuCJx+JKLDa6jKygtErn2RX7jnU0=;
 b=kKzjIzQ+lEqXuaEt5aS8RjMQ/aylbkxIus7v7++u5V5PSkaP+PC5fuf8uNW1SUkSbRyQ9yqhM59hrWONKSz4MN2K/j8+brSeLLfq+STFx57+h6qeeauW3BtNmzYhh94lDZ9xf9Xy3zfwkFHqvfRzTJquBHADZJpCEaQLjxh7/RMVeBfkuWrK91+QdlLRKIxDYULtCxKo1+4rsoSzFFlRHT7W17rUu5pGX4eTUEKHkVv3YUVQHmzfsZrJj2+VYyIe2E/Cj429HwM6ALe6YHcqzJypIR8r40Aaffio6QH4cNq9xiakjGpi/WXe4lyK7tdvJdwVQ1baKPcCrM+Of9MBMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10730.eurprd04.prod.outlook.com (2603:10a6:150:219::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 21:26:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:26:22 +0000
Date: Wed, 29 Jul 2026 17:26:10 -0400
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
Subject: Re: [PATCH RESEND v9 1/9] media: qcom: camss: csiphy-3ph: Fix lane
 mask calculation
Message-ID: <ampv8sY6-jKnuBbf@lizhi-Precision-Tower-5810>
References: <20260729-qcom-cphy-v9-0-1f8d9fdab037@ixit.cz>
 <20260729-qcom-cphy-v9-1-1f8d9fdab037@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-qcom-cphy-v9-1-1f8d9fdab037@ixit.cz>
X-ClientProxiedBy: PH8PR22CA0017.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10730:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1208d1-845b-4ab6-0028-08deedb80956
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|19092799006|376014|366016|23010399003|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 yeYK5+sYvRwwSrG2+Cqof6LdjTFm8XeBB9hz17NZAGWQMCJNDmFsng0YykUM2tkzHnRvJCCKq9vfbpl6OuuNjQlzLnrQBXUwJd63uy+AQT/zxLlTAMrPxZh+0z9kmlMwtMPqnE0DrzENuYrgqqrMBaxO/WxONrhLeWchP5KW8Dm1+X41vXHCaPF4lRTDmXL8hL3yIfWPOFW4UB63iXdhqwzYaY5y5sOVWWCi/E4ZQ6be4rMbtFja0guJGF/UXJEENHUeeTcrIRfRHEv4NHAAl9StqYxpxz37QPFSb5KQhxL2w0eXIbDGsbUkNBazZ7gcymdakRthD+oIxZRi2MMLUrhFU5U9hVeShkZZyIe3Yvb7nxDkVmqzMqc1jAdZ5SQ8aOVHXk++5xbeiZC9n34JtUF+w9dQk5rQjCfrAmYDM6bAg3DCfosnJ6PLQ8kOGDdy50JAQONpezxvudD6maTA3oDgb1la8VG0vNsSNCM3CpzBrjhAKtkoif/BrR3q3zBIRexj/sSBTUIW2BfsMDXLhm9kIqTaBURvFzJ6jop0gWJNo0A/HtSscHG87RQQdFWKOqymnWQ5cyC2kdrh87yBvO8HQw/AjNBMZpipJ4NFUGA1Pk/Zksl2KI0XXQGnXv2Kce+qS8rh+nuDNXJK9P0aNRrszJek5Ma7IETVFOCnNN0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(376014)(366016)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?oEM/APu2k+YPydzqiyyi4SgDG1FIFw3qadZkQ0DxzJFDQQ5L2Fk4Ojb/heuv?=
 =?us-ascii?Q?BeIBoXYgdgW85KGEZh9lC2LzXeGXWufo+lxyVBNAYUYZ91JBDu8yrx7xw/7q?=
 =?us-ascii?Q?mvHi8wPyHBrwzcXiiGVvWymLCpeNBPjuec+io5cIMb4jbi/w3aMXcafOfWeC?=
 =?us-ascii?Q?S239xm9p7OaKfqqFe8yqWszBNnT579yeKfjyT7gFTzmxYZNw29O8HN7uBaGb?=
 =?us-ascii?Q?dqFiuAlK4cydX4S6QSzPN6QJ75iRg6OvIDDML/bccAD2ppByGlZ2fWF6UAR2?=
 =?us-ascii?Q?Qp3k8Njq7NpQnQJo7Xz9Yr0RNxTCfE96twigghuBrRjcW7eOZq9x7a1CC2bx?=
 =?us-ascii?Q?B1Dqfj0OZNytftzsQ+5y6Qy6KKLy2BcUTr/QUMLhfv4LN/rali/8ixXubb0i?=
 =?us-ascii?Q?J1yohzAWIJdKgvc6E1+UaRdM0ZUPW2PbF327tNhiO/yoOOiOENGalU7agefq?=
 =?us-ascii?Q?7pxvf9bLNuaLDzsNETpSQ8iGOGtYLRMnFcnAHluZjdUk9MZck4Ut1WN3E7sQ?=
 =?us-ascii?Q?cg5sjJaz2kaNvkLHkN/gPXUIWHGpNkC53cmjtFsYLZaXPmuYOiPnPjNm6Kxc?=
 =?us-ascii?Q?A0LSyBYgvnaMJ5xaH8SIyyBvMA2X2aFS6rd51Zib79iKJv02o/heYNxyi3TO?=
 =?us-ascii?Q?ILmTD24zKlG0fdh4K9p0FgRqlOzTUSlJc5ziyDQgB9bkQvjblEI+o90TLv6o?=
 =?us-ascii?Q?lIVuMr4Ooviqrs+8/NzVPpz0/1KCsFOkArfpiuMDj3Z01yMr9n0n43d+iujC?=
 =?us-ascii?Q?FnLB9GvRt9nrqKZ/Egihr/CTHMcPROsRTSuav57LLcZ1U6AAHp81opIpKHYs?=
 =?us-ascii?Q?NOctOFWw79njXrRJTqclIenPncOqoKamrl/q3uFdZYzVC1hIGfbG3I5JzFwy?=
 =?us-ascii?Q?I+m0/NtYI0rvSDRYaoDHc2oNBr19+PJIOy4WAPZHi/2ZcTro+9lIf1DCqxao?=
 =?us-ascii?Q?Y3wpeYN1zMWb4QMv17zobuNpZpcTxRX3UdybW+qzEz8mT+lmZuv94VwoEi9P?=
 =?us-ascii?Q?hnsnuv4rEQapqcQtxQOFq0n+f3rreq4S360PexVAJWr5O5tdrle0N6U6Hd/h?=
 =?us-ascii?Q?dXtdmubnH6ytBdwcV+HPnnkXhEsNPnRYGvZB+l2EHz1cUdc1YJc9QvZiWTJB?=
 =?us-ascii?Q?0BGnYVJirdc+a+FBfb/sXgqfpstyDpWW1UcfjBgH3GLqfPsMoWYQbOPC4qdy?=
 =?us-ascii?Q?HnGiUi8uMtRWmoyxY0wFmV4rh1wYJ2xhYfmF/FQbNwsygGbIG0w1hGKUro7N?=
 =?us-ascii?Q?T3m2EHKjQUNCzLXjG2MO2SjOlPbFoKn8zIvchql/ZX0Df3EX40sjjuIgVU/K?=
 =?us-ascii?Q?tKcQwAPQIe7K6uXuKVqv8fgQCjy+hVig7oU78D1IPqQkFIu1AFK823Nedtbf?=
 =?us-ascii?Q?ke1mwg2c2gm/lwfF2Zn4nOFd563cQMyH2SHg4pQMggb4ec9+Er6FgmtBlIdW?=
 =?us-ascii?Q?Gj1gZ1snfkS7NMiX/0znd5v3nqbFnQG+gMI3u3ax3hH1accy8mixtEA+jbb7?=
 =?us-ascii?Q?BT20qVKc1XXBmILVl2J+zJLagXF25L9KkQjBL8cqG31Hqx5dBva+J2TPqUXT?=
 =?us-ascii?Q?ScX5RuzZ0k5YDSXMb/71Dkgtnq7ZG4XWDmWv0tSTRZVeVihCePKku6d61b9p?=
 =?us-ascii?Q?3/Nz1Pzz1+ZX0m3eznM9bRie0Z+zzovJKryvd9sffuIFoV5gI/K8AFUoYgvX?=
 =?us-ascii?Q?Ws5h+pYI/4CplRWV3y7eRRta24BWLGnNXErNxS9KrDDOsD4PL7oYXPJ3dCEk?=
 =?us-ascii?Q?+IPm/uGYyrZzC6ybvLa4auOpnxP9RYKxjkWnhLmPhfWzQBzWd6iG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1208d1-845b-4ab6-0028-08deedb80956
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:26:22.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTOigu2Q1l88U8q4mj3VyuGw1Lqzi2OHR5HdVgmzUioCqJt6a+wpbjk6eTMfxbbsspF9gYD2IAHhIsn8ZSQTYzxRqwM95K+xpB9Dz4kPLIg6mcG2qJZMaJ8Vsh6lnd0c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10730

On Wed, Jul 29, 2026 at 10:19:56PM +0200, David Heidelberg wrote:
> The lane mask must be multiplied by 2, but this was accidentally omitted.
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Suggested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf7995..7c8c0e41bc62f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1114,17 +1114,17 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>  static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>  {
>  	u8 lane_mask;
>  	int i;
>
>  	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>
>  	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +		lane_mask |= BIT(lane_cfg->data[i].pos * 2);
>
>  	return lane_mask;
>  }
>
>  static bool csiphy_is_gen2(u32 version)
>  {
>  	bool ret = false;
>
>
> --
> 2.53.0
>
