Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7583A364028;
	Tue, 23 Jun 2026 22:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252033; cv=fail; b=qGCDhjivST8y1VKxnuHzPdQWsU1rJD9D5Y9RqYrUCdzMOp123cz62n7pqP4oCRKNBVgkXEexh48bH9Q9v7CPGBjKa57Io7e0jbtZHYyPuI3tu1cFg1kljxUAtnkBpONE54AXAHQFbv6yFQ8sbCiz138PxCSQEVpbV5eXlgZI2UA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252033; c=relaxed/simple;
	bh=okm0hfG6cGOSBr19c9uJuCgKMkxmcZa0y7oH5LfReb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uB/usf1sNF1ZpNH96pMrPMsdbAu63ocfiXHoTJQcmIJe8xLlJ9OlAbq+XUzNGutxIIWJBwlo50C0ZF6Hv8abrQhtC3J8LcQbebXvoSA41pmkFp+eUK0ofQWn6yPymWO3gPZqqrqgXJ/AGXchh0JM86WiGk1gdyC98KTnG/d9FCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bvHSr6Sz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=nRQQWv3S; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bvHSr6Sz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="nRQQWv3S"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NG1HZg437816;
	Tue, 23 Jun 2026 17:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Qwkq96oy80PV/qlNPhg+R9AI9heobfmqIrKSj/xXqRI=; b=
	bvHSr6SzQUrEBn8EAArONFeK4Pucts0XG6RgRs7SAF2t0rlEeB09a5BHaeBmHzdL
	z9v2JBjdVfb2qp3fqFSSyWNYnT3rFr71WM+2YPv9ic8btheG9ZJvRQx97WjSiSvc
	JN9szXgRVLu/wA1fI3Co0dNl5bYKveUH1fve7lECd6ozyi8Vkq+63mLVnwnVwPpm
	lEw+cHb56QHU6XNz6l4HK13mRWJCfjHVAP4qdy/7AcEF/oPdCDTKLPIoyF1mPZ0i
	PZ1QMCwG8dOXXgn2sXWDZoyfxnYOUBgBDmOWrWDx7hBTgMGLp2NGDGnXufPbAY+r
	YlrbPnGy6t6Z3HAUW0KqAA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021117.outbound.protection.outlook.com [52.101.62.117])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ewr8x480r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 17:00:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpHqMp7OFJ01sZXmnO4gNRk7IvF6OByUC/Oysti+bJYHs8uvIhoKY0aHxHkwMz29Hz52db/iiFVaketo8Y6hN7fXXPyeY5GcCOwOszEbhpyrZlZ0dJwidfInrYjI+eAf3AU30psdCD9INJO00o2O9vBksbXAeEZayhxMlmZBJCGLJiNwP4hql659KhIBMofbIjuFD6zv2Fcq9QU8Vtgo5pNFR7MWX3/rEscSPcFUwSSKRGVAF7m5+4pf8296oz+S0XH6fdpArX9BZi0EjLuDoz5j+qdWC/FZbcZFA3hnnhoTGINIehnAffgf1fh+ZngJf6msQxDNB94cnobOw5/JZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qwkq96oy80PV/qlNPhg+R9AI9heobfmqIrKSj/xXqRI=;
 b=f1pQQq2dSUUjmqoGrCw4R04wOJ1oiMiaYzvhbWJIhx+pvayg69hsWZZEOB4Ku5Wi4/bSIQ7k0UxpdHMSH9ZkuCuFDmnzTAuCLX1/ChEjnqG1jye1L3aYgoorSkp7K4YO+148LSi5su0A7iR25y7xk885cx+CTeuhRNa9P8L0VElTDsEqGEkzcWL4R8G8hEqmZni33n4jaW3+EdJXNDCtzY71tyiflxaEIjjbqmuWZBIOV8plx6CbRnQwMq9xr9Sg1fB+KoD/0W2Ad+a04KGvic1SX4KQ6jcDpuB9KDj2vl2ZBKgtsGEBl5ft3EbeJo7CLx8Xvu2z/E+dP9+uc/rDMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qwkq96oy80PV/qlNPhg+R9AI9heobfmqIrKSj/xXqRI=;
 b=nRQQWv3STsVWOA9w+aI5cJxijaWen/XNmoVB+8JD9Ixb2RzVebyT+pdcgUFyvFV50hBHR1eYD191ZdJeuFNYo51Zu4SGr5XF5ineqM2dPCxQi4aewW5rWS5VPk3VzN6m6vFrto82fZvucTtP7d+IDqoLQJbc67WulhS29o9c00E=
Received: from SJ2P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::9)
 by DSVPR19MB997475.namprd19.prod.outlook.com (2603:10b6:8:3bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 22:00:14 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:5da:cafe::a9) by SJ2P220CA0012.outlook.office365.com
 (2603:10b6:a03:5da::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Tue,
 23 Jun 2026 22:00:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Tue, 23 Jun 2026 22:00:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 72D92406541;
	Tue, 23 Jun 2026 22:00:11 +0000 (UTC)
Received: from [141.131.83.83] (unknown [141.131.83.83])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 44AE5820244;
	Tue, 23 Jun 2026 22:00:09 +0000 (UTC)
Message-ID: <91aed877-3749-4abe-98e4-b1ef1bdc1320@opensource.cirrus.com>
Date: Tue, 23 Jun 2026 17:00:07 -0500
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] dt-bindings: sound: Convert cirrus,cs35l36 to DT
 schema
To: David Heidelberg <david@ixit.cz>, David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260618-dt-cirrus-cs35l36-v1-1-1a43515666ad@ixit.cz>
 <fceaba7c-2c9e-4f0f-bcca-ea9ac3aa23d0@opensource.cirrus.com>
 <513dd76c-586e-48e3-8542-5f42d35c7929@ixit.cz>
Content-Language: en-US
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <513dd76c-586e-48e3-8542-5f42d35c7929@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|DSVPR19MB997475:EE_
X-MS-Office365-Filtering-Correlation-Id: ae27ed56-f1ef-4ed2-7c8a-08ded172cd9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|36860700016|82310400026|61400799027|921020|6133799003|18002099003|16102099003|22082099003|5023799004|11063799006|56012099006|4143699003|4076005;
X-Microsoft-Antispam-Message-Info:
	d4XyWfxlpdD8I46iYM/6kaJxsxzwzqld1hip22kpG4ixlK8h4rfSXq8z/vGJzBriXB5GV6+9bYawftL1nX7HC16tf7DDBSZRJkNAMzQ0FRtS+7d3UnBP3W/m7PI83SmYCCvAFO9X00iZIn5oxgm74PQbVTJsc62/0cVKtURKy10qhyJBPLP2QAsgJI5dWwkyLAD4pJJ8wxFNDNTQl/RgwDUUd3ZEeNdC+0vn0T9aqi+NmiGBS/NBfE0I1uDnwAg50E2+KK8H6Usy9W5GgmNAPNG1SihWsjmfSM7ZgVkNNZu5PLdfny917QZjqXHKHcI0Lebn+bOsw7ywLET4jU+Zp7aiFn6+xKbnLg+VvOyHMeTjPoUCyM57UIuPN8MrU3aNXhTYJj0rXSOr+1CqwawKUFvlaRXIwgCSF9iIy5RlVPppmIiGKpt7P7t0oZyvYIAHTwpNb/0FztCw6Dxt63DFTtCqAoY569HnGnk2uXSRRRRsW1k7r/8004Gs8CgxKFRHKMRTHp/ZGxZGjS2XEI6loni1FhhYLg23gIxuqoreWm929fPXAkvMl+sLSOzoqtcbpKptcOu5MLC4Bzei2NBrbOTMCCzpVY/u69skDa3TV9DB7cPHMMp9zgWIrwkYztfI+kUByd9CiIUM2ltMc1JtU4yta8PVAXGBnOy6QyxVDdr9fnjVjVq5goZodFGtIygW8xV8c0twOQb/QoOwSIo03ONSXd9S637Tx4Cd+cjsHinKt5LJMNDWQvHaJs9GNJuuj4MaXFgbIcoRXrEcjTi6/A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(36860700016)(82310400026)(61400799027)(921020)(6133799003)(18002099003)(16102099003)(22082099003)(5023799004)(11063799006)(56012099006)(4143699003)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	brhwL+Pya2Ix2NW74vvSoS45FkC0CM+j1f8dU6b/reIQ14/WtaEuNAFNRT/QkOs9bgER2LsUdCM8kfDtoxP7Mroh1UIiSYUnqrnbN6Om4jEb1MLk+2rRIcVXHMgD/+cJlrELyegIk5toh6cR1bdP9DkLnxz66PkMvmffAH53hcR3sGA3rcaAmBAY+Oj0JJRJmYI7ekQK6QIYPhiF7+e/XVOnnLkOv9IVk0Y9iqsGaUM415zlLXjIAOsJkVqmHOSovLDzrcM9whgDnvBfo6lP2cs+WOXlxiM1gEmxQXOMJwD6vIRICC2xdcOWDOSoKMWB87eSACqwwGs+qQTJ1QnwJAlknuXm38T4jNiTJ/zQQ+f+gkmyOmXNHr1dX0Ltn8aVqONHw62WC7e5+SYAfORKGoEi0N/pV+zkMGadk66WeNVIRruNnRjAZlaluhQfKR5b
X-Exchange-RoutingPolicyChecked:
	MEqOLkhuSouBPzwiZz2tk8U1IHgq2igV2iUbPiVgP+YZqm13nhcLlgN+5NkUTo3ksPnT61n3EeytboajJFZcSkFt3wkgH8sltKaptV4dRh+0pV4/gSqM7Ok504vCRN7cewdbsIXB75I/WmoE8Ixq2CF/U32xhx/Eh2tbJyN90Uf4cUm7WrL2C7HvwMStJVNJ5L/dJNPX+zP1rVvenDmZJFkBYY+YfnqdOjCc0O5vQqYXJ9FV/rKD/gXbmwyMd71G2++aAJtRvNOrwWu55WNmKDpbZWWIQ8jZjBfmtELMjNIRl3dw/G/2cIKEOLpxP4rWF0papvnW3fh1ZUuyisz03w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 22:00:13.6045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae27ed56-f1ef-4ed2-7c8a-08ded172cd9c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR19MB997475
X-Authority-Analysis: v=2.4 cv=UJ3t2ify c=1 sm=1 tr=0 ts=6a3b01f1 cx=c_pps
 a=0ugTtL2IYW/sDoruYPcCDA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=Gn0007HXtCswuJJ2utcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE4MSBTYWx0ZWRfX7eQrazUP68S2
 XkfONhVJWal0QCYbGy94JdPfA58TwbfjAh6XAZBtoFVsg4m4p8TvCh9yl84cFORvt2ae1xg1Kkn
 +VJlaAX2CikfnGm3PYhGzory4FHY/lGzhkACBiKuwkHxm3lfBYVezwOqhpHaIFiAgiTz4cPxazK
 1SzE4kGx7aXvvPwiU1lIdtMTCzUr/G9i7XMVlE8W961eFCEMUI5f736gIIYvLc4cvjZEq1B6SdL
 19DG4Pg9fdxW0cnxD9d1NbTBcbJCf/Kh7mw/wBcJIjxx5qqRiHAIXVVjYnE0q8P0Mw6T30xoqtB
 XMK5oFZkbn4A7t5fGz6pj9j8LgmuF1Ix2455rZedrRS3kiUSAZUpvJk0S+7HzR/AmpK5hQuCqPh
 9kOCGJb9ZXXrIJfwbToCz2lYwVigCIhc4B6YpL3XjkKq1WxmwAGIcjtWqHQToXyqVBt0WOY5fl/
 JxIx2c48uF6Z0TUVyQA==
X-Proofpoint-ORIG-GUID: 7NycjZHbMwh01bYSHJeeYSsbQI6XnxBp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE4MSBTYWx0ZWRfX+7B4zV82M97F
 QilL7cHyT+sz1eZtWB8xSjZI2mW3CWJrDAI0EPJru/zKq3P9eiC7COR5hlt70AagDdBLW5xV1n4
 yDakIG9gjS42upxsWUEqkj/HieFtqXc=
X-Proofpoint-GUID: 7NycjZHbMwh01bYSHJeeYSsbQI6XnxBp
X-Proofpoint-Spam-Reason: safe

On 6/21/26 7:27 AM, David Heidelberg wrote:
> On 18/06/2026 23:38, Rhodes, David wrote:
>> On 6/18/26 9:33 AM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Convert CS35L36 Speaker Amplifier.
>>>
>>> Changes:
>>>   - maintainers email to the generic Cirrus email
>>>   - Both the codec and downstream worked just fine without
>>>     VP-supply provided. Align with datasheet for similar models.
>>>   - add dai-common.yaml to cover for '#sound-dai-cells',
>>>     'sound-name-prefix'
>>>
>>> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>
>> Reviewed-by: David Rhodes <David.Rhodes@cirrus.com>
> 
> Thanks for the review. btw. could you please verify against datasheet, 
> if the
> 
>   - cirrus,classh-wk-fet-delay is also possible for cs35l36 (l35 has it, 
> but l36 driver doesn't, thou DT isn't about driver, so checking)
>   - cirrus,weak-fet-disable and cirrus,classh-weak-fet-thld-millivolt 
> are also not implemented in any driver, but present in DT.
> 
> If hardware is capable and the driver just doesn't have impl. it's fine, 
> but otherwise I would remove these in v2.
> 
> Thank you
> David :D
> 

Hardware is capable and the driver does not have implementation.
This would be the register referred to as CS35L36_CLASSH_FET_DRV_CFG.

Thanks,
David
