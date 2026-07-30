Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3B13FB07E;
	Thu, 30 Jul 2026 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403143; cv=fail; b=LvUeO5cNIhIk4KmjNwjmNRWkzS6GDp1yfArqE7NzaXu98v8h17NjR+p5xsTrRTsRY8rx0aw7EUWsRkKIK/uSzyUbFIDKVDak0PhXzaL7Cud6W3RvYMgkYyyKnwtN1/mQFvhXUXhNljABczm2k09qD18CH+pRZ7eQYCQuqWZuDoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403143; c=relaxed/simple;
	bh=u/YZ1sYfZ68KxwIUYp+VhWHpRBxdg/EJtddya4iNPXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFXUUpcSxg3CLkX4AZfIH/elTLvQVp6G1JPq2AFtPTZmV0XSNJ001A7aRyhR3QZXlA2v2UzcngAF5mhquOlKy8R5G8I+/vRmJsmRoa0JVRHCRLviYpbSRqAh9xXLjDiadkmikZ/bKfsPETifbLvnJPZohqkzM8tqcRNTuGYydYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Vkn3KKeG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=txCFOcB7; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Vkn3KKeG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="txCFOcB7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8phN0986552;
	Thu, 30 Jul 2026 04:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=6OVRqDuR1EgT1V0Y57bwruZTq9hHjiVXIKrb6AfTyH4=; b=
	Vkn3KKeGEzj9/41hY4pKX3HRAskrHLD2qKOlRa5yG3H6AfpA4fP2Sz1OPGElPwSt
	LjgfzklaGRC91Zfq5HUq2k/AIoDa2AV9PeD/HqaSrHKnfdq5Ll3kce0EcPqIJEGM
	dXg0fqW4yKktBnZlG7DZQcCY8nGfaOcYeuukg2zS4sB77LdbCpHpTNJ1yoJ+ONt9
	vYxGmOrELafCNFUyz8H9rUu2tl1Bkln7pKGVPiYnMOfeVPDFQn6PrQSM6R8sVcPx
	EPDBwglR9oZoSUSY0tNHXNaOwWfTkXmAFRnMHJ5U2V0+qx540FZ23vXW7zYeuH4z
	wKfKfud2OqU++NUngCT3ow==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022112.outbound.protection.outlook.com [52.101.43.112])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fr3f9r14d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 04:18:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkDoa9oadYu1PquSAQzdSVl+v6T8y/+7AdxuIlTkhoO+62jOElgbZS5aWXrHEeteXYZFJx9ch2vjmnsWFgh127A7XINozROR0zxrCn7cKCvtDxUD+JwbBMgyjy9TUeEmvz4PJk3WwZXQf/z7rOHPN1Y05LJuSzXdiP9CyZrDaQzEPZVseXNNhrOBzUUrCw4zl9s1pybID8mvcX/lDpHvjNxHJWMvdht9qBey8dnNR0c/ygkK2zYlZD2H+IzID6zmSUa1z3FfWP1nTCekHHPDkJ9FLOtrt85T6Zw+p3cXkR8JKmmEnsLJFR0UbB9Gbi9+RxEh69ymepqGqgRhIM4nDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OVRqDuR1EgT1V0Y57bwruZTq9hHjiVXIKrb6AfTyH4=;
 b=G4cCXPW2LVy9MqzwqZ8Extjhx4ZSS7d1pKH4m70HmduCZ0SUcwFKaQG3EceA++qYv66n6dUzkecW7CrTYfHj2gCEmRrM1BKO9vJWodDc0BFl4niJiQoulnqAiy7pocu4uql+uEwAJLrYOjEi9HizTH1JWtgDHm+gnccR889Bx8yk3qNNCZ/qb6S4051eDUGG/fDkw3aJlbgO8WioXcVwIgNGEWts66BtsQH43YJkBU8ar2T2WPlOfUiCob0BgIZv1f23vQqCa/U2008mqSnUhLkA5HxfcDYWkJqO74CJsfhev8T8mTZL2x2byAzv58mFA20f0kUCJuYzWg7ZsvesbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OVRqDuR1EgT1V0Y57bwruZTq9hHjiVXIKrb6AfTyH4=;
 b=txCFOcB7NqtIKV9xKAFOUUbFhBgSsA1X/FR/s6XrO99rbdU51OxMyIcLN0pY8SykV8J/UM8wRlu+i5W1IwjI+WFoqpK5rTBXjjlhlXCf0f1JB/WfnGB/cWsF/xAUwV6Ey58QX1xlAZySW1AQSRnLVqV8Wy8NghFhblx26qbY5lw=
Received: from SA9PR10CA0016.namprd10.prod.outlook.com (2603:10b6:806:a7::21)
 by CH9PR19MB9323.namprd19.prod.outlook.com (2603:10b6:610:2e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 09:18:41 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:a7:cafe::3d) by SA9PR10CA0016.outlook.office365.com
 (2603:10b6:806:a7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Thu,
 30 Jul 2026 09:18:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 09:18:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C15C1406541;
	Thu, 30 Jul 2026 09:18:38 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9060682025A;
	Thu, 30 Jul 2026 09:18:37 +0000 (UTC)
Message-ID: <3ae4d88a-20f1-49b0-b5e3-34b2ee37e47a@opensource.cirrus.com>
Date: Thu, 30 Jul 2026 10:18:36 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] ASoC: cs35l36: Implement set_tdm_slot to program
 RX slot register
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        David Heidelberg <david@ixit.cz>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-5-3b66f33859f1@ixit.cz>
 <aktsvw1IrM7ctTxg@opensource.cirrus.com>
 <1348b108-1034-4ab0-a967-972a9456151d@ixit.cz>
 <amsRJMxoCPMZXQfI@opensource.cirrus.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <amsRJMxoCPMZXQfI@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|CH9PR19MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0492d4-7933-444c-c3be-08deee1b8b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|82310400026|36860700016|7416014|376014|18002099003|22082099003|16102099003|6133799003|10067099003|11063799006|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	oDiVTlS3x7PwUyTDcB+QOS2RyLbc5g9RaylGSbUxuPTtLKlR86bMU2toQmJLk3tQqdvpp++Am4kOZBkOCE4ulHKkDqqjiexDI+1lQo/XWqV1DLgyfNlopyf1I9EU2Zhnr/+23bLuULeJXE9sX090VfizvZzqXF3+NcfUOWekLKhhYqArV7gDqLaW5IOzhuFwpmMA9VoNrjq0PRjIdD84Y5hnhVp1Va2eF/Wbk2eeOQd3yGZUgrZqSh+W0Kgq5L/mz5XkldzyOeseggXNyWiWfOrs2BQqe2rbAHNn1u4+hGxyob7GZ03HepK4IuRM1agyzlUlsv4Sg0s8XVGiNIB4wEuh404cwmRYsG6WUhiKKyw9A5Yrz/CITMyIn69iKTuyMW2j2hzD/1qghn9LR8DJfyZFY1ROScMLnxYP94YXV32fW1RL6jklouxlAnpVM+9O2gRW1dDvbWk/vtNO02TqXusEdpahf/AQN/dwTgUgfMRXXrvTB/SJ1qHzTc50WNZThuSiwPuVnMv1EMP/aKz3oCYxf5gLpGyou32FKlOi0JhYaI/N4neKpdt+upVYz0blbricC+MVcCVr2wVK3oCWH9ISKYRK9bFW6utxTdMUNdgCurSsg7K9meZ2hrE0hu+MrlCtAtUJdpGi09pDiukJXJ/SlsSCaD4yiOJsLaWXLdbiwHXRSZh9EIwVJpWCpGEhhjJxfBj4sIQQJ1QXmhZQkQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(82310400026)(36860700016)(7416014)(376014)(18002099003)(22082099003)(16102099003)(6133799003)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zFD8LcgrY1cM02e0g4aKP654H3jLdeoheCGMnhgTfLHUiXEthoA8HaYO1J8LG1vrGz5M5de9L26vE0RPRvcPkyEYB8++NeJpxZV8EJ3YuYgMJzIR9rGAfv4DsJfhXKKk0Nyb6cg/sPMZm9Ew0L/qcn4RQh2Nfv9sFvHs9bdHh1/34y75m9b5l5fOuMNMKS8OzDiQYSvRd4EEoAmhVR6Xml8wsDU1ywXx25E8LoeWY5SUMPKeV7FMJ+jHI8JIuKtercTeGCT+oeV0I5lWOjtG3Ar03AcwMhuTau+Y09OroCpEXJ5DKK+96MEXfQ6z2PkzSrhjmuftaawbt7FLEGjJMDoX7cn+slRxShhR7OgKI+9nStzvswWXhVs5smPa9tDNjesWk+I6GSZwqDOxbgeOSgDY7+hzXbuLV2D1ZGqOnJhdOQtR3LHoaXKfNLG9kdR6
X-Exchange-RoutingPolicyChecked:
	G12UuG+FnbI4Pj2vNYpxBt81JzcyznjygYm6eLO76YSTDP51h5JknW8CpVIdd7zXC/JtJJDeTla9OpOw72MSncOyp0Dd+A46c1t06oc98M1OPjxy0G5EgZJnnJYZy0UizZj9eNcOUzDnHmgVdzHd85vl2lkKBetuLVBU8cQjBMRuni5r7Yot5PUx5dbHNSKp/p4448O41Xcf31Lh7dDP2Qfmlw5Xv6GjtvLTN5RXmV6k5+D7XePxtyywH2ipEb3Z73+W/LppB6HJQH2KaHCpv81sntO3BPrpP6qsS00E5TPw0XXkvavttTHdKaIiICHGKhtOd/OC6cV5BOnE9hc2Nw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:18:40.3286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0492d4-7933-444c-c3be-08deee1b8b8c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9323
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OCBTYWx0ZWRfX8ZGpUJoNAOTN
 kq0gKvDUJ6RhAtfiGFpw/BfkROlCrXota7ZSlB/fiE+QI3C7MGFojCvhnsHOSy8al0uQ0Sg1Vi9
 9zPvAzLeXlcR9WYAMOaWjkyPtCwEaaoSuKDgT8D7hjUpZIeMBMSAtEfZpwaTohHY+F0CQ8W+7WB
 ibIxMIP7gboltuuWqxptxPXvrPLrHG/Iv+IQS3lj/VBjx1y00l9e++LXHSn5aD2D0Sg3m1LGkiW
 z2mHMXT5cKxc/2p4tnBU5QulNwS4hbCWzHVV6UOISqCy7Xu/DIaZVv2c+WRPRQuC6OOUqNJtCZM
 ocXwi2tuu/QV94939SkEHL/KLtramZptWjyA9y31TePSR692w1JkUZWpqzV4BjVc8KYz5hezvN0
 sXMYslU+gBirP5V5jZ2yzqAl2BRmzVSjFEBLpvSNXYk9dkf9SwMEPs7yYxVAstwM72Qt994kkUS
 wE3jwd4QY0Ieh7cuh1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OCBTYWx0ZWRfX3r1vEOVBTkL3
 1jWOzb1Ki2PgxNf4o4Mp9HZgYTzlC9MHUouvUPw2JQQpvTVt5JSHLihpgX0CXqKHqVu5uTNYs7q
 LQvWPW3V+yfhGn+qg1CIZwsJT2AvqMw=
X-Proofpoint-ORIG-GUID: uQ-wciYpsQYNfgSD-DKF75I2lmoynE-N
X-Authority-Analysis: v=2.4 cv=OOIXGyaB c=1 sm=1 tr=0 ts=6a6b16f5 cx=c_pps
 a=p4c3Up3QyKVVMVBhHExQxQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=8YGGJw5uPLGaxvb1TaEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: uQ-wciYpsQYNfgSD-DKF75I2lmoynE-N
X-Proofpoint-Spam-Reason: safe

On 30/7/26 09:53, Charles Keepax wrote:
> On Wed, Jul 29, 2026 at 08:22:42PM +0200, David Heidelberg wrote:
>> On 06/07/2026 10:52, Charles Keepax wrote:
>>> On Sun, Jul 05, 2026 at 10:06:55PM +0200, David Heidelberg via B4 Relay wrote:
>>>> +	if (rx_mask)
>>>> +		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_RX1_SLOT,
>>>> +				   CS35L36_ASP_RX1_SLOT_MASK,
>>>> +				   ffs(rx_mask) - 1);
>>>
>>> It is more normal for the masks to specify the slot number rather
>>> than the bit number, it would probably be nicer to stick with
>>> that convention even though it will complicate the code here a
>>> little.
>>
>> Thank you, is there one of the cs*l* series which implements in similar
>> fashion as requested?
> 
> sound/soc/codecs/arizona.c, sound/soc/codecs/cs42l43.c or
> sound/soc/codecs/cs35l56.c all implement set_tdm, those are
> probably reasonable inspiration.
> 
> Thanks,
> Charles

Worth noting that it's not mandatory to implement set_tdm_slot().
If nothing needs it this is just adding dead code.

However, cs35l56_make_tdm_config_word() is probably what you want
as a starting point. It uses the mask to indicate which TDM slots are
active and assigns those slot numbers to consecutive RX/TX channels.
But the register layout of the *X_SLOT fields is different on CS35L36,
so the code will need some adjustment.
