Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945CE3033CC;
	Wed, 24 Jun 2026 20:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782331594; cv=fail; b=dVa8ZFH3Xx7/+9ojLh/NB/syHEAFLM+62tXMNkAaRJFMdLg/HzxgHrX9GIyXS5n6XVW0hJDm5waVyLi1+NAOA4z+kENzniHFGi1kaqfm19VUsWUng0fIFj3ABCySlq0ilNtaOEXrYMEAtd2Cv2IZTxll2LwTPZt48wEj7/1ld24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782331594; c=relaxed/simple;
	bh=XWSIOvzYVocQq9YITVhdCpL5fGPOOo7tt9zrajy5aAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJ57/H+U0IGdQBjbEQVu5mPC5fgmT6ip1G6YjsIY4M1O2ZLKJ0z7efP6rRVQZCBq5I11Dx30LKuyzEgK3mTtwBkn5MKTUEgpEGqV013gLBeNj5PScGEVVkDxAwOOC71dK/OY7AN0WeVQbl8/RqxjpKqOLLzxWTec8aavBbeSOv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O0O66zWS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=VCFyvw0w; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O0O66zWS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="VCFyvw0w"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OK56v13200009;
	Wed, 24 Jun 2026 15:06:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=d3DnSFwHi6D/Ck9sY3fcqs0OT5rkhdysuIPiyK4UhfA=; b=
	O0O66zWSFVpOzVxq8YmVCh/yM1hzI6t/mNO4NbgUXra0jlsP+kVtIcMfaaL4Mr/f
	iaEMUOt7R2fcZf2mM8AzlYaWvLPKBqRHckt3E4Y1Caeuw/j9W6XKV2k9pi4c0ke5
	+TH0p3svXbn6SgwO7SphIhzi0g7C30VCBmNhwcWGBBRc2wr9DjvbaKXdZKjI8PW/
	T/C96gZnQD4ocBOKWvB7jabo2CEnb0LC3I40UaoHGLb0nD2Y6bmldcIiMh/OrLOe
	V5uBHVHoCoqZzx9Owz4OVPu8gLJ+ptqVLTDHx0xhwOAr6CRYpAoa8dO3aOKB7nzu
	XP68FcAQoaNv2tiUi3/xXg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021086.outbound.protection.outlook.com [52.101.62.86])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ewr8x5nw6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 15:06:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTzTg3M5qzz/dn3YfAsK3+3yFg3Cylzs0BgTk6McRvyXUw8PRudIfIz3tRIizpvjnBQgby8oyltxvOuEM3d1+eKrEPgyiDizZZqCn5AwZy57whB3cesdC3rxfTasEMeDtjvTzy2bDnJDi3dpmH+dr/C2xVYmQOPJG6S3eTkHSbr7SJhFOVMgvyBOFK8PNhJo5zyc0mfOYGS/ko88Ce0wRORCA4ZAfUGTbjGIoc7AdF0isE4g876Dk4y5D+z+oXk2ELT/okPeIzLXaWBxLhjli5TxfbmzF91IUca8JHabGIpO2ELKDiropU91R0pQ+4pPI+GVAyaRJjjKJmpmvoH6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3DnSFwHi6D/Ck9sY3fcqs0OT5rkhdysuIPiyK4UhfA=;
 b=G+eNdlns/gdns0rZhbOmkwX3dhr3BowOjRasUvgoRpbovUZ0D6utOkftKgDOIYQXe5KKWkJ56KaIWmgjLIspqJ/XBzQDqDOcaaZ9bSOIhvrVehf/d262/TAvLNA36yVbbd3coHoOq6t2FG6iAQZem9l3qxlN30gpYAviSSA+mKrAyM8bZ8uSJmlC3AMHVUCUj6RGbUViZl4awdPu22RKkuDxEwVuL/enisDHlb1Wuvob75rPorJhH5ARqfLptYrzOeiXE9zqI563GOmJNv6BjYSzCZDq4VhORgT2zSZhlfSm0qQyLG8VQwPYb4U+EQPpYDl7XQ9TN8AeuadOrUJOmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3DnSFwHi6D/Ck9sY3fcqs0OT5rkhdysuIPiyK4UhfA=;
 b=VCFyvw0wefxgEroIfCxCbywaQ4j+ZxD3tfYyZ11IjXrhHTovheA81cNydOtycpOh9DW3zDxaFHVAD99GEZQENrKfu3ckV6iXfE4qN21gMpXEIWdg6TkVfC5mxvXR/QX2KXlxVSb3QzioCNSuAsN0vD3Nox6IrUYVG+pDcfiJXNo=
Received: from PH7PR17CA0027.namprd17.prod.outlook.com (2603:10b6:510:323::13)
 by DSWPR19MB997312.namprd19.prod.outlook.com (2603:10b6:8:36f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 20:06:03 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:323:cafe::3d) by PH7PR17CA0027.outlook.office365.com
 (2603:10b6:510:323::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 20:06:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.0
 via Frontend Transport; Wed, 24 Jun 2026 20:06:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DD3C9406541;
	Wed, 24 Jun 2026 20:06:00 +0000 (UTC)
Received: from [141.131.157.6] (macMW3KVPQQ2W.ad.cirrus.com [141.131.157.6])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E176582254D;
	Wed, 24 Jun 2026 20:05:58 +0000 (UTC)
Message-ID: <81f4c4cb-8aac-47b7-8f22-f120c6af5140@opensource.cirrus.com>
Date: Wed, 24 Jun 2026 15:05:57 -0500
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: Convert cirrus,cs35l36 to DT schema
To: Rob Herring <robh@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        Bjorn Helgaas <bhelgaas@google.com>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260624-dt-cirrus-cs35l36-v2-1-74eccdbd8fe4@ixit.cz>
 <CAL_JsqLE8Z-LbeF9r=sqRqAoGUcs7R-T4cN+hF3QzjGydHctgQ@mail.gmail.com>
 <3873b111-36d5-442e-996c-31d05d23c8e8@ixit.cz>
 <20260624194541.GA672824-robh@kernel.org>
Content-Language: en-US
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <20260624194541.GA672824-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|DSWPR19MB997312:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c149a08-5572-41ee-765d-08ded22c0452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|36860700016|61400799027|376014|23010399003|13003099007|6133799003|18002099003|16102099003|4143699003|22082099003|56012099006|5023799004|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	jWDMPGgGVEywhLpWDCURqoXGQzE1jeWwM/jmcxTF0uppZBfLTbEeaADZQSQP5yLoYpz3Ipib5/hOYW6dtG2kZMapdqb772epmmYUITndQLS1J6MxAzgZZvb94BR04p4Hb0B1BkhGvEtyIKIGS6lTkA+Tjt2ZqhtW5ZO0tHirvm0qiFwnXVVXVqAbgCrSFBcCZ0bsHmZsjtRkpHDJnKg/7lF/yDSK+UODYFN9FN5Ho+8BOwG0Q3k4gG6kpMqOC3kaAGuQwErpMbz33WB9JpPzGL4dzNWBXxiGD138nuTtBTsixvpzssZdfHdEw3/AlBfoJKx+d/C5t/gB9hCMT6I9r1cRPDtRB09zdPzphCVlyvOuwkAACkx/bYmUS5leDTU185hQ5js9ShBkJW4wVY/HySF7a/jMDuQznZdL4HjvrncjmXhMaOymuNVQj0mbtLkgYA650Mz7VU8T6MZ/IVmNN91gVqqgqQQYRAtScyJ58+K7X0CTHt/E7i0pZEyguodvAsiDgyA8SARrRzHt6RZqIcepOt6gt+9otNmp5vgMP59Ji9s7DVknojGmBN2h+BcZ/ZqenJUHBxwFdzZeddY9HSlUEaKB3a+b+PTELfx5dnJ7riQ6Xk7UPSemvdCAvAtD
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700016)(61400799027)(376014)(23010399003)(13003099007)(6133799003)(18002099003)(16102099003)(4143699003)(22082099003)(56012099006)(5023799004)(11063799006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bXAQ51WJ6n98mhmYXX3Ay/+FX4NF7HkTXfCH5dwwbXNTAKOJUkZAWpt8IBt7/rvEC0rIgy7ib3OKZK7lc9s0QrHTmRdYLiVz3Z0pDE19/CN72dd30rioG+xwKQyrnLUzCfAWD57oywFXfC8Ga7QbFWKI1ml8+HqESaLiuhQO5Gf5i7xOlZiCz1cZ9aWWH4PVnTVNm2wQwkUQyXUXlS5ttYVKF+8FCW+FjFtFrtvVlOTP23ZaUre6V/6cl0nzBRm2m4Oy9VgyyLMnnNFKqJ05KbJHljncNdsLRQaXw7NG8Aruhb44Db7V0b7hM3SC95dAnPkJmg06KkKsimM8uiMDLaB0BT5XjIjVrUgwGzMoaJkUl7jOg7aBgRZo74KyprRiP0hUmAmHUe7AwEFullwJfzivdFl3Wh5Ucgm4jR7pXtL3ABs7abjXynIILAYCIpMU
X-Exchange-RoutingPolicyChecked:
	HMjfiipyQ86IqPuTavr3x0e4qXAxh2PzEgSnIwcYvNc8KI5OZsf/4YCq12PDs40HHfpzJpiawRxhWSVgpw1xhlWC3IM3COdMlBhl0n/h0ECeGo0ELuPtS+u8GlI+6rjwdoHodymeinwWfgYt0yXRQbCgr0emlpK78iP21y8HtOe+ePQ1kcAlAKO5+U9brjFjhzkUrJ7KRYGh+jejXlalNqWQggjVXzmEl6wt0gF96ht0LGHgrLdimPPoXRE/x5Crp3xCssqa7MPUgj8uGG4QBqj5HQFkBxRp4fM3X8ht5KtPQlL1vik/lqOj9ntWb9X3nvTNxPOzkhgO3JFmdwKLxQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:06:02.2875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c149a08-5572-41ee-765d-08ded22c0452
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR19MB997312
X-Authority-Analysis: v=2.4 cv=UJ3t2ify c=1 sm=1 tr=0 ts=6a3c38b1 cx=c_pps
 a=8tnDOA8lvRtpcZOACi+KGg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=w1d2syhTAAAA:8 a=1XWaLZrsAAAA:8
 a=cK7jlWP-69UI-gi1xc4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2OCBTYWx0ZWRfX322ahRq295ce
 JbcRaLfGdc/TRHB2sAQJ6rBv/pr2nhjpwwIg8uK+tvvHka9QnRreUCSq5tZfGexMVuQVdmMQaqF
 5agZIshhFAIr8IQcbFpGlEoNDIlps9A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2OCBTYWx0ZWRfX1i4Yfm3crWuI
 E3IQYTO+2Uz9Jct+kahMslxuJP9L+SXNGL4Xu9uy0I56XIrNwyu2y3R1sr3ISsax/o/Fg4cYLZO
 8/Dp6OcFGzyuxBty/r1sONexKb2ezRupDq8Ws/sNtl3zTz3MTvXMdrNy2VOFLJBAwOknwTRpWxi
 eqPTla8/0iQdcunXtcwFpINc/qGqkk/KvlnPn/xNtEC3etI8/ZZ83EdO7sQB3bf+fRUIe0gUyqi
 7ldYyi/yx+kMjSF3iAD/2bWrBrLS6NxvFmlBYJlkikAiWb3sbfS1tboK0F5+UzzAUJTCo2cdrAH
 e0DVX9HRaO4wUmpIwulo1b9Oajw+UGbvhxKLw8G7eOX0dilQNF/ov7vZGjt7ses3hZSIF6rJDAL
 GOiAcLT0jXdPY9TbGpRxus3nQdgzcQ==
X-Proofpoint-GUID: KIm5mMqbyk0bLMkAoeJEzga-XGRtTaMe
X-Proofpoint-ORIG-GUID: KIm5mMqbyk0bLMkAoeJEzga-XGRtTaMe
X-Proofpoint-Spam-Reason: safe

On 6/24/26 2:45 PM, Rob Herring wrote:
> On Wed, Jun 24, 2026 at 08:39:28PM +0200, David Heidelberg wrote:
>> On 24/06/2026 20:17, Rob Herring wrote:
>>> On Wed, Jun 24, 2026 at 11:02 AM David Heidelberg via B4 Relay
>>> <devnull+david.ixit.cz@kernel.org> wrote:
>>>>
>>>> From: David Heidelberg <david@ixit.cz>
>>>>
>>>> Convert CS35L36 Speaker Amplifier to yaml.
>>>>
>>>> Changes:
>>>>    - maintainers email to the generic Cirrus email
>>>>    - Both the codec and downstream worked just fine without
>>>>      VP-supply provided. Align with datasheet for similar models.
>>>>    - add dai-common.yaml to cover for '#sound-dai-cells',
>>>>      'sound-name-prefix'
>>>>
>>>> Reviewed-by: David Rhodes <David.Rhodes@cirrus.com>
>>>
>>> If you are going to take stuff I haven't fixed:
>>>
>>> Assisted-by: OpenAI:gpt-4
>>>
>>> (I don't remember the exact flavor I used)
>>>
>>>> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
>>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>>> ---
>>>> Relevant for Pixel 3 / 3XL / 4.
>>>> ---
>>>> Changes in v2:
>>>> - Rename the commit. (Mark)
>>>> - Link to v1: https://lore.kernel.org/r/20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad@ixit.cz
>>>> ---
>>>>    .../devicetree/bindings/sound/cirrus,cs35l36.yaml  | 224 +++++++++++++++++++++
>>>>    .../devicetree/bindings/sound/cs35l36.txt          | 168 ----------------
>>>>    2 files changed, 224 insertions(+), 168 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml
>>>> new file mode 100644
>>>> index 0000000000000..af0acaaefb68e
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml
>>>> @@ -0,0 +1,224 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/cirrus,cs35l36.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Cirrus Logic CS35L36 Speaker Amplifier
>>>> +
>>>> +maintainers:
>>>> +  - patches@opensource.cirrus.com
>>>> +  - Bjorn Helgaas <bhelgaas@google.com>
>>>
>>> Bjorn is not correct. Generally we want a person, not a company list.
>>
>> I'm adding back James, can I keep the patches at 2nd place?
> 
> Yes.

Please put me down and the patches list as well. James will not respond 
at that address any longer.

> 
>>>> +      cirrus,vpbr-thld:
>>>> +        description: Initial VPBR threshold voltage
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
minimum: 2
maximum: 31

>>>> +
>>>> +      cirrus,vpbr-atk-rate:
>>>> +        description: Attenuation attack step rate
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +
minimum: 0
maximum: 7

>>>> +      cirrus,vpbr-atk-vol:
>>>> +        description: VP brownout prevention step size
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +
minimum: 0
maximum: 7

>>>> +      cirrus,vpbr-max-attn:
>>>> +        description: Maximum attenuation during VP brownout prevention
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +
minimum: 0
maximum: 15
this is just an integer dB value

>>>> +      cirrus,vpbr-wait:
>>>> +        description: Delay between brownout clearance and attenuation release
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +enum:
- 0 # 10ms
- 1 # 100ms (Default)
- 2 # 250ms
- 3 # 500ms

>>>> +      cirrus,vpbr-rel-rate:
>>>> +        description: Attenuation release step rate
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +
minimum: 0
maximum: 7

>>>> +      cirrus,vpbr-mute-en:
>>>> +        description: Mute audio if maximum attenuation reached
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>
minimum: 0
maximum: 1

>>> Constraints on any of these?
>>
>> Code just applies whatever is thrown at it, maybe David knows more?
>>
>> #nodatasheet (but would be lovely to have one)
> 
> Unless the driver just takes these values and shoves them straight into
> a 32-bit register, the driver should give some clue about the size or
> possible values.
> 
> Rob
> 
Got some constraints for you.

Thanks,
David

