Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946A114ABE;
	Thu, 18 Jun 2026 21:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781818772; cv=fail; b=ML/2y8AXqI9vZ6bhlGL3syiU7C+Y2iQZuVfoycyzFReJ+MYm42dgImDlw1zXVyuLeHC9YJNlflfUn2t6JixMO4oT/4pfxbOAmJIFA97YB5n9hi90dHnpORB+0tAEmoHLSa58kaz/qIygI8NS4NwYFy3s+wWl59DwNt2WpmS5DEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781818772; c=relaxed/simple;
	bh=RNVW1M3UvG+kxRVuF3j7ZhHlB7iHDwF1gxdOmZW8E/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pn0FVrSYSQ4sSjXDcLJ5fmejJs+n9OYaupx5cHy+9+qU93yLu5eBlH4s8E0+wcMbn47gghXcsWA9MzcPYRLHvZB+5i/p/j0TDtZ6x4zdx54BasRGWAgxxayaSJeJmzGoHWrS8XzuB2VXH4N5Hv1MHMbvPkaYLB9sGEGJG4lwIwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=COgEHa4v; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HFWkC2rG; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="COgEHa4v";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HFWkC2rG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IEnrE21187644;
	Thu, 18 Jun 2026 16:39:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=1CxId+1D6Uy7yQIM5V56kVHagw5cqju7wthEUKQrark=; b=
	COgEHa4vEXL0D/n0FWQ1WnTlfWifVkfUU1hZloq/u7x9gyNsgWJy1EUfZZJO+ReY
	3Ch9YPBFqDfViQ8oFoaaM9tjXiwgf/2Ks0YowN0eb3CZz677SgzVt1SDrHT/M0hF
	cjMySrHNsejNl/tuP4JzK2wjTazUP0efKAwMcTVznShT4VpcSldcTEz8VS7X+lzH
	MDfGDWMFtIVlNaCfRDsDT6jyYZoal9bbvN/nv9Kr5dQAuu/CQY4PIKJMRVV9aUmV
	Rhsr/C64WctGZFPlSojSfcbEmaLWnv6f519NWxtTi4Qd57jy6nPAG5XcrSEjJK/v
	9UbZvtSorbJdgVI5On79ig==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021143.outbound.protection.outlook.com [40.107.208.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4eueefup35-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 16:39:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvUuxZNzGsNXyJY7cx3rreKVdBDj2DDzCj4M0s2keLndSeUu0p3fkwjY5zHcaLYpJz+rmOUkClSrcKYiHlNBt9OCH0X9Ck0H43nYKvHzTcUNLifVSpiIHKgrOYrVz71nnhOz6qp6lmVz56R5DnMmEp2P93MLwFulFydEw5KD+JJYG39hzxXjCytH8MDlq1E9oDN1LeDt3yfYmxyTzZGadazorfkNVwLYQhReXQpWwxfz8i7XHZtrhWO/oqx5jh7w5hJBrby4yytnkgu2hLkIEZj6Le6q3o13Ai4DlXQXR3f3y0yuJY5hx7HP4hSSHTgLhbwjM3CKXWYfREmLPZV6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CxId+1D6Uy7yQIM5V56kVHagw5cqju7wthEUKQrark=;
 b=k4NY3yJM1pkD4HbDwC8mStgJOSNCat9Mi56SdjcmM3Ot3uw2dqG18AHIO6vZIwX2utLmwHntPwjbrTCUhRrUv+/f/GsRTdRaDVrCR8axkQFSzvDZqZk3LkDchhHCdTDmk7FBhbjGt8aPLW7sy2ptkPEGN+KHb2u0+NxzQZD6aDeo99LQ2A2KK4ZgsOZKcAmCOd3iuMrPhvpv5SVZeH81cCuooKKj9qdsalSW/JlaHcoEL+i0+mSITCyvBYynBR88f0tJYX7+RSA2evSxJMzAEEod9bnnVX97NOTPrH7y4RwzWFDBc0kdAC6fZSLn9UcdFctFVala2oWLmKnj/EtBXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CxId+1D6Uy7yQIM5V56kVHagw5cqju7wthEUKQrark=;
 b=HFWkC2rG70XrcFiKIRFauexOuyQOqhvryCm7XfV3bQSL1Ex9FE3FBU95os6mvjRmmj/LmbvIUB5wtEZQaUi8mX9VTkuJrPZAXmOU4KOzrDAykIN9voFf8AMtfHOMnpHCzvjxiDzX5iLpJNCGxnU1CuZQ0bP311dNphAhtoKX9jo=
Received: from BN0PR04CA0016.namprd04.prod.outlook.com (2603:10b6:408:ee::21)
 by DS3PR19MB9608.namprd19.prod.outlook.com (2603:10b6:8:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 21:39:04 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:ee:cafe::35) by BN0PR04CA0016.outlook.office365.com
 (2603:10b6:408:ee::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Thu,
 18 Jun 2026 21:39:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.0
 via Frontend Transport; Thu, 18 Jun 2026 21:39:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 76963406544;
	Thu, 18 Jun 2026 21:39:02 +0000 (UTC)
Received: from [141.131.157.151] (macMW3KVPQQ2W.ad.cirrus.com [141.131.157.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6A413820244;
	Thu, 18 Jun 2026 21:39:00 +0000 (UTC)
Message-ID: <fceaba7c-2c9e-4f0f-bcca-ea9ac3aa23d0@opensource.cirrus.com>
Date: Thu, 18 Jun 2026 16:38:59 -0500
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] dt-bindings: sound: Convert cirrus,cs35l36 to DT
 schema
To: david@ixit.cz, David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad@ixit.cz>
Content-Language: en-US
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|DS3PR19MB9608:EE_
X-MS-Office365-Filtering-Correlation-Id: 86637c0c-d197-4908-83c5-08decd8204ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|61400799027|82310400026|23010399003|36860700016|921020|18002099003|22082099003|16102099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	E6oGhZlL0GuCslu+GYDgbnA6MvYEBHsPUjujL9iaR0keWS43X8pRcTzoemE4Rkorntls9Q99szSCPKyeeUqki36KeXukE1IWVU9vsHiEoT+oBNCLH6lySHq6yoXoyoZpN96gMx/9lRN/iIaYohklmBOCfnwsh1LhChs/xa6iiLtbEzPiJC2Ci4c5JN5w4SW1CrzgU8qFOi6752CUsyDv1OEjBzWuv1OnVtszuXPfuX7gUguxXxV/ky9Q4hCokQMPs3u1gpG0zYInv/+IUPjHIUe7z/aCy3y/s5tXGluZ94ic12fUAB4rfKjjIzyFpTBKTYvrrB3sAMb4n899VtbgY+Hs33LgP0Vi7pO9s7HhjlLAKBfp3Fidyz+K1tq6LvE8d5aZWyF9qcL770vMBNos6EyXWjJSXD0mLCa2vHx0w+1bDzp+irfAVU3HVbH0Fs0ofZKGlxVUISOPR9X5dCbxtizHcm4svpuIojvrySwtgtVnAMnEMFXohqZabdv06d/adhE9CHzSIz22L0H1EfvfGM9jBVZySrs2waCy6puKRKxcNm70d2JmbOPdQlRDlaWytnQhtsh9t1PPgdRAtvcMEVHJWrMjmR0U1+GPnof4LsAbOjgrlpEBY7mcDHi8P5ltvFNulU8zxx76N6FYZDWImgmp0bGGqdnAThGx42raqq4y6GGGlCZTG/81x5gQguh05n3u8m+R8R2uvLkvKdKvqKplLKbVUBY1OnDSY/ZWLHPaW549T/B3rqCSRsTgvt7x
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(61400799027)(82310400026)(23010399003)(36860700016)(921020)(18002099003)(22082099003)(16102099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fZG+7zVqjsZAkeFc0SpQx2lwLNk2z5eJqYE2tzFJF+NWpl/hdKJvKYCenek4F1EfZnuSESn7EoFrA9VY7AIMuJFeilVARRHBluh4FiSzC13G4rBhbHnFDjG3cX9PjuPeDI8sfQS0peO7xXUVxP8c/Qg2ESFsyqNo40bwLEBDYyqQ1xyOJX5Itf5fcGIWw6zivgPzl1bEzLK6s5LbP3Pju4mx87KtjSHT8lyzGHkNGP08NpoDgwfTvcCPXWADtLhNymwow5tZ7f2i/vIe3k07qBVUQ9CekK9ndLXX8cFFclwiSiW9Ffo69+8NUAQBeFCivnLdEdXro3Q0rKrk4mlpitq5uMj9/epb++W5wKVPJ4bWSWz1fqFdH75OxecXJPRvKlYHVfcEoA4JhMNRcssn7D+S8v85E+es/x1CxSxoghYcNlp1AVr2LmwvwOnZ3ZOk
X-Exchange-RoutingPolicyChecked:
	lobD3boLY/MjzA7oAGzzbRmA40mpfvxyth3YxLatm3CHq2Ts1nM8BIZ0PEpXXZYgR3f+OGNHm93B/zBfZ2tDrmiRZMEqE0eldmIIsrfMlHk93TXprTcS4x+5XJ/nlroj5jgQBoULM36qB8LXVz2ubImCBc1WYceqRvVY8B+XADu6m29R6j6rUmJ/3hcPV81Q9b//syRDkTFmFeAk+ChvceFj44ZOqzVuAtDG1K7nBi0S6b76SgcYLfLR6ZZ8S1PFF/ZtNpDSVol9BybuioAhMmvPub1gRRNdv7c5Oyqp2nygDWJcIlKTMPn2EGJ8aBt0at5GZ9UfMc99kVJr+IEWuA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 21:39:03.8851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86637c0c-d197-4908-83c5-08decd8204ac
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9608
X-Proofpoint-GUID: J_nU_jjuoGr_-cSFYdpbSaL3p4DG7agN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE5OCBTYWx0ZWRfX/40doOz/b5aN
 AX7RriihE+L/TwcJ7wwChVk2kw4ash/uwIHILeWtwld/5wya8BfnTUXiWyyk7GwOZEseYzx6CbY
 IRPfm53yr2ZqAvIgr5oGl1fovkRJjscv9yILPZ6ZLXuI5f6pbQEVTFXhCGLYTSFf3ZZ/qeiLsfO
 1c2yguC5+TddUjQeCHDSu1KDaL/VEnyzbJU6k+d8n2rHB0CSNwGjCkpdEdNxPRFuIqECA7Is5q6
 ocl/KZtyBfJ8uEAPGyh3rEeHvqPwtznS9Sg3Oe3+AN4n+MNtH86XnyGs3zf4GGqUK2uKly1sSo2
 /UBme3XV2haNH0vnqLxrn7MsDaxLSg4zNkc2qFWymiOoNSlIfbA/GV5pj60sY1M9YXokABFRZ6J
 nkOIJyiewOsRTGeHKJhrkMmCI6r7lpmG/nTlJFMJlk93wkfbbzYPipMpbvsEbEpTWG/dWIMWMro
 iYkLL9qyWu0NUq6smag==
X-Proofpoint-ORIG-GUID: J_nU_jjuoGr_-cSFYdpbSaL3p4DG7agN
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a34657c cx=c_pps
 a=QMhPzt4RVFymwNJSNtbcTg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=qBJkqHCPK3DLCx5Zf_sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE5OCBTYWx0ZWRfX0LqvyY6WOIHa
 wI8C8dK8+g2q1yhcEvHFABMdDTGLU8UZXCaaOr0H5zNIgg2BPfcd9X8ezeFT8CawM6rVILpJTpq
 NR1R5lYRq3E/0PUEz+t2kuSQFpOabTA=
X-Proofpoint-Spam-Reason: safe

On 6/18/26 9:33 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Convert CS35L36 Speaker Amplifier.
> 
> Changes:
>   - maintainers email to the generic Cirrus email
>   - Both the codec and downstream worked just fine without
>     VP-supply provided. Align with datasheet for similar models.
>   - add dai-common.yaml to cover for '#sound-dai-cells',
>     'sound-name-prefix'
> 
> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: David Rhodes <David.Rhodes@cirrus.com>

Thanks,
David
